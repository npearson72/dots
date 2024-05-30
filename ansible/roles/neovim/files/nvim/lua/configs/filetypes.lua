vim.filetype.add({
  filename = {
    ['Jenkinsfile'] = 'groovy',
    ['.env'] = 'text',
  },
  pattern = {
    ['.env.*'] = 'text',
  }
})
