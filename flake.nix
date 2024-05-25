{
  description = "Soothing pastel theme for Mathematica";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable";
    };
    catppuccin-toolbox = {
      url = "github:catppuccin/toolbox";
    };
  };

  outputs = { self, ... }@inputs:
  let
    system = "x86_64-linux";

    pkgs = import inputs.nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      packages = (with inputs.catppuccin-toolbox.packages.${pkgs.system}; [
        catwalk
        whiskers
      ]);
    };
  };
}
