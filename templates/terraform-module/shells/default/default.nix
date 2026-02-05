{
  lib,
  inputs,
  namespace,
  pkgs,
  mkShell,
  config,
  system,
  ...
}: let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
  mkShell {
    packages = with pkgs; [
      tfsec
      tflint
      terraform
      pre-commit
      glow
    ];
    shellHook = ''
      pre-commit install --install-hooks
      glow README.direnv.md
    '';
  }
