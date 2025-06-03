{ pkgs, config, ... }: {

  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = "Maple Mono NF:size=12";
      };
      colors = {
        alpha = "0.5";  # Or use 0.5 without quotes if Home Manager accepts numbers directly
      };
    };
  };

}
