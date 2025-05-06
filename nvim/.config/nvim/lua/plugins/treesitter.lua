return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = { "bash", "c", "c_sharp", "cmake", "comment", "commonlisp", "cpp", "css", "csv", "dart", "diff", "dockerfile", "dot", "doxygen", "editorconfig", "git_config", "gitignore", "go", "gotmpl", "gpg", "graphql", "groovy", "query", "helm", "hlsplaylist", "html", "ini", "java", "javadoc", "javascript", "jinja", "jinja_inline", "jq", "json", "json5", "jsonnet", "kotlin", "latex", "lua", "luadoc", "Lua patterns", "make", "markdown", "markdown_inline", "matlab", "meson", "nginx", "ninja", "passwd", "pem", "perl", "php", "php_only", "phpdoc", "powershell", "printf", "promql", "properties", "proto", "python", "r", "regex", "rego", "pip requirements", "robots", "ruby", "rust", "scss", "sql", "ssh_config", "strace", "terraform", "tmux", "todotxt", "tml", "typescript", "typespec", "typoscript", "typst", "udev", "vimdoc", "vue", "xml", "yaml", "zathurarc", },
      sync_install = false,
      highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = false,
      },
    }
  },
  { "nvim-treesitter/nvim-treesitter-context" }
}
