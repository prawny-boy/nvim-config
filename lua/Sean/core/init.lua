require("Sean.core.options")
require("Sean.core.keymaps")

local function warn_missing_tools()
  local tools = {
    { name = "git", cmd = "git" },
    { name = "fd", cmd = "fd" },
    { name = "rg", cmd = "rg" },
    { name = "lazygit", cmd = "lazygit" },
  }

  local missing = {}
  for _, tool in ipairs(tools) do
    if vim.fn.executable(tool.cmd) ~= 1 then
      table.insert(missing, tool.name)
    end
  end

  if #missing > 0 then
    vim.notify(
      "Optional tools missing: " .. table.concat(missing, ", ") .. ". Some features may be unavailable.",
      vim.log.levels.WARN,
      { title = "nvim config" }
    )
  end

  vim.notify(
    "A Nerd Font is recommended for the best icon experience.",
    vim.log.levels.INFO,
    { title = "nvim config", timeout = 5000 }
  )
end

vim.api.nvim_create_autocmd("VimEnter", {
  once = true,
  callback = warn_missing_tools,
})
