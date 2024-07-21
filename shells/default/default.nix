{ mkShell
, pkgs
, ...
}:

mkShell {
  name = "catppuccin";

  packages = with pkgs; [
    catwalk
  ];
}