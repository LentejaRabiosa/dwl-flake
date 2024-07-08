{
  description = "DWL flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, system, config, ... }:
      let
        dwl = pkgs.callPackage ./dwl.nix {  };
      in {
        packages = {
          default = dwl;
        };
      };
    };
}
