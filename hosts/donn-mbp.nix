{
  services.nix-daemon.enable = true;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToEscape = true;
  };

  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      AppleShowAllFiles = true;
      AppleShowScrollBars = "WhenScrolling";
      NSDocumentSaveNewDocumentsToCloud = false;
    };

    dock = {
      autohide = true;
      tilesize = 50;
    };

    finder = {
      AppleShowAllFiles = true;
      CreateDesktop = false;
      ShowPathbar = true;
      ShowStatusBar = true;
    };

    loginwindow.GuestEnabled = true;

    trackpad = {
      Clicking = true;
      TrackpadThreeFingerDrag = true;
    };
  };
}
