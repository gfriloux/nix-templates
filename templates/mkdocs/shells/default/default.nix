{
  pkgs,
  mkShell,
  ...
}:
mkShell {
  packages = with pkgs; [
    python312
    python312Packages.pip
    pipenv
    process-compose
    glow
    just
    fzf-make
    pre-commit
    rumdl
    zellij
  ];
  shellHook = ''
    pre-commit install -f --install-hooks
    pipenv install
    glow README.direnv.md
  '';
}
