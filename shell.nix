with import (builtins.fetchTarball rec {
  # grab a hash from here: https://nixos.org/channels/
  name = "nixpkgs-darwin-18.09pre154167.3d4459e31bd";
  url = "https://github.com/nixos/nixpkgs/archive/3d4459e31bdccfb581e27dfffbec44d62d121349.tar.gz";
  # Hash obtained using `nix-prefetch-url --unpack <url>`
  sha256 = "08pzpwxjrf8p7z0hcw5nhwrm6rw180g5446aandl41zvqvdjhigb";
}) {};

stdenv.mkDerivation {
  name = "elm-unicode-segmentation";
  buildInputs = [
    elmPackages.elm
    elmPackages.elm-format
    git
    gnumake
    python37
  ];
}
