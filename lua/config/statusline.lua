local ok, gl = pcall(require, 'galaxyline')
local colors = require 'tokyonight.colors'.setup()

if not ok then return end

-- source provider function
local diagnostic = require('galaxyline.provider_diagnostic')
local vcs = require('galaxyline.provider_vcs')
local fileinfo = require('galaxyline.provider_fileinfo')
local extension = require('galaxyline.provider_extensions')
local buffer = require('galaxyline.provider_buffer')
local whitespace = require('galaxyline.provider_whitespace')
local lspclient = require('galaxyline.provider_lsp')

local signs = { Error = "  ", Warn = "  ", Hint = "  ", Info = "  " }

-- provider
local BufferIcon      = buffer.get_buffer_type_icon
local BufferNumber    = buffer.get_buffer_number
local FileTypeName    = buffer.get_buffer_filetype
-- Git Provider
local GitBranch       = vcs.get_git_branch
local DiffAdd         = vcs.diff_add -- support vim-gitgutter vim-signify gitsigns
local DiffModified    = vcs.diff_modified -- support vim-gitgutter vim-signify gitsigns
local DiffRemove      = vcs.diff_remove -- support vim-gitgutter vim-signify gitsigns
-- File Provider
local LineColumn      = fileinfo.line_column
local FileFormat      = fileinfo.get_file_format
local FileEncode      = fileinfo.get_file_encode
local FileSize        = fileinfo.get_file_size
local FileIcon        = fileinfo.get_file_icon
local FileName        = fileinfo.get_current_file_name
local FilePath        = fileinfo.get_current_file_path
local LinePercent     = fileinfo.current_line_percent
local ScrollBar       = extension.scrollbar_instance
local VistaPlugin     = extension.vista_nearest
-- Whitespace
local Whitespace      = whitespace.get_item
-- Diagnostic Provider
local DiagnosticError = diagnostic.get_diagnostic_error
local DiagnosticWarn  = diagnostic.get_diagnostic_warn
local DiagnosticHint  = diagnostic.get_diagnostic_hint
local DiagnosticInfo  = diagnostic.get_diagnostic_info
-- LSP
local GetLspClient    = lspclient.get_lsp_client

local function file_condition()
  local tbl = {['alpha']=true, ['']=true}
  if tbl[vim.bo.filetype] then
    return false
  end
  return true
end

local gls = gl.section
gls.left[1] = {
  fileicon = {
    provider = FileIcon,
    highlight = { fileinfo.get_file_icon_color, colors.bg_highlight }
  }
}
gls.left[2] = {
  filename = {
    provider = FileName,
    highlight = { colors.fg, colors.bg_highlight },
    separator = '',
    separator_highlight = { colors.bg_highlight, 'NONE' },
  },
}
gls.left[3] = {
  git = {
    provider = GitBranch,
    icon = '  ',
    highlight = { colors.green, 'NONE' },
    separator = " ",
  }
}
gls.left[4] = {
  gitadd = {
    provider = DiffAdd,
    icon = "  ",
    highlight = { colors.comment, 'NONE' }
  }
}
gls.left[5] = {
  gitmod = {
    provider = DiffModified,
    icon = " 柳",
    highlight = { colors.comment, 'NONE' }
  }
}
gls.left[6] = {
  gitrem = {
    provider = DiffRemove,
    icon = "  ",
    highlight = { colors.comment, 'NONE' },
    separator = '',
    separator_highlight = { colors.bg,colors.bg_dark },

  },
}

gls.right[1] = {
  diaerr = {
    provider = DiagnosticError,
    icon = signs.Error,
    highlight = { colors.red, colors.bg },
    separator = '',
    separator_highlight = { colors.bg, colors.bg_dark },
  }
}
gls.right[2] = {
  diagwarn = {
    provider = DiagnosticWarn,
    icon = signs.Warn,
    highlight = { colors.yellow, colors.bg }
  }
}
gls.right[3] = {
  diaghint = {
    provider = DiagnosticHint,
    icon = signs.Hint,
    highlight = { colors.teal, colors.bg }
  }
}
gls.right[4] = {
  diaginfo = {
    provider = DiagnosticInfo,
    icon = signs.Info,
    highlight = { colors.green, colors.bg }
  }
}
gls.right[5] = {
  lsp = {
    condition = file_condition,
    provider = GetLspClient,
    highlight = { colors.fg, colors.bg },
  }
}
gls.right[6] = {
  percent = {
    provider = LinePercent,
    highlight = { colors.fg, colors.bg_highlight },
    separator = '',
    separator_highlight = { colors.bg_highlight, colors.bg },
  }
}
