{ pkgs, ... }:

pkgs.runCommand "check-shfmt" {
  src = ./../..;
  buildInputs = [ pkgs.shfmt ];
} ''
  echo "→ Checking shell formatting"
  shfmt -d -s -i 2 -ci $src
  touch $out
''
