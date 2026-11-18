{
  # Read-only share of restored Immich originals for iPhone/Mac import.
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "zach-nix";
        "netbios name" = "zach-nix";
        "security" = "user";
        "map to guest" = "never";
        # Home LAN only (adjust if your subnet differs)
        "hosts allow" = "192.168.0. 127.0.0.1 localhost";
        "hosts deny" = "0.0.0.0/0";
      };
      "immich-photos" = {
        path = "/home/zach/immich-photos/extracted/mnt/nvme-one/library/library/admin";
        browseable = "yes";
        "read only" = "yes";
        "guest ok" = "no";
        "valid users" = "zach";
        comment = "Immich restored originals (read-only)";
      };
    };
  };

  # Helps some clients discover the share by name on the LAN
  services.samba-wsdd = {
    enable = true;
    openFirewall = true;
  };
}
