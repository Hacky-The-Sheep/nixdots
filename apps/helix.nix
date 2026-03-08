{pkgs, ...}: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      editor = {
        line-number = "relative";
        bufferline = "multiple";
        cursorline = true;
        auto-format = true;
      };
      editor.lsp = {
        auto-signature-help = false;
      };
      editor.statusline = {
        left = [
          "mode"
          "spinner"
          "read-only-indicator"
          "file-modification-indicator"
        ];
        center = ["file-name"];
        right = [
          "selections"
          "position"
          "file-encoding"
          "file-line-ending"
          "file-type"
        ];
        mode.normal = "NORMAL 🐧";
        mode.insert = "INSERT 🚀";
        mode.select = "SELECT  👆";
      };
      editor.cursor-shape = {
        insert = "bar";
        select = "underline";
      };
      editor.indent-guides = {
        render = true;
      };
      keys.normal = {
        esc = [
          "collapse_selection"
          "keep_primary_selection"
        ];
        C-space = "signature_help";
        X = "extend_line_up";
        C-l = "extend_to_line_end";
      };
      keys.normal.space = {
        w = ":write";
        q = ":quit";
        b = ":buffer-close";
      };
    };
    languages = {
      language-server.nixd = with pkgs.nixd; {
        command = "nixd";
      };
      language = [
        {
          name = "python";
          scope = "source.python";
          injection-regex = "python";
          file-types = [
            "py"
            "pyi"
            "py3"
            "pyw"
            ".pythonstartup"
            ".pythonrc"
          ];
          shebangs = ["python"];
          roots = [
            "."
            "pyproject.toml"
            "pyrightconfig.json"
          ];
          comment-token = "#";
          language-servers = [
            "pyright"
            "ruff"
            "pylsp"
          ];
          formatter = {
            command = "ruff";
            args = ["format" "-"];
          };
          auto-format = true;
        }
        {
          name = "nix";
          language-servers = ["nixd"];
          formatter = {
            command = "alejandra";
          };
          auto-format = true;
        }
      ];
    };
  };
}
