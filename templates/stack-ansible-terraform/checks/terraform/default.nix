{
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
    find $src/terraform -type d | xargs -I {} terraform -chdir={} fmt -diff -write=false -check
    touch $out
  ''
