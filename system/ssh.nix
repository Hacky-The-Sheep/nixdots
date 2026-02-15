{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "Tech_Deck" = {
        hostname = "192.168.2.2";
        user = "admin";
        port = 22;
        keyAlgorithms = "+diffie-hellman-group1-sha1,diffie-hellman-group14-sha1";
        # HostKeyAlgorithms +ssh-rsa
      };
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
