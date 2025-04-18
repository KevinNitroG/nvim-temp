vim.filetype.add({
  extension = {
    ["templ"] = "templ",
    ["json"] = "jsonc",
    ["http"] = "http",
    ["regex"] = "regex",
    ["xaml"] = "xml",
    ["plist"] = "xml",
  },
  pattern = {
    [".*/%.env"] = "env",
    [".*/.*%.env"] = "env",
    [".*/%.env%..*"] = "env",
    [".*/.*compose%.ya?ml"] = "yaml.docker-compose",
    [".*/.*compose%.override%.ya?ml"] = "yaml.docker-compose",
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
  },
})
