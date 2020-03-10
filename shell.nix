let
  sources = import ./nix/sources.nix;
  nixpkgs = import sources.nixpkgs { };
  niv = import sources.niv { };
in with nixpkgs;
stdenv.mkDerivation {
  name = "elm-unicode-segmentation";
  buildInputs = [
    elmPackages.elm
    git
    gnumake
    niv.niv
    nodePackages.npm
    nodePackages.uglify-js
    nodejs-10_x
    python37
  ];
}
