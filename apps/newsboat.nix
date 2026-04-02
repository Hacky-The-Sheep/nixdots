{
  programs.newsboat = {
    enable = true;
    urls = [
      {
        tags = [
          "general_compute"
        ];
        url = "https://lwn.net/headlines/rss";
      }
    ];
  };
}
