{pkgs, ...}:
pkgs.runCommand "check-gitleaks" {
  src = ./../..;
  buildInputs = [pkgs.gitleaks pkgs.git];
} ''
  echo "→ Checking git leaks"
  gitleaks detect --source="$src" --no-banner --verbose --redact
  touch $out
''
