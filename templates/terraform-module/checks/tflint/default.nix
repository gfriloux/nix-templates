{pkgs, ...}:
pkgs.runCommand "check-tflint" {
  src = ./../..;
  buildInputs = [pkgs.tflint];
} ''
  echo "→ Running tflint"
  tflint --chdir $src
  touch $out
''
