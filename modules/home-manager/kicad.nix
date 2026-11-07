{
  lib,
  config,
  pkgs,
  ...
}: {
  options.kicad.enable = lib.mkEnableOption "Enable KiCad";

  config = lib.mkIf config.kicad.enable {
    home.packages = [
      pkgs.kicad
    ];
  };
}
