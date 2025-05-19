{
  packageOverrides =
    pkgs: with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          bat
          eza
          fd
          fzf
          nnn
          ripgrep
          starship
          yazi
          zoxide
          (neovim.override {
            configure = {
              customRC = "source $XDG_CONFIG_HOME/nvim/init.vim";
                packages.myNeovimPlugins = with pkgs.vimPlugins; {
                  start = [
                    fzf-lua
                    nvim-lspconfig
                    nvim-colorizer-lua
                    vim-solarized8
                    NeoSolarized
                  ]; 
                  #opt = [];
                };
              };
            }
          )
        ];
        extraOutputsToInstall = [
          "man"
          "doc"
        ];
      };
    };
}
