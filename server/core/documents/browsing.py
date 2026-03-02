"""Document browsing menus for the PlayPalace server."""

from pathlib import Path
from typing import TYPE_CHECKING

from ..users.network_user import NetworkUser
from ..users.base import MenuItem, EscapeBehavior
from ...messages.localization import Localization
from .manager import DocumentManager

if TYPE_CHECKING:
    from ...persistence.database import Database

_MODULE_DIR = Path(__file__).parent.parent.parent
_DOCUMENTS_DIR = _MODULE_DIR / "documents"


class DocumentBrowsingMixin:
    """Provide document browsing menus.

    Expected attributes:
        _db: Database instance.
        _documents: DocumentManager instance.
        _user_states: dict[str, dict] of user menu states.
        _show_main_menu(user): Method to show the main menu.
    """

    _db: "Database"
    _documents: DocumentManager
    _user_states: dict[str, dict]

    def _show_documents_menu(self, user: NetworkUser) -> None:
        """Show the documents category menu."""
        categories = self._documents.get_categories(user.locale)
        items = []
        for cat in categories:
            items.append(
                MenuItem(text=cat["name"], id=f"cat_{cat['slug']}")
            )
        items.append(
            MenuItem(
                text=Localization.get(user.locale, "documents-all"), id="all"
            )
        )
        items.append(
            MenuItem(
                text=Localization.get(user.locale, "documents-uncategorized"),
                id="uncategorized",
            )
        )
        items.append(
            MenuItem(
                text=Localization.get(user.locale, "transcribers-by-language"),
                id="transcribers_by_language",
            )
        )
        items.append(
            MenuItem(
                text=Localization.get(user.locale, "transcribers-by-user"),
                id="transcribers_by_user",
            )
        )
        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "documents_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
        )
        self._user_states[user.username] = {"menu": "documents_menu"}

    async def _handle_documents_menu_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle documents category menu selection."""
        if selection_id == "back":
            self._show_main_menu(user)
        elif selection_id == "all":
            self._show_documents_list(user, None)
        elif selection_id == "uncategorized":
            self._show_documents_list(user, "")
        elif selection_id == "transcribers_by_language":
            self._show_transcribers_by_language(user)
        elif selection_id == "transcribers_by_user":
            self._show_transcribers_by_user(user)
        elif selection_id.startswith("cat_"):
            slug = selection_id[4:]
            self._show_documents_list(user, slug)

    def _show_documents_list(self, user: NetworkUser, category_slug: str | None) -> None:
        """Show the list of documents in a category."""
        documents = self._documents.get_documents_in_category(category_slug, user.locale)
        if not documents:
            user.speak_l("documents-no-documents")
            return

        items = []
        for doc in documents:
            items.append(
                MenuItem(text=doc["title"], id=f"doc_{doc['folder_name']}")
            )
        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "documents_list_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
        )
        self._user_states[user.username] = {
            "menu": "documents_list_menu",
            "category_slug": category_slug,
        }

    async def _handle_documents_list_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle document list menu selection."""
        if selection_id == "back":
            self._show_documents_menu(user)
        elif selection_id.startswith("doc_"):
            folder_name = selection_id[4:]
            self._show_document_view(user, folder_name, state)

    def _show_document_view(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show a document in a read-only editbox."""
        content = self._documents.get_document_content(folder_name, user.locale)
        if content is None:
            content = self._documents.get_document_content(folder_name, "en")
        if content is None:
            user.speak_l("documents-no-content")
            return

        # Get title from metadata
        docs = self._documents.get_documents_in_category(None, user.locale)
        title = folder_name
        for doc in docs:
            if doc["folder_name"] == folder_name:
                title = doc["title"]
                break

        user.show_editbox(
            "document_view",
            title,
            default_value=content,
            multiline=True,
            read_only=True,
        )
        self._user_states[user.username] = {
            "menu": "document_view",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }
