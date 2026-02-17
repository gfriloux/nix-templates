{
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = with pkgs; [
    ansible-lint
    pre-commit
    glow
  ];
  shellHook = ''
    pre-commit install --install-hooks
    glow README.direnv.md
  '';
}
