{ lib, rustPlatform, pkgs  }:

rustPlatform.buildRustPackage rec {
  pname = "fzfmenu";
  version = "0.2.2-git.5b74b33";

  src = pkgs.fetchFromGitHub {
    owner = "inogai";
    repo = "fzfmenu";
    rev = "5b74b336dad9978c9e3dda6247675af78620bb49";
    hash = "sha256-BiqBA6NTbqAqoVIu2MysQyJAmv9b5LNcafSxd0ahEjs=";
  };

  cargoHash = "sha256-e/AY0aeWtjc9g8TfRcEQjvNWxmfRiPHtAi7Gqo8rEdk=";

  meta = {
    description = "An application launcher based on fzf";
    homepage = "https://github.com/inogai/fzfmenu";
    license = lib.licenses.gpl3;
    maintainers = [ ];
  };
}
