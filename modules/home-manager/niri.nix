{
  lib,
  config,
  pkgs,
  ...
}: {
  options.niri.enable = lib.mkEnableOption "Enable niri";
  config = lib.mkIf config.niri.enable {
    xdg.configFile."niri/config.kdl".source = ./niri-config.kdl;
  };
}
