{ pkgs, ... }:

pkgs.runCommand "check-alejandra" {
  src = ./../..;
  buildInputs = [ pkgs.alejandra ];
} ''
  echo "→ Checking Nix formatting"
  alejandra --check .
  touch $out
''
