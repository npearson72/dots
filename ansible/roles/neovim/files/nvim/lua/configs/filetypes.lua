vim.filetype.add({
  extension = {},
  filename = {
    ['Jenkinsfile'] = 'groovy'
  },
  pattern = {
    ['.*.env.*'] = 'sh'
  }
})
