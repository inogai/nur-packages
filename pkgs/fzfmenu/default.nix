{ lib, pkgs, fetchFromGitHub }:

let
  version = "0.2.2-1";
  src = fetchFromGitHub {
    owner = "inogai";
    repo = "fzfmenu";
    rev = "f941a1ae855f5400364ae5c384bb558f9482ed6a";
    hash = "sha256-EjPnv9i1phAK5ENslpSrRXcRs9W9uNfieoi/4nbCod0=";
  };

  cargoNix = pkgs.callPackage ./Cargo.nix { inherit pkgs; };
in
(cargoNix.rootCrate.build.override {
  crateOverrides = pkgs.defaultCrateOverrides // {
    fzfmenu = attrs: {
      inherit src;
      inherit version;
      meta = {
        description = "An application launcher based on fzf";
        homepage = "https://github.com/inogai/fzfmenu";
        license = lib.licenses.gpl3;
        maintainers = [ ];
      };
    };
  };
})
