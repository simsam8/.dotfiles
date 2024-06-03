
{ pkgs ? import <nixpkgs> {} }:
(pkgs.buildFHSUserEnv {
  name = "QT6-pipdev";
  targetPkgs = pkgs: (with pkgs; [
    python311
    python311Packages.pip
    python311Packages.virtualenv
    qt6.full
    binutils
    xcb-util-cursor
    dbus
    stdenv
    libGL
    xorg.libX11
    libxkbcommon
    glib
    zlib
    fontconfig
    freetype
    expat
    xorg.libxcb
    xorg.xcbutilwm
    xorg.xcbutilimage
    xorg.xcbutilkeysyms
    xorg.xcbutilrenderutil
  ]);
  runScript = "bash";
}).env
