# Documents System Implementation Progress
Reference file: docs/design/plans/documents_system.md

## Completed (Sessions 1 through 3)

### Database Layer (session 1)
- `fluent_languages` column on `users` table (JSON text)
- `transcriber_assignments` table with full CRUD methods
- Migration support in `server/persistence/database.py`

### Backend Infrastructure (session 1)
- **NetworkUser.fluent_languages**: property, setter, plumbed from DB on login/reconnect (`server/core/users/network_user.py`, `server/core/server.py`)
- **Fluent languages option**: toggle menu in options, uses `show_language_menu` with on/off status labels, saves to DB (`server/core/server.py`, `server/locales/en/main.ftl`)
- **Localization.get_available_locale_codes()**: warmup-safe method that returns language codes from directory names without triggering bundle compilation (`server/messages/localization.py`)
- **DocumentManager class**: `server/core/documents/manager.py`
  - Startup loading with auto-generated metadata for existing folders
  - Category queries with locale fallback (en -> slug)
  - Document filtering by category (all / specific / uncategorized)
  - Content read on demand, write with metadata timestamp update
  - Edit locks: acquire, release, conflict detection, stale cleanup (30min timeout)
  - Version history: backup on save, 5-version cap per locale
  - Create document and create category operations
- **Server wiring**: DocumentManager initialized and loaded on startup
- **Tests**: 29 DocumentManager tests, 4 new fluent languages tests in options menu suite
- **Locale completeness**: fixed missing .ftl files across 28 locales, added Serbian (sr)

### Document Browsing — Read-Only (session 2)
- "Documents" item in main menu for all users (approved and unapproved)
- `_show_documents_menu`: category list + "All documents" + "Uncategorized"
- `_show_documents_list`: document titles for a given category
- `_show_document_view`: read-only editbox with locale fallback to English
- Dispatch table entries for `documents_menu`, `documents_list_menu`

### Transcriber Management (session 3)
- "View transcribers by language" and "View transcribers by user" items added to documents menu
- **By language flow**: `show_language_menu` with per-language user counts → user list for selected language → admin can click to remove (with confirmation) or "Add users" to show toggle list of eligible users (filtered by fluent_languages)
- **By user flow**: transcriber list with language counts → language list for selected user → admin can click to remove (with confirmation) or "Add languages" to show toggle list of unassigned fluent languages
- Validation: only users with a language in `fluent_languages` can be assigned as transcribers
- Toggle sounds: `checkbox_list_on.wav` / `checkbox_list_off.wav` for add/remove
- Dispatch table entries: `transcribers_for_language_menu`, `transcriber_remove_confirm`, `transcribers_by_user_menu`, `transcriber_user_languages_menu`, `transcriber_remove_lang_confirm`
- 20 new locale strings in `server/locales/en/main.ftl`

### Module Refactor (session 4)
- Moved document browsing and transcriber management code out of `server/core/server.py` into mixin modules
- Module structure under `server/core/documents/`:
  - `manager.py` — data layer (DocumentManager)
  - `browsing.py` — `DocumentBrowsingMixin` (document menus, list, view)
  - `transcriber_role.py` — `TranscriberRoleMixin` (transcriber assignment/management menus)
- Server class inherits both mixins; cross-mixin calls resolve via MRO

---

## Chunk 4: Document Actions (Admin & Transcriber)

The action menu that appears when a transcriber or admin clicks a document.

### Scope
- Role-based behavior: normal users auto-view, transcribers/admins see action menu
- Action menu: View, Edit, Document settings
- Document settings submenu:
  - Change title (per locale)
  - Manage visibility (public/private toggles per locale)
  - Modify category list (admin, boolean toggle list)
  - Add translation (locale selection, title + content editboxes)
  - Remove translation (admin, confirmation with safeguards)
  - Delete document (admin, confirmation with translation count)
- Permission checks: transcribers limited to their assigned languages
- Locale strings for all prompts and confirmations
- Tests for action menu routing and permission checks

### Files to modify
- `server/core/documents/browsing.py` — action menu handlers (new mixin methods or extend `DocumentBrowsingMixin`)
- `server/locales/en/main.ftl` — locale strings

---

## Chunk 5: Document Editing

The in-app editor with edit locks, save/cancel, and version history integration.

### Scope
- `_show_document_editor(user, folder_name, locale)`: multiline editbox with current content
- Side-by-side source display: if editing a non-source locale, show source content in a read-only editbox
- Save handler: calls `DocumentManager.save_document_content()` (handles backup + lock release)
- Cancel handler: release edit lock, return to document actions
- Escape = cancel, with confirmation if content changed
- Lock acquisition on edit open, conflict message if locked by another user
- Locale strings for editor prompts, save/cancel confirmations, lock conflict messages
- Tests for edit flow, lock integration, save with version backup

### Files to modify
- `server/core/documents/browsing.py` — editor handlers (or a new `document_editor.py` mixin)
- `server/locales/en/main.ftl` — locale strings

---

## Chunk 6: Document & Category Creation

Admin flows for creating new documents and categories.

### Scope
- New document flow: category selection -> title editbox -> content editbox -> auto-generate folder slug from title
- Slug collision detection with user-friendly error
- New category flow: slug editbox -> display name editbox
- Category management: rename (per locale), change sort method, delete (with document cleanup)
- Locale strings for creation flows
- Tests for creation flows and edge cases (duplicate slugs, empty input)

### Files to modify
- `server/core/documents/browsing.py` — creation handlers (or a new `document_creation.py` mixin)
- `server/core/documents/manager.py` — possibly add slug generation helper, delete methods
- `server/locales/en/main.ftl` — locale strings
