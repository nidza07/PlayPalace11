"""Document editor dialog for viewing/editing document content."""

import wx


class DocumentEditorDialog(wx.Dialog):
    """Modal dialog for editing document content with optional source reference.

    Shows:
    - An optional read-only source panel (when translating from another language)
    - An editable multiline text area for the document content
    - Save and Cancel buttons
    """

    def __init__(
        self,
        parent,
        prompt,
        content,
        content_label=None,
        source_content=None,
        source_label=None,
        on_save=None,
        on_cancel=None,
    ):
        super().__init__(
            parent,
            title=prompt,
            style=wx.DEFAULT_DIALOG_STYLE | wx.RESIZE_BORDER,
        )
        self._on_save = on_save
        self._on_cancel = on_cancel
        self._original_content = content
        self._create_ui(content, content_label, source_content, source_label)
        self.SetSize(700, 500)
        self.CenterOnScreen()

    def _create_ui(self, content, content_label, source_content, source_label):
        panel = wx.Panel(self)
        sizer = wx.BoxSizer(wx.VERTICAL)

        # Source reference panel (read-only, only if source_content provided)
        if source_content:
            label = source_label or "Source"
            source_lbl = wx.StaticText(panel, label=f"&{label}")
            sizer.Add(source_lbl, 0, wx.ALL, 5)
            self.source_text = wx.TextCtrl(
                panel,
                value=source_content,
                style=wx.TE_MULTILINE | wx.TE_READONLY | wx.TE_DONTWRAP,
            )
            self.source_text.SetName(label)
            sizer.Add(self.source_text, 1, wx.EXPAND | wx.LEFT | wx.RIGHT, 5)
            sizer.AddSpacer(5)

        # Editable content area
        edit_display = content_label or "Content"
        edit_lbl = wx.StaticText(panel, label=f"&{edit_display}")
        sizer.Add(edit_lbl, 0, wx.ALL, 5)
        self.content_text = wx.TextCtrl(
            panel,
            value=content,
            style=wx.TE_MULTILINE | wx.TE_DONTWRAP,
        )
        self.content_text.SetName(edit_display)
        sizer.Add(self.content_text, 2, wx.EXPAND | wx.LEFT | wx.RIGHT, 5)

        # Buttons
        btn_sizer = wx.BoxSizer(wx.HORIZONTAL)
        self.save_btn = wx.Button(panel, wx.ID_SAVE, "&Save")
        self.cancel_btn = wx.Button(panel, wx.ID_CANCEL, "&Cancel")
        btn_sizer.Add(self.save_btn, 0, wx.RIGHT, 5)
        btn_sizer.Add(self.cancel_btn, 0)
        sizer.Add(btn_sizer, 0, wx.ALIGN_RIGHT | wx.ALL, 10)

        panel.SetSizer(sizer)

        self.save_btn.Bind(wx.EVT_BUTTON, self._on_save_clicked)
        self.cancel_btn.Bind(wx.EVT_BUTTON, self._on_cancel_clicked)
        self.Bind(wx.EVT_CLOSE, self._on_close)

        # Focus the content area
        self.content_text.SetFocus()

    def _content_changed(self):
        return self.content_text.GetValue() != self._original_content

    def _do_cancel(self):
        """Send cancel and close the dialog."""
        if self._on_cancel:
            self._on_cancel()
        self.EndModal(wx.ID_CANCEL)

    def _on_save_clicked(self, event):
        content = self.content_text.GetValue()
        if not content.strip() or not self._content_changed():
            # Nothing meaningful to save — cancel silently
            self._do_cancel()
            return
        if self._on_save:
            self._on_save(content)
        self.EndModal(wx.ID_SAVE)

    def _on_cancel_clicked(self, event):
        if self._content_changed():
            dlg = wx.MessageDialog(
                self,
                "You have unsaved changes. Discard them?",
                "Confirm Cancel",
                wx.YES_NO | wx.NO_DEFAULT | wx.ICON_QUESTION,
            )
            result = dlg.ShowModal()
            dlg.Destroy()
            if result != wx.ID_YES:
                return
        self._do_cancel()

    def _on_close(self, event):
        if self._content_changed():
            dlg = wx.MessageDialog(
                self,
                "You have unsaved changes. Discard them?",
                "Confirm Cancel",
                wx.YES_NO | wx.NO_DEFAULT | wx.ICON_QUESTION,
            )
            result = dlg.ShowModal()
            dlg.Destroy()
            if result != wx.ID_YES:
                return
        self._do_cancel()
