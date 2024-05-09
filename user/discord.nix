{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    (discord.override {
      withOpenASAR = true;
      withVencord = true;
     })
  ];

}
