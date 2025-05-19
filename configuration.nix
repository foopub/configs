{ config, lib, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub.device = "nodev";
    grub.efiSupport = true;
    grub.useOSProber = true;
  };

  networking.hostName = "foo_nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "Europe/London";

  i18n.defaultLocale = "en_GB.UTF-8";
  console.keyMap = "uk";

  users.users.foo = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "pipewire" "audio" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      #
    ];
  };

  environment.variables = {
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_CACHE_HOME = "$HOME/.cache";
    ZDOTDIR = "$XDG_CONFIG_HOME/zsh";
    WGETRC = "$XDG_CONFIG_HOME/wget/wgetrc";
    LESSHISTFILE = "$XDG_CACHE_HOME/lesshst";
    IPYTHONDIR = "$XDG_CONFIG_HOME/ipython";
    WEECHAT_HOME = "$XDG_CONFIG_HOME/weechat";
    XINITRC = "$XDG_CONFIG_HOME/x/xinitrc";
    XAUTHORITY = "$XDG_RUNTIME_DIR/Xauthority";
    GTK_THEME = "Adwaita:dark";
    QT_AUTO_SCREEN_SCALE_FACTOR = "0";
  };

  environment.systemPackages = 
    let
      unstable = import <nixos-unstable> {} ;
    in with pkgs; 
  [
    bat
    eza
    fd
    feh
    fzf
    git
    jq
    ripgrep
    starship
    wget
    yazi
    zoxide

    # rust
    cargo
    clippy
    rust-analyzer
    rustc
    rustfmt

    # desktop
    rose-pine-cursor

    grim
    slurp
    mako
    wl-clipboard
    # gui apps
    signal-desktop
    freecad-wayland
    kicad

    (neovim.override {
      configure = {
        customRC = ''
        if filereadable(expand("$XDG_CONFIG_HOME/nvim/init.vim"))
            source ~/.config/nvim/init.vim
        endif
        ''
        ;
        packages.MyNeovimPlugins = with pkgs. vimPlugins; {
	  start = [
	    fzf-lua
	    nvim-lspconfig
	    nvim-colorizer-lua
	    NeoSolarized
	    nvim-treesitter-parsers.nix
	    ];
	  };
	};
      }
    )
  ];

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };

  programs.firefox.enable = true;

  programs.zsh.enable = true;

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-original"
    "steam-unwrapped"
    "steam-run"
  ];
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  services.greetd = {                                                      
    enable = true;                                                         
    settings = {                                                           
      default_session = {                                                  
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd sway";
        user = "greeter";                                                  
      };                                                                   
    };                                                                     
  };

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    systemWide = true;
  };

  services.spotifyd = {
    enable = true;
    # copy credential to /var/cache/private/spotifyd/oauth/credentials.json
    settings.global = {
      device_name = "Spotifyd_NixOS";
      device_type = "home_thing";
      backend = "alsa";
      volume_controller = "none";
      initial_volume = 100;
      audio_format = "S32";
      bitrate = 320;
      no_audio_cache = false;
      volume_normalisation = false;
      autoplay = false;
      disable_discovery = true;
      use_mpris = false;
    };
  };
  systemd.services.spotifyd.serviceConfig.SupplementaryGroups = [ "pipewire" ];
  
  services.btrfs.autoScrub = {
    enable = true;
    interval = "weekly";
    fileSystems = [ "/" ];
  };

  services.gnome.gnome-keyring.enable = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      font-awesome
      source-han-sans
      source-han-sans-japanese
      source-han-serif-japanese
      nerd-fonts.fira-code
    ];
    fontconfig.defaultFonts = {
      serif = [ "Noto Serif" "Source Han Serif" ];
      sansSerif = [ "Noto Sans" "Source Han Sans" ];
    };
  };

  system.copySystemConfiguration = true;
  system.autoUpgrade.enable = true;

  system.stateVersion = "24.11";
}

