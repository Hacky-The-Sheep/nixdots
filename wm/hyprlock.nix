{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        no_fade_in = true;
        grace = 0;
        disable_loading = true;
      };

      background = {
        path = "screenshot";
        color = "rgba(25, 24, 38, 1.0)";
        blur_passes = 3;
        blur_size = 7;
        noise = 0.0117;
        contrast = 0.8916;
        brightness = 0.8172;
        vignette = 0.1;
        vignette_intensity = 0.5;
      };

      # input-field = {
      #   size = "250, 60";
      #   outline_thickness = 2;
      #   dots_size = 0.2;
      #   dots_spacing = 0.2;
      #   dots_center = true;
      #   outer_color = "rgb(180, 190, 254)";
      #   inner_color = "rgb(30, 30, 46)";
      #   font_color = "rgb(205, 214, 244)";
      #   fade_on_empty = true;
      #   placeholder_text = "<i>Password...</i>";
      #   hide_input = false;
      #   position = "0, -20";
      #   halign = "center";
      #   valign = "center";

      #   check_color = "rgb(249, 226, 175)";
      #   fail_color = "rgb(243, 139, 168)";
      #   fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";
      #   capslock_color = "rgb(250, 179, 135)";
      # };

      label = {
        text = "$TIME";
        color = "rgb(205, 214, 244)";
        font_size = 64;
        font_family = "Iosevka";
        position = "0, 80";
        halign = "center";
        valign = "center";
      };
    };
  };
}
