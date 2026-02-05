{
  pkgs,
  inputs,
  system,
  ...
}: let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
in
  pkgs.runCommand "check-terraform" {
    src = ./../..;
    buildInputs = [pkgs.terraform];
  } ''
    echo "→ Running terraform"
    cd $src
    terraform fmt -diff -write=false -check
    touch $out
  ''
