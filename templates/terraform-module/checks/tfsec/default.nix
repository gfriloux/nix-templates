{pkgs, ...}:
pkgs.runCommand "check-tfsec" {
  src = ./../..;
  buildInputs = [pkgs.tfsec];
} ''
  echo "→ Running tfsec"
  tfsec $src
  touch $out
''
