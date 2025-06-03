{ config, pkgs, ... }: {
	
  home.packages = with pkgs; [
    fish
  ];

programs.fish = {
	enable = true;
        interactiveShellInit = ''
          set fish_greeting # Disable greeting
          fastfetch # Fetch btw
        '';
	shellAliases = {
	  ".." = "cd ..";
	  "..." = "cd ../..";
	  "...." = "cd ../../../";
	  "....." = "cd ../../../../";
        };

  };
}
