{ pkgs, ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    plugins = with pkgs.vimPlugins; [
      nvim-lspconfig
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      #vim-lsc
      cmp-treesitter
      nvim-treesitter
      telescope-fzy-native-nvim




      harpoon




      # friendly-snippets
      # gitlinker-nvim
      # gitsigns-nvim
      # lualine-nvim
      # luasnip
      nvim-tree-lua
      # nvim-ts-rainbow
      # nvim-web-devicons
      # packer-nvim
      # plenary-nvim
      # vim-commentary
      # vim-markdown
      # vim-repeat
      # vim-sneak
      # vim-surround
    ];

    extraConfig = ''

            lua require('config')

            nnoremap n nzzzv    " <- centers cursors while searching through files
            nnoremap N Nzzzv    " <- centers cursors while searching through files

            map <C-h> <C-w>h
            map <C-j> <C-w>j
            map <C-k> <C-w>k
            map <C-l> <C-w>l

            inoremap [ [<C-g>u
            inoremap ] ]<C-g>u
            inoremap ( (<C-g>u
            inoremap ) )<C-g>u

            vnoremap > >gv
            vnoremap < <gv
            nnoremap < <<
            nnoremap > >>

            vnoremap J :m '>+1<CR>gv=gv
            vnoremap K :m '<-2<CR>gv=gv
            nnoremap J :m .+1<CR>==
            nnoremap K :m .-2<CR>==

            #:set list  See tabs in a file
            #!!!sidescroll=10
            #set wrap!!!
            #splitright

            nnoremap <C-d> <C-d>zz 
            nnoremap <C-u> <C-u>zz
            nnoremap <SPACE> <Nop>    " <- prevents Space executed inline in case leader follows no command

            highlight CursorLine cterm=NONE ctermbg=237
        '';
  };

  xdg.configFile."nvim/lua/config.lua".source = ../lua/config.lua;
  xdg.configFile."nvim/lua/mod_cmp.lua".source = ../lua/mod_cmp.lua;
  xdg.configFile."nvim/lua/mod_lsp.lua".source = ../lua/mod_lsp.lua;
  xdg.configFile."nvim/lua/vim_options.lua".source = ../lua/vim_options.lua;
  xdg.configFile."nvim/lua/vim_keybindings.lua".source = ../lua/vim_keybindings.lua;
}

