-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
require 'config.options'

-- [[ Basic Keymaps ]]
require 'config.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'config.lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'config.lazy-plugins'

-- [[ Journaling ]]
require 'config.journal-note'

-- The line beneath this is called `modeline`. See `:help modeline`
