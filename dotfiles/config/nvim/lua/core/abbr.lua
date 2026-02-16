local abbrevs = {
  teh = "the",
  withd = "width",
  heitgh = "height",
  feild = "field",
  textfeild = "textfield",
  cosnt = "const",
}

for left, right in pairs(abbrevs) do
  vim.cmd("abbr " .. left .. " " .. right)
end
