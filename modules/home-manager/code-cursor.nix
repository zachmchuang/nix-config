{
  lib,
  config,
  pkgs,
  ...
}: {
  options.code-cursor.enable = lib.mkEnableOption "Cursor";

  config = lib.mkIf config.code-cursor.enable {
    home.packages = [
      pkgs.code-cursor
    ];
  };
}
