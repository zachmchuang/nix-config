{
  lib,
  config,
  ...
}: {
  options.kicad.enable = lib.mkEnableOption "Enable kicad";
  config = lib.mkIf config.kicad.enable {
    programs.kicad = {
      enable = true;
    };
  };
}
