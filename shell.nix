with import (builtins.fetchTarball rec {
  # grab a hash from here: https://nixos.org/channels/
  name = "nixpkgs-darwin-18.09pre154167.3d4459e31bd";
  url = "https://github.com/nixos/nixpkgs/archive/3d4459e31bdccfb581e27dfffbec44d62d121349.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "08pzpwxjrf8p7z0hcw5nhwrm6rw180g5446aandl41zvqvdjhigb";
}) {};

let
  elmTools = import (pkgs.fetchFromGitHub {
    owner = "turboMaCk";
    repo = "nix-elm-tools";
    rev = "ecfb53b289a5d2cdbf09579f9ba78a335dd857ca";
    sha256 = "1fbh6cjq93zc7li89llh9gr0hhxz8kdf6wyld8wnay5d4d8z319k";
  }) { inherit pkgs; };
in
  stdenv.mkDerivation {
    name = "elm-unicode-segmentation";
    buildInputs = [
      elmPackages.elm
      elmPackages.elm-format
      elmTools.elm-analyse
      elmTools.elm-test
      git
      gnumake
      nodePackages.uglify-js
      python37
    ];
  }
