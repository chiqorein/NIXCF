{ config, pkgs, ... }:

{
  # Enable required system features
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "swift-unwrapped"
    ];
  };

  # System-level dependencies required for Swift
  environment.systemPackages = with pkgs; [
    # Basic development tools
    gnumake
    gcc
    # Swift runtime dependencies
    ncurses
    zlib
    darwin.apple_sdk.frameworks.Foundation
    # Optional but recommended tools
    swiftformat
    swiftlint
  ];
}
