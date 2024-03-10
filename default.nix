{pkgs, ...}: let
  inherit (import ./src/packages.nix {inherit pkgs;}) mkPlatformIOPackage;
  devenvModule = import ./src/devenv.nix;
in {
  inherit devenvModule mkPlatformIOPackage;

  gcc-arm = mkPlatformIOPackage "toolchain-gccarmnoneabi" [pkgs.gcc-arm-embedded];
  openocd = mkPlatformIOPackage "tool-openocd" [pkgs.openocd];
}
