{
  lib,
  config,
  ...
}: {
  options.git.enable = lib.mkEnableOption "Enable git";
  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      settings = {
        user.name = "Zachary Chuang";
        user.email = "zmchuang365@gmail.com";
        init.defaultBranch = "main";
        gpg.format = "ssh";
      };
    };
  };
}
