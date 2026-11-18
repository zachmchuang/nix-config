{
  lib,
  config,
  pkgs,
  ...
}: {
  options.gh.enable = lib.mkEnableOption "GitHub CLI";

  config = lib.mkIf config.gh.enable {
    home.packages = [
      pkgs.gh
    ];
  };
}
