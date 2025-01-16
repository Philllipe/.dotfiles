{
    description = "Phillipe nix-darwin system flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
        nix-darwin.url = "github:LnL7/nix-darwin";
        nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
        nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    };

    outputs = inputs@{ self, nix-darwin, nixpkgs, nix-homebrew }:
        let
            configuration = { pkgs, config, ... }: {
                # List packages installed in system profile. To search by name, run:
                # $ nix-env -qaP | grep wget
                nixpkgs.config.allowUnfree = true;

                environment.systemPackages = [ 
                    # Apps
                    pkgs.raycast
                    pkgs.obsidian
                    pkgs.discord

                    # Utilities
                    pkgs.git
                    pkgs.fzf
                    pkgs.zoxide
                    pkgs.stow
                    pkgs.tmux
                    pkgs.ripgrep
                    pkgs.lazygit
                    pkgs.tree-sitter
                    pkgs.fd
                    pkgs.neovim

                    # Other
                    pkgs.nodejs_23
                ];

                homebrew = {
                    enable = true;
                    casks = [
                        "ghostty"
                        "arc"
                        "notion"
                        "notion-calendar"
                        "spotify"
                        "logi-options+"
                    ];
                    onActivation.cleanup = "zap";
                    onActivation.autoUpdate = true;
                    onActivation.upgrade = true;
                };

                fonts.packages = [
                    pkgs.nerd-fonts.jetbrains-mono
                ];

                system.defaults = {
                    controlcenter.BatteryShowPercentage = true;
                    controlcenter.Bluetooth = true;

                    dock.autohide = true;
                    dock.launchanim = false;
                    dock.mineffect = "scale";
                    dock.minimize-to-application = true;
                    dock.mru-spaces = false;
                    dock.show-recents = false;
                    dock.wvous-br-corner = 1;

                    dock.persistent-apps = [
                        "/Applications/Ghostty.app"
                        "/Applications/Arc.app"
                        "/Applications/Notion.app"
                        "/Applications/Notion Calendar.app"
                        "${pkgs.obsidian}/Applications/Obsidian.app"
                        "/Applications/Microsoft Outlook.app"
                        "/Applications/Spotify.app"
                        "/System/Applications/System Settings.app"
                    ];

                    finder.AppleShowAllExtensions = true;
                    finder.FXDefaultSearchScope = "SCcf";
                    finder.FXPreferredViewStyle = "clmv";
                    finder.ShowPathbar = true;

                    NSGlobalDomain._HIHideMenuBar = false;
                    NSGlobalDomain.AppleInterfaceStyle = "Dark";
                    NSGlobalDomain.AppleWindowTabbingMode = "always";
                    NSGlobalDomain.KeyRepeat = 2;

                    trackpad.FirstClickThreshold = 0;

                    WindowManager.EnableStandardClickToShowDesktop = false;
                };

                # Auto upgrade nix package and the daemon service.
                services.nix-daemon.enable = true;

                # Necessary for using flakes on this system.
                nix.settings.experimental-features = "nix-command flakes";

                # Create /etc/zshrc that loads the nix-darwin environment
                programs.zsh.enable = true;

                # Set Git commit hash for darwin-version.
                system.configurationRevision = self.rev or self.dirtyRev or null;

                # Used for backwards compatibility, please read the changelog before changing.
                # $ darwin-rebuild changelog
                system.stateVersion = 5;

                # The platform the configuration will be used on.
                nixpkgs.hostPlatform = "aarch64-darwin";
            };
        in
            {
            # Build darwin flake using:
            # $ darwin-rebuild build --flake .#simple
            darwinConfigurations."macbook" = nix-darwin.lib.darwinSystem {
                modules = [ 
                    configuration
                    nix-homebrew.darwinModules.nix-homebrew
                    {
                        nix-homebrew = {
                            enable = true;
                            enableRosetta = true;
                            user = "phillipe";
                        };
                    } 
                ];
            };

            # Expose the package set, including overlays, for convenience.
            darwinPackages = self.darwinConfigurations."macbook".pkgs;
        };
}
