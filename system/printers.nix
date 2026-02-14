{pkgs-unstable, ...}: {
  # Printer Drivers
  services.printing = {
    enable = true;
    drivers = with pkgs-unstable; [
      brlaser
      cups-toshiba-estudio
      epsonscan2
      ptouch-driver
    ];
  };

  # Avahi
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Printers
  hardware.printers = {
    ensurePrinters = [
      {
        name = "TechDeckStudent";
        location = "Work";
        deviceUri = "http://10.66.1.1";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
      {
        name = "TechDeckColor";
        location = "Work";
        deviceUri = "http://10.66.1.220";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
      {
        name = "Toshiba1";
        location = "Work";
        deviceUri = "http://10.0.2.71";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
      {
        name = "Toshiba_Color";
        location = "Work";
        deviceUri = "http://10.0.2.74";
        model = "drv:///sample.drv/generic.ppd";
        ppdOptions = {
          PageSize = "A4";
        };
      }
    ];
    ensureDefaultPrinter = "TechDeckStudent";
  };
}
