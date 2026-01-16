return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      dotenv = { "dotenv_linter" },
    },
    linters = {
      dotenv_linter = {
        cmd = "dotenv-linter",
        args = { "--skip-unused" },
        stdin = false,
      },
    },
  },
}
