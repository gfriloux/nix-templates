{
  mkShell,
  inputs,
  system,
  ...
}: let
  pkgs = import inputs.nixpkgs {
    inherit system;
    config.allowUnfree = true;
    overlays = [inputs.ansible-recap.overlays.default];
  };
  pkgs-ansible = import inputs.nixpkgs-ansible216 {
    inherit system;
    config.allowUnfree = true;
  };
in
  mkShell {
    packages = [
      (pkgs-ansible.runCommand "ansible_2_16" {buildInputs = [pkgs-ansible.ansible_2_16 pkgs.makeWrapper];} ''
        mkdir -p $out/bin
        makeWrapper ${pkgs-ansible.ansible_2_16}/bin/ansible $out/bin/ansible_2_16 --set PYTHONPATH "${pkgs-ansible.ansible_2_16}/lib"
        makeWrapper ${pkgs-ansible.ansible_2_16}/bin/ansible-playbook $out/bin/ansible-playbook_2_16 --set PYTHONPATH "${pkgs-ansible.ansible_2_16}/lib"
      '')
      pkgs.ansible-lint
      pkgs.just
      pkgs.fzf-make
      pkgs.rbw
      pkgs.pinentry-curses
      pkgs.openssh_gssapi
      pkgs.tflint
      pkgs.tfsec
      pkgs.terraform
      pkgs.gum
      pkgs.ansible-recap
      pkgs.pre-commit
    ];
    shellHook = ''
      pre-commit install -f --install-hooks
      glow README.direnv.md
    '';
  }
