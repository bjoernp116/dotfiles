require('sethy.core.options')
require("sethy.core.keymaps")

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.md",
  callback = function()
    local filepath = vim.fn.expand("%:p")
    local pdfpath = vim.fn.expand("%:p:r") .. ".pdf"
    vim.fn.jobstart({"pandoc", filepath, "-o", pdfpath, "--pdf-engine=tectonic"})
  end,
})
