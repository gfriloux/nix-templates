{ pkgs, ... }:

pkgs.runCommand "check-shfmt" {
  src = ./../..;
  buildInputs = [ pkgs.gitleaks pkgs.git ];
} ''
  echo "→ Checking git leaks"
  gitleaks detect --source="./" --no-banner --verbose --redact
  touch $out
''
