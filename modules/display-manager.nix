{ pkgs, ... }:
{
  # Enable Display Manager
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --cmd i3";
        user = "greeter";
      };
    };
  };
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    i3  # Make sure i3 is installed
  ];
}
