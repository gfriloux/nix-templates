{ pkgs, ... }:

pkgs.runCommand "check-ansible-lint" {
  src = ./../..;
  buildInputs = [ pkgs.ansible-lint ];
} ''

  set -euo pipefail

  # L'environnement Nix ne permet pas d'écrire dans /homeless-shelter
  export HOME="$TMPDIR"

  # Répertoires temporaires Ansible dans l’espace writable
  export ANSIBLE_LOCAL_TEMP="$TMPDIR/.ansible/tmp"
  export ANSIBLE_REMOTE_TEMP="$TMPDIR/.ansible/remote_tmp"
  mkdir -p "$ANSIBLE_LOCAL_TEMP" "$ANSIBLE_REMOTE_TEMP"

  echo "→ Running ansible-lint"
  ansible-lint --offline --profile production --exclude tests $src
  touch $out
''
