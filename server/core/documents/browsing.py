"""Document browsing menus for the PlayPalace server."""

from pathlib import Path
from typing import TYPE_CHECKING

from ..users.network_user import NetworkUser
from ..users.base import MenuItem, EscapeBehavior, TrustLevel
from ...messages.localization import Localization
from server.core.ui.common_flows import show_yes_no_menu
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

    # ------------------------------------------------------------------
    # Dispatch helpers (called by Server)
    # ------------------------------------------------------------------

    def _get_document_menu_handlers(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> dict[str, tuple]:
        """Return menu dispatch entries for the entire documents system."""
        handlers: dict[str, tuple] = {
            "documents_menu": (self._handle_documents_menu_selection, (user, selection_id, state)),
            "documents_list_menu": (self._handle_documents_list_selection, (user, selection_id, state)),
            "document_actions_menu": (self._handle_document_actions_selection, (user, selection_id, state)),
            "document_settings_menu": (self._handle_document_settings_selection, (user, selection_id, state)),
            "document_title_lang_menu": (self._handle_document_title_lang_selection, (user, selection_id, state)),
            "document_visibility_menu": (self._handle_document_visibility_selection, (user, selection_id, state)),
            "document_categories_menu": (self._handle_document_categories_selection, (user, selection_id, state)),
            "remove_translation_lang_menu": (self._handle_remove_translation_lang_selection, (user, selection_id, state)),
            "remove_translation_confirm": (self._handle_remove_translation_confirm, (user, selection_id, state)),
            "remove_translation_title_confirm": (self._handle_remove_translation_title_confirm, (user, selection_id, state)),
            "delete_document_confirm": (self._handle_delete_document_confirm, (user, selection_id, state)),
            "document_edit_lang_menu": (self._handle_edit_lang_selection, (user, selection_id, state)),
            "add_translation_lang_menu": (self._handle_add_translation_lang_selection, (user, selection_id, state)),
        }
        # Include transcriber management handlers.
        handlers.update(self._get_transcriber_menu_handlers(user, selection_id, state))
        return handlers

    async def _handle_document_editbox(
        self, user: NetworkUser, current_menu: str | None, packet: dict, state: dict
    ) -> bool:
        """Handle document-related editbox submissions.

        Returns ``True`` if the editbox was handled, ``False`` otherwise.
        """
        if current_menu == "document_view":
            folder_name = state.get("folder_name", "")
            if self._is_transcriber(user.username) or self._is_admin(user):
                self._show_document_actions(user, folder_name, state)
            else:
                category_slug = state.get("category_slug")
                self._show_documents_list(user, category_slug)
            return True

        if current_menu == "document_title_editbox":
            text = packet.get("text", "")
            await self._handle_document_title_editbox(user, text, state)
            return True

        return False

    # ------------------------------------------------------------------
    # Helpers
    # ------------------------------------------------------------------

    def _is_transcriber(self, username: str) -> bool:
        """Return True if the user has any transcriber language assignments."""
        return len(self._db.get_transcriber_languages(username)) > 0

    def _is_admin(self, user: NetworkUser) -> bool:
        """Return True if the user is an admin."""
        return user.trust_level.value >= TrustLevel.ADMIN.value

    def _get_user_assigned_languages(self, username: str) -> set[str]:
        """Return the set of languages assigned to a user as a transcriber."""
        return set(self._db.get_transcriber_languages(username))

    def _get_user_accessible_locales(
        self, user: NetworkUser, folder_name: str
    ) -> list[str]:
        """Return document locales the user can edit (assigned to them)."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            return []
        assigned = self._get_user_assigned_languages(user.username)
        return [loc for loc in meta.get("locales", {}).keys() if loc in assigned]

    def _get_document_title(self, folder_name: str, locale: str) -> str:
        """Get display title for a document."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            return folder_name
        titles = meta.get("titles", {})
        return titles.get(locale) or titles.get("en") or folder_name

    # ------------------------------------------------------------------
    # Category / document list browsing
    # ------------------------------------------------------------------

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
            if self._is_transcriber(user.username) or self._is_admin(user):
                self._show_document_actions(user, folder_name, state)
            else:
                self._show_document_view(user, folder_name, state)

    # ------------------------------------------------------------------
    # Document view
    # ------------------------------------------------------------------

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

        title = self._get_document_title(folder_name, user.locale)

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

    # ------------------------------------------------------------------
    # Action menu (transcriber/admin)
    # ------------------------------------------------------------------

    def _show_document_actions(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show the action menu for a document (View, Edit, Settings, Back)."""
        items = [
            MenuItem(
                text=Localization.get(user.locale, "documents-view"),
                id="view",
            ),
            MenuItem(
                text=Localization.get(user.locale, "documents-update-contents"),
                id="edit",
            ),
            MenuItem(
                text=Localization.get(user.locale, "documents-settings"),
                id="settings",
            ),
            MenuItem(
                text=Localization.get(user.locale, "back"), id="back"
            ),
        ]
        user.show_menu(
            "document_actions_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
        )
        self._user_states[user.username] = {
            "menu": "document_actions_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_document_actions_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle document action menu selection."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_documents_list(user, state.get("category_slug"))
        elif selection_id == "view":
            self._show_document_view(user, folder_name, state)
        elif selection_id == "edit":
            self._show_edit_language_menu(user, folder_name, state)
        elif selection_id == "settings":
            self._show_document_settings(user, folder_name, state)

    # ------------------------------------------------------------------
    # Document settings submenu
    # ------------------------------------------------------------------

    def _show_document_settings(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show the document settings submenu."""
        is_admin = self._is_admin(user)
        meta = self._documents.get_document_metadata(folder_name)

        items = [
            MenuItem(
                text=Localization.get(user.locale, "documents-update-title"),
                id="change_title",
            ),
        ]

        # Visibility with count info
        if meta:
            locales = meta.get("locales", {})
            total = len(locales)
            public_count = sum(1 for loc in locales.values() if loc.get("public", False))
            vis_label = Localization.get(
                user.locale, "documents-visibility-count",
                public=str(public_count), total=str(total),
            )
        else:
            vis_label = Localization.get(user.locale, "documents-manage-visibility")
        items.append(MenuItem(text=vis_label, id="manage_visibility"))

        if is_admin:
            items.append(
                MenuItem(
                    text=Localization.get(user.locale, "documents-modify-categories"),
                    id="modify_categories",
                )
            )

        items.append(
            MenuItem(
                text=Localization.get(user.locale, "documents-add-translation"),
                id="add_translation",
            )
        )

        if is_admin:
            items.append(
                MenuItem(
                    text=Localization.get(user.locale, "documents-remove-translation"),
                    id="remove_translation",
                )
            )
            items.append(
                MenuItem(
                    text=Localization.get(user.locale, "documents-delete-document"),
                    id="delete_document",
                )
            )

        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "document_settings_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
        )
        self._user_states[user.username] = {
            "menu": "document_settings_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_document_settings_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle document settings submenu selection."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_document_actions(user, folder_name, state)
        elif selection_id == "change_title":
            self._show_document_title_languages(user, folder_name, state)
        elif selection_id == "manage_visibility":
            self._show_document_visibility(user, folder_name, state)
        elif selection_id == "modify_categories":
            self._show_document_categories(user, folder_name, state)
        elif selection_id == "add_translation":
            self._show_add_translation_languages(user, folder_name, state)
        elif selection_id == "remove_translation":
            self._show_remove_translation_languages(user, folder_name, state)
        elif selection_id == "delete_document":
            self._show_delete_document_confirm(user, folder_name, state)

    # ------------------------------------------------------------------
    # Change title
    # ------------------------------------------------------------------

    def _show_document_title_languages(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show language selection for changing a document title."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            self._show_document_settings(user, folder_name, state)
            return

        # Show all available locales (titles are transcribable even without
        # an existing translation), filtered to assigned languages.
        assigned = self._get_user_assigned_languages(user.username)
        all_codes = Localization.get_available_locale_codes()
        title_locales = [code for code in all_codes if code in assigned]

        if not title_locales:
            user.speak_l("documents-no-permission")
            self._show_document_settings(user, folder_name, state)
            return

        titles = meta.get("titles", {})
        items = []
        for locale_code in title_locales:
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            current_title = titles.get(locale_code, "")
            display = f"{lang_name}: {current_title}" if current_title else lang_name
            items.append(
                MenuItem(
                    text=display,
                    id=f"lang_{locale_code}",
                )
            )
        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "document_title_lang_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
        )
        self._user_states[user.username] = {
            "menu": "document_title_lang_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_document_title_lang_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle language selection for title change."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_document_settings(user, folder_name, state)
        elif selection_id.startswith("lang_"):
            locale_code = selection_id[5:]
            meta = self._documents.get_document_metadata(folder_name)
            current_title = ""
            if meta:
                current_title = meta.get("titles", {}).get(locale_code, "")
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            prompt = Localization.get(
                user.locale, "documents-title-prompt", language=lang_name,
            )
            user.show_editbox(
                "document_title_editbox",
                prompt,
                default_value=current_title,
            )
            self._user_states[user.username] = {
                "menu": "document_title_editbox",
                "folder_name": folder_name,
                "locale_code": locale_code,
                "category_slug": state.get("category_slug"),
            }

    async def _handle_document_title_editbox(
        self, user: NetworkUser, value: str, state: dict
    ) -> None:
        """Handle title editbox submission.

        Supports multiple flows via ``state["flow"]``:
        - ``"change_title"`` (default): save title, return to settings.
        - ``"add_translation"``: store title, open editor for content entry.
        """
        folder_name = state.get("folder_name", "")
        locale_code = state.get("locale_code", "")
        flow = state.get("flow", "change_title")

        if not value.strip():
            # Empty/cancelled — return to settings
            self._show_document_settings(user, folder_name, state)
            return

        title = value.strip()
        if flow == "add_translation":
            self._open_document_editor(
                user, folder_name, locale_code, state,
                flow="add_translation", pending_title=title,
            )
        else:
            self._documents.set_document_title(folder_name, locale_code, title)
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            user.speak_l("documents-title-changed", language=lang_name)
            self._show_document_settings(user, folder_name, state)

    # ------------------------------------------------------------------
    # Manage visibility
    # ------------------------------------------------------------------

    def _show_document_visibility(
        self, user: NetworkUser, folder_name: str, state: dict,
        focus_locale: str | None = None,
    ) -> None:
        """Show toggle list of document locales with public on/off."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            self._show_document_settings(user, folder_name, state)
            return

        doc_locales = meta.get("locales", {})

        items = []
        focus_position = 1
        for locale_code, loc_info in doc_locales.items():
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            public = loc_info.get("public", False)
            status = Localization.get(
                user.locale, "visibility-public" if public else "visibility-private"
            )
            items.append(
                MenuItem(
                    text=f"{lang_name} {status}",
                    id=f"lang_{locale_code}",
                )
            )
            if locale_code == focus_locale:
                focus_position = len(items)

        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "document_visibility_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
            position=focus_position,
        )
        self._user_states[user.username] = {
            "menu": "document_visibility_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_document_visibility_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle visibility toggle selection."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_document_settings(user, folder_name, state)
        elif selection_id.startswith("lang_"):
            locale_code = selection_id[5:]
            # Permission check: user must have this language assigned
            assigned = set(self._db.get_transcriber_languages(user.username))
            if locale_code not in assigned:
                lang_name = Localization.get(user.locale, f"language-{locale_code}")
                user.speak_l("documents-visibility-no-permission", language=lang_name)
                self._show_document_visibility(user, folder_name, state, focus_locale=locale_code)
                return

            meta = self._documents.get_document_metadata(folder_name)
            if meta:
                current_public = meta.get("locales", {}).get(locale_code, {}).get("public", False)
                self._documents.set_document_visibility(folder_name, locale_code, not current_public)
                lang_name = Localization.get(user.locale, f"language-{locale_code}")
                user.speak_l("documents-visibility-changed", language=lang_name)
                if current_public:
                    user.play_sound("checkbox_list_off.wav")
                else:
                    user.play_sound("checkbox_list_on.wav")
            self._show_document_visibility(user, folder_name, state, focus_locale=locale_code)

    # ------------------------------------------------------------------
    # Modify categories (admin only)
    # ------------------------------------------------------------------

    def _show_document_categories(
        self, user: NetworkUser, folder_name: str, state: dict,
        focus_slug: str | None = None,
    ) -> None:
        """Show toggle list of all categories with included/excluded."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            self._show_document_settings(user, folder_name, state)
            return

        doc_cats = set(meta.get("categories", []))
        all_cats = self._documents.get_categories(user.locale)
        on_label = Localization.get(user.locale, "option-on")
        off_label = Localization.get(user.locale, "option-off")

        items = []
        focus_position = 1
        for cat in all_cats:
            included = cat["slug"] in doc_cats
            status = on_label if included else off_label
            items.append(
                MenuItem(
                    text=f"{cat['name']} {status}",
                    id=f"cat_{cat['slug']}",
                )
            )
            if cat["slug"] == focus_slug:
                focus_position = len(items)

        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "document_categories_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
            position=focus_position,
        )
        self._user_states[user.username] = {
            "menu": "document_categories_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_document_categories_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle category toggle selection."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_document_settings(user, folder_name, state)
        elif selection_id.startswith("cat_"):
            slug = selection_id[4:]
            meta = self._documents.get_document_metadata(folder_name)
            if meta:
                cats = list(meta.get("categories", []))
                if slug in cats:
                    cats.remove(slug)
                    user.play_sound("checkbox_list_off.wav")
                else:
                    cats.append(slug)
                    user.play_sound("checkbox_list_on.wav")
                self._documents.set_document_categories(folder_name, cats)
                user.speak_l("documents-categories-updated")
            self._show_document_categories(user, folder_name, state, focus_slug=slug)

    # ------------------------------------------------------------------
    # Remove translation (admin only)
    # ------------------------------------------------------------------

    def _show_remove_translation_languages(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show language selection for removing a translation."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            self._show_document_settings(user, folder_name, state)
            return

        source_locale = meta.get("source_locale", "en")
        doc_locales = self._get_user_accessible_locales(user, folder_name)

        if not doc_locales:
            user.speak_l("documents-no-permission")
            self._show_document_settings(user, folder_name, state)
            return

        items = []
        for locale_code in doc_locales:
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            items.append(
                MenuItem(text=lang_name, id=f"lang_{locale_code}")
            )
        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "remove_translation_lang_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
        )
        self._user_states[user.username] = {
            "menu": "remove_translation_lang_menu",
            "folder_name": folder_name,
            "source_locale": source_locale,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_remove_translation_lang_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle language selection for removing a translation."""
        folder_name = state.get("folder_name", "")
        source_locale = state.get("source_locale", "en")
        if selection_id == "back":
            self._show_document_settings(user, folder_name, state)
        elif selection_id.startswith("lang_"):
            locale_code = selection_id[5:]
            if locale_code == source_locale:
                user.speak_l("documents-remove-translation-source")
                self._show_remove_translation_languages(user, folder_name, state)
            else:
                self._show_remove_translation_confirm(
                    user, folder_name, locale_code, state,
                )

    def _show_remove_translation_confirm(
        self, user: NetworkUser, folder_name: str, locale_code: str, state: dict
    ) -> None:
        """Show yes/no confirmation for removing a translation."""

        lang_name = Localization.get(user.locale, f"language-{locale_code}")
        question = Localization.get(
            user.locale, "documents-remove-translation-confirm", language=lang_name,
        )
        show_yes_no_menu(user, "remove_translation_confirm", question)
        self._user_states[user.username] = {
            "menu": "remove_translation_confirm",
            "folder_name": folder_name,
            "locale_code": locale_code,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_remove_translation_confirm(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle remove-translation confirmation."""
        folder_name = state.get("folder_name", "")
        locale_code = state.get("locale_code", "")
        if selection_id == "yes":
            lock_holder = self._documents.get_edit_lock_holder(
                folder_name, locale_code,
            )
            if lock_holder:
                lang_name = Localization.get(
                    user.locale, f"language-{locale_code}",
                )
                user.speak_l(
                    "documents-remove-translation-locked",
                    language=lang_name, username=lock_holder,
                )
                self._show_document_settings(user, folder_name, state)
                return
            # Check if a title exists for this locale — if so, ask
            # whether to remove it as well.
            meta = self._documents.get_document_metadata(folder_name)
            has_title = bool(
                meta and meta.get("titles", {}).get(locale_code)
            )
            if has_title:
                self._show_remove_translation_title_confirm(
                    user, folder_name, locale_code, state,
                )
                return
            # No title to ask about — remove immediately.
            self._documents.remove_document_translation(
                folder_name, locale_code,
            )
            lang_name = Localization.get(
                user.locale, f"language-{locale_code}",
            )
            user.speak_l(
                "documents-translation-removed", language=lang_name,
            )
        self._show_document_settings(user, folder_name, state)

    def _show_remove_translation_title_confirm(
        self, user: NetworkUser, folder_name: str, locale_code: str,
        state: dict,
    ) -> None:
        """Ask whether to also remove the title when removing a translation."""

        lang_name = Localization.get(user.locale, f"language-{locale_code}")
        question = Localization.get(
            user.locale, "documents-remove-title-confirm",
            language=lang_name,
        )
        show_yes_no_menu(user, "remove_translation_title_confirm", question)
        self._user_states[user.username] = {
            "menu": "remove_translation_title_confirm",
            "folder_name": folder_name,
            "locale_code": locale_code,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_remove_translation_title_confirm(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle title removal confirmation after translation removal."""
        folder_name = state.get("folder_name", "")
        locale_code = state.get("locale_code", "")
        remove_title = selection_id == "yes"
        self._documents.remove_document_translation(
            folder_name, locale_code, remove_title=remove_title,
        )
        lang_name = Localization.get(user.locale, f"language-{locale_code}")
        user.speak_l("documents-translation-removed", language=lang_name)
        self._show_document_settings(user, folder_name, state)

    # ------------------------------------------------------------------
    # Delete document (admin only)
    # ------------------------------------------------------------------

    def _show_delete_document_confirm(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show yes/no confirmation for deleting a document."""

        # Require at least one assigned language matching the document
        meta = self._documents.get_document_metadata(folder_name)
        if meta:
            doc_locale_codes = set(meta.get("locales", {}).keys())
            assigned = set(self._db.get_transcriber_languages(user.username))
            if not doc_locale_codes & assigned:
                user.speak_l("documents-no-permission")
                self._show_document_settings(user, folder_name, state)
                return

        count = self._documents.get_document_locale_count(folder_name)
        question = Localization.get(
            user.locale, "documents-delete-confirm", count=str(count),
        )
        show_yes_no_menu(user, "delete_document_confirm", question)
        self._user_states[user.username] = {
            "menu": "delete_document_confirm",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_delete_document_confirm(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle delete-document confirmation."""
        folder_name = state.get("folder_name", "")
        category_slug = state.get("category_slug")
        if selection_id == "yes":
            active_locks = self._documents.get_document_lock_holders(
                folder_name,
            )
            if active_locks:
                locale_code, lock_holder = next(iter(active_locks.items()))
                lang_name = Localization.get(
                    user.locale, f"language-{locale_code}",
                )
                user.speak_l(
                    "documents-delete-locked",
                    language=lang_name, username=lock_holder,
                )
                self._show_document_settings(user, folder_name, state)
            else:
                self._documents.delete_document(folder_name)
                user.speak_l("documents-deleted")
                self._show_documents_list(user, category_slug)
        else:
            self._show_document_settings(user, folder_name, state)

    # ------------------------------------------------------------------
    # Edit document content
    # ------------------------------------------------------------------

    def _show_edit_language_menu(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show language selection for editing document content."""
        locales = self._get_user_accessible_locales(user, folder_name)
        if not locales:
            user.speak_l("documents-no-permission")
            self._show_document_actions(user, folder_name, state)
            return

        meta = self._documents.get_document_metadata(folder_name)
        source_locale = meta.get("source_locale", "en") if meta else "en"

        items = []
        focus_position = 1
        for locale_code in locales:
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            items.append(MenuItem(text=lang_name, id=f"lang_{locale_code}"))
            if locale_code == user.locale:
                focus_position = len(items)
        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "document_edit_lang_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
            position=focus_position,
        )
        self._user_states[user.username] = {
            "menu": "document_edit_lang_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_edit_lang_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle language selection for editing."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_document_actions(user, folder_name, state)
        elif selection_id.startswith("lang_"):
            locale_code = selection_id[5:]
            self._open_document_editor(
                user, folder_name, locale_code, state, flow="edit",
            )

    # ------------------------------------------------------------------
    # Add translation
    # ------------------------------------------------------------------

    def _show_add_translation_languages(
        self, user: NetworkUser, folder_name: str, state: dict
    ) -> None:
        """Show language selection for adding a new translation."""
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            self._show_document_settings(user, folder_name, state)
            return

        existing_locales = set(meta.get("locales", {}).keys())
        assigned = self._get_user_assigned_languages(user.username)
        all_codes = Localization.get_available_locale_codes()
        available = [
            code for code in all_codes
            if code in assigned and code not in existing_locales
        ]

        if not available:
            user.speak_l("documents-no-languages-available")
            self._show_document_settings(user, folder_name, state)
            return

        items = []
        focus_position = 1
        for locale_code in available:
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            items.append(MenuItem(text=lang_name, id=f"lang_{locale_code}"))
            if locale_code == user.locale:
                focus_position = len(items)
        items.append(
            MenuItem(text=Localization.get(user.locale, "back"), id="back")
        )
        user.show_menu(
            "add_translation_lang_menu",
            items,
            multiletter=True,
            escape_behavior=EscapeBehavior.SELECT_LAST,
            position=focus_position,
        )
        self._user_states[user.username] = {
            "menu": "add_translation_lang_menu",
            "folder_name": folder_name,
            "category_slug": state.get("category_slug"),
        }

    async def _handle_add_translation_lang_selection(
        self, user: NetworkUser, selection_id: str, state: dict
    ) -> None:
        """Handle language selection for adding a translation."""
        folder_name = state.get("folder_name", "")
        if selection_id == "back":
            self._show_document_settings(user, folder_name, state)
        elif selection_id.startswith("lang_"):
            locale_code = selection_id[5:]
            # Show title editbox for the new translation, pre-populated
            # with existing title if one was set (e.g. via change-title).
            lang_name = Localization.get(user.locale, f"language-{locale_code}")
            prompt = Localization.get(
                user.locale, "documents-title-prompt", language=lang_name,
            )
            existing_title = ""
            meta = self._documents.get_document_metadata(folder_name)
            if meta:
                existing_title = meta.get("titles", {}).get(locale_code, "")
            user.show_editbox(
                "document_title_editbox", prompt,
                default_value=existing_title,
            )
            self._user_states[user.username] = {
                "menu": "document_title_editbox",
                "folder_name": folder_name,
                "locale_code": locale_code,
                "category_slug": state.get("category_slug"),
                "flow": "add_translation",
            }

    # ------------------------------------------------------------------
    # Shared document editor
    # ------------------------------------------------------------------

    def _open_document_editor(
        self,
        user: NetworkUser,
        folder_name: str,
        locale_code: str,
        state: dict,
        flow: str = "edit",
        pending_title: str | None = None,
    ) -> None:
        """Open the document editor dialog.

        Args:
            flow: ``"edit"`` for editing existing content,
                  ``"add_translation"`` for a new translation.
            pending_title: Title for the new translation (add_translation only).
        """
        meta = self._documents.get_document_metadata(folder_name)
        if meta is None:
            self._show_document_actions(user, folder_name, state)
            return

        # Acquire edit lock
        lock_owner = self._documents.acquire_edit_lock(
            folder_name, locale_code, user.username,
        )
        if lock_owner:
            user.speak_l("documents-locked", username=lock_owner)
            if flow == "add_translation":
                self._show_document_settings(user, folder_name, state)
            else:
                self._show_document_actions(user, folder_name, state)
            return

        # Load content
        if flow == "add_translation":
            content = ""
        else:
            content = self._documents.get_document_content(
                folder_name, locale_code,
            ) or ""

        # Source reference for non-source locales
        source_locale = meta.get("source_locale", "en")
        source_content = None
        source_label = None
        if locale_code != source_locale:
            source_content = self._documents.get_document_content(
                folder_name, source_locale,
            )
            if source_content:
                source_lang = Localization.get(
                    user.locale, f"language-{source_locale}",
                )
                source_label = Localization.get(
                    user.locale, "documents-source-label",
                    language=source_lang,
                )

        # Build prompt and content label
        title = pending_title or self._get_document_title(
            folder_name, locale_code,
        )
        lang_name = Localization.get(user.locale, f"language-{locale_code}")
        prompt = Localization.get(
            user.locale, "documents-editor-prompt",
            title=title, language=lang_name,
        )
        content_label = Localization.get(
            user.locale, "documents-content-label",
            language=lang_name,
        )

        dialog_id = f"doc_edit_{folder_name}_{locale_code}"
        user.show_document_editor(
            dialog_id=dialog_id,
            content=content,
            content_label=content_label,
            source_content=source_content,
            source_label=source_label,
            prompt=prompt,
        )
        self._user_states[user.username] = {
            "menu": "document_editor",
            "folder_name": folder_name,
            "locale_code": locale_code,
            "category_slug": state.get("category_slug"),
            "flow": flow,
            "pending_title": pending_title,
            "dialog_id": dialog_id,
        }

    async def _handle_document_editor_response(
        self, user: NetworkUser, packet: dict, state: dict
    ) -> None:
        """Handle save/cancel from the document editor dialog."""
        if state.get("menu") != "document_editor":
            return

        folder_name = state.get("folder_name", "")
        locale_code = state.get("locale_code", "")
        flow = state.get("flow", "edit")
        dialog_id = state.get("dialog_id", "")

        if packet.get("dialog_id") != dialog_id:
            return

        action = packet.get("action", "cancel")

        # Guard against the document or translation being removed while
        # the editor was open (e.g. an admin deleted it on the backend,
        # or a reconnected client submitted after its lock went stale).
        meta = self._documents.get_document_metadata(folder_name)

        if action == "save" and meta is not None:
            content = packet.get("content", "")
            if flow == "add_translation":
                pending_title = state.get("pending_title", "")
                self._documents.add_document_translation(
                    folder_name, locale_code, pending_title, content,
                )
                # Release lock (add_document_translation doesn't do it)
                self._documents.release_edit_lock(
                    folder_name, locale_code, user.username,
                )
                lang_name = Localization.get(
                    user.locale, f"language-{locale_code}",
                )
                user.speak_l("documents-translation-added", language=lang_name)
            else:
                # save_document_content handles backup + lock release
                self._documents.save_document_content(
                    folder_name, locale_code, content, user.username,
                )
                lang_name = Localization.get(
                    user.locale, f"language-{locale_code}",
                )
                user.speak_l("documents-content-saved", language=lang_name)
        else:
            # Cancel — release lock (safe even if already cleared)
            self._documents.release_edit_lock(
                folder_name, locale_code, user.username,
            )

        # Return to appropriate menu.  If the document was removed while
        # the editor was open, fall back to the top-level documents list.
        if meta is None:
            self._show_documents_menu(user)
        elif flow == "add_translation":
            self._show_document_settings(user, folder_name, state)
        else:
            self._show_document_actions(user, folder_name, state)
