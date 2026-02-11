{
  description = "nix-templates";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
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
        namespace = "nix-templates";
        meta = {
          name = "nix-templates";
          title = "nix-templates";
        };
      };
      templates = {
        ansible-role.description = "Basic tooling to work on ansible roles the way i want.";
        mkdocs.description = "Basic tooling to work with mkdocs the way i want.";
        terraform-module.description = "Basic tooling to work terraform modules the way i want.";
      };
    };
}
