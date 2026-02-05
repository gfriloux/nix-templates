{pkgs, ...}: let
  files = pkgs.lib.concatStringsSep " " [
    "$(find $src -name '*.sh')"
  ];
in
  pkgs.runCommand "check-shellcheck" {
    src = ./../..;
    buildInputs = [pkgs.shellcheck];
  } ''
    echo "→ Running shellcheck"
    shellcheck ${files}
    touch $out
  ''
