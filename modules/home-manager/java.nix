{
  lib,
  config,
  pkgs,
  ...
}: {
  options.java.enable = lib.mkEnableOption "JDK";

  config = lib.mkIf config.java.enable {
    programs.java = {
      enable = true;
      package = pkgs.jdk21;
    };
  };
}
