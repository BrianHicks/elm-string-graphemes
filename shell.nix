let
  sources = import ./nix/sources.nix;
  nixpkgs = import sources.nixpkgs { };
  niv = import sources.niv { };
in with nixpkgs;
stdenv.mkDerivation {
  name = "elm-unicode-segmentation";
  buildInputs = [
    elmPackages.elm
    elmPackages.elm-format
    elmPackages.elm-test
    elmPackages.elm-verify-examples
    git
    gnumake
    niv.niv
    nodePackages.uglify-js
    python37
  ];
}
