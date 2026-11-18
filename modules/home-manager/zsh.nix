{
  lib,
  config,
  ...
}: {
  options.zsh.enable = lib.mkEnableOption "Zsh configuration";

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
