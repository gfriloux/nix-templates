{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-ansible216.url = "github:NixOS/nixpkgs/nixos-25.05";
    ansible-recap = {
      url = "github:gfriloux/ansible-recap";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall = {
        namespace = "automation";
        meta = {
          name = "automation";
          title = "automation";
        };
      };
    };
}
