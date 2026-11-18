{
  lib,
  config,
  pkgs,
  ...
}: {
  options.zsh.enable = lib.mkEnableOption "Zsh configuration";

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        l = "ls -lah";
        la = "ls -a";
        ll = "ls -l";
        rebuild-nix = "sudo nixos-rebuild switch --flake .#zach-nix";
        n = "nvim";
        cat = "bat";
        ff = "fastfetch";
        cd = "z";
      };
      initContent = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        if [[ -r ~/.p10k.zsh ]]; then
          source ~/.p10k.zsh
        fi
      '';
    };
    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };
    programs.bat = {
      enable = true;
      config = {
        paging = "never";
        style = "plain";
      };
    };
    # after configuring p10k, move .p10k.zsh to nix-config/modules/home-manager
    home.file.".p10k.zsh".source = ./.p10k.zsh;
  };
}
