{pkgs, ...}:
pkgs.runCommand "check-tfsec" {
  src = ./../..;
  buildInputs = [pkgs.tfsec];
} ''
  echo "→ Running tfsec"
  find $src/terraform -type d | xargs -I {} tfsec {}
  touch $out
''
