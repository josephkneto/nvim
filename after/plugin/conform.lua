local conform = require('conform')
conform.setup()

conform.formatters_by_ft = {
    sh = { 'shfmt' },
    python = { 'black', 'isort' },
}
