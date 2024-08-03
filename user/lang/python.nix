{ pkgs, ...}:

{
  
  home.packages = with pkgs; [
    python3
    python311Packages.pip
    python311Packages.virtualenv
    python311Packages.pylint
    python311Packages.flake8
    python311Packages.black
    python311Packages.isort
    pyright
  ];
}
