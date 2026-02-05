{
  description = "ansible_role";

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
        namespace = "ansible_role";
        meta = {
          name = "ansible_role";
          description = "Basic tooling to work on ansible roles";
          title = "ansible_role";
        };
      };
    };
}
