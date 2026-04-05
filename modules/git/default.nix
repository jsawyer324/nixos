{config, pkgs, lib, ...}:

{
  programs.git = {
    enable = true;
    config = {
      user.name = "James Sawyer";
      user.email = "jsawyer324@gmail.com";
    };
  };
}