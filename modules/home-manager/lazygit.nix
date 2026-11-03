{
  lib,
  config,
  pkgs,
  ...
}: {
  options.lazygit.enable = lib.mkEnableOption "Enable lazygit";
  config = lib.mkIf config.lazygit.enable {
    home.packages = with pkgs; [
      delta
    ];
    programs.lazygit = {
      enable = true;
      settings = {
        git = {
          diffRenderers = [
            {command = "delta --dark --paging=never";}
            {
              command = "ydiff -p cat -s --wrap --width={{columnWidth}}";
              colorArg = "never";
            }
          ];
          diff = "difft --color=always";
        };
      };
    };
  };
}
