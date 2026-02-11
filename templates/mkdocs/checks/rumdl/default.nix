{pkgs, ...}:
pkgs.runCommand "check-rumdl" {
  src = ./../..;
  buildInputs = [pkgs.rumdl];
} ''
  echo "→ Running rumdl"
  rumdl check -d "MD046,MD005,MD013,MD031,MD007,MD038,MD034" --exclude ".venv" $src
  touch $out
''
