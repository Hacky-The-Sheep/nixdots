{
  programs.ssh = {
    matchBlocks = {
      "Asbestos_1" = {
        hostname = "10.99.0.120";
        user = "hacky";
        port = 22;
      };
      "Asbestos_2" = {
        hostname = "10.99.0.121";
        user = "hacky";
        port = 22;
      };
    };
  };
}
