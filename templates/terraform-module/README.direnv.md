# terraform-module

## dev env

- `nix develop`.
- `nix-direnv` → `direnv allow`.

## tests

Pas encore de protocole de tests unitaires 😭.

## checks

La commande `nix flake check` lancera les flakes de check
du code déclarés dans le dossier `/checks/`.

## git

En utilisant `nix develop` ou `direnv allow`, un `pre-commit hook`
sera installé.

Celui-ci déclenchera une batterie de tests avant validation
de vos commits, permettant de détecter un problème avant
l'execution de la `CI`.
