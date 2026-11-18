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
      initContent = ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
        if [[ -r ~/.p10k.zsh ]]; then
          source ~/.p10k.zsh
        fi
      '';
    };
    home.file.".p10k.zsh".source = ./.p10k.zsh;
  };
}
