{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "pipzone";
  targetPkgs = pkgs: (with pkgs; [
    python312
    python312Packages.pip
    python312Packages.virtualenv
    # cudaPackages.cudatoolkit
  ]);
  runScript = "bash";
  # allowUnfree = "true";
}).env
