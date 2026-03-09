/**
 * Document editor dialog for viewing/editing document content.
 *
 * Shows an optional read-only source panel (when translating) and an
 * editable textarea for the document content, plus Save and Cancel buttons.
 */
export function createDocumentEditor({ dialogEl, onSubmit }) {
  let currentDialogId = null;
  let originalContent = "";

  // Build the dialog DOM on first call
  const container = document.createElement("div");

  const promptEl = document.createElement("p");
  promptEl.id = "doc-editor-prompt";
  promptEl.style.margin = "0 0 8px 0";
  promptEl.style.fontWeight = "bold";
  container.appendChild(promptEl);

  // Source reference section (hidden when not needed)
  const sourceSection = document.createElement("div");
  sourceSection.id = "doc-editor-source-section";
  sourceSection.hidden = true;

  const sourceLabelEl = document.createElement("label");
  sourceLabelEl.setAttribute("for", "doc-editor-source");
  sourceLabelEl.style.display = "block";
  sourceLabelEl.style.marginBottom = "4px";
  sourceSection.appendChild(sourceLabelEl);

  const sourceTextarea = document.createElement("textarea");
  sourceTextarea.id = "doc-editor-source";
  sourceTextarea.readOnly = true;
  sourceTextarea.style.width = "100%";
  sourceTextarea.style.height = "150px";
  sourceTextarea.style.resize = "vertical";
  sourceTextarea.style.marginBottom = "10px";
  sourceSection.appendChild(sourceTextarea);
  container.appendChild(sourceSection);

  // Content editing area
  const contentLabelEl = document.createElement("label");
  contentLabelEl.setAttribute("for", "doc-editor-content");
  contentLabelEl.style.display = "block";
  contentLabelEl.style.marginBottom = "4px";
  container.appendChild(contentLabelEl);

  const contentTextarea = document.createElement("textarea");
  contentTextarea.id = "doc-editor-content";
  contentTextarea.style.width = "100%";
  contentTextarea.style.height = "250px";
  contentTextarea.style.resize = "vertical";
  container.appendChild(contentTextarea);

  // Buttons
  const btnRow = document.createElement("div");
  btnRow.className = "row";
  btnRow.style.justifyContent = "flex-end";
  btnRow.style.marginTop = "10px";

  const cancelBtn = document.createElement("button");
  cancelBtn.type = "button";
  cancelBtn.className = "secondary";
  cancelBtn.textContent = "Cancel";

  const saveBtn = document.createElement("button");
  saveBtn.type = "button";
  saveBtn.textContent = "Save";

  btnRow.appendChild(cancelBtn);
  btnRow.appendChild(saveBtn);
  container.appendChild(btnRow);

  dialogEl.appendChild(container);

  function contentChanged() {
    return contentTextarea.value !== originalContent;
  }

  function closeDialog() {
    if (dialogEl.open) {
      dialogEl.close();
    }
    currentDialogId = null;
  }

  function sendCancel() {
    if (!currentDialogId) return;
    onSubmit({
      dialog_id: currentDialogId,
      action: "cancel",
      content: "",
    });
    closeDialog();
  }

  function doSave() {
    if (!currentDialogId) return;
    // Nothing meaningful to save — cancel silently
    if (!contentTextarea.value.trim() || !contentChanged()) {
      sendCancel();
      return;
    }
    onSubmit({
      dialog_id: currentDialogId,
      action: "save",
      content: contentTextarea.value,
    });
    closeDialog();
  }

  function doCancel() {
    if (!currentDialogId) return;
    if (contentChanged()) {
      if (!confirm("You have unsaved changes. Discard them?")) {
        return;
      }
    }
    sendCancel();
  }

  function show(packet) {
    currentDialogId = packet.dialog_id || "";
    originalContent = packet.content || "";
    promptEl.textContent = packet.prompt || "Edit document";
    contentTextarea.value = packet.content || "";

    // Content label with language name
    const cLabel = packet.content_label || "Content";
    contentLabelEl.textContent = cLabel;
    contentTextarea.setAttribute("aria-label", cLabel);

    if (packet.source_content != null) {
      sourceLabelEl.textContent = packet.source_label || "Source";
      sourceTextarea.value = packet.source_content;
      sourceTextarea.setAttribute("aria-label", packet.source_label || "Source");
      sourceSection.hidden = false;
    } else {
      sourceSection.hidden = true;
    }

    if (!dialogEl.open) {
      dialogEl.showModal();
    }
    requestAnimationFrame(() => {
      contentTextarea.focus();
    });
  }

  saveBtn.addEventListener("click", doSave);
  cancelBtn.addEventListener("click", doCancel);

  // Escape key triggers cancel with confirmation
  dialogEl.addEventListener("cancel", (event) => {
    event.preventDefault();
    doCancel();
  });

  return { show, closeDialog };
}
