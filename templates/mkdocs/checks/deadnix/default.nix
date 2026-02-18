{pkgs, ...}:
pkgs.runCommand "check-deadnix" {
  src = ./../..;
  buildInputs = [pkgs.deadnix];
} ''
  echo "→ Checking Nix formatting"
  deadnix -f $src
  touch $out
''
