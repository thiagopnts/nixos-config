{ pkgs, ... }:

{
  # https://github.com/nix-community/home-manager/pull/2408
  environment.pathsToLink = [ "/share/fish" ];

  users.users.thiago = {
    isNormalUser = true;
    home = "/home/thiago";
    extraGroups = [ "docker" "wheel" ];
    shell = pkgs.fish;
    # FIXME: =)
    password = "nixos123";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPads0zoH4LatQPcB586ea3xGJBPb0KChV7XYcvBuN4x github@thi.ag"
    ];
  };

  nixpkgs.overlays = import ../../lib/overlays.nix ++ [
    (import ./vim.nix)
  ];
}
