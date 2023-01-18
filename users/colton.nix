let
  disabled = { enable = true; };
  enabled = { enable = true; };
  withNushell = { enableNushellIntegration = true; };
  withZsh = { enableZshIntegration = true; };
in
{
  home = {
    stateVersion = "22.11";

    username = "colton";
  };

  editorconfig = enabled // {
    settings."*" = {
      charset = "utf-8";
      end_of_line = "lf";
      indent_size = 2;
      indent_style = "tab";
      insert_final_newline = true;
      trim_trailing_whitespace = true;
    };
  };

  programs = {
    bash = enabled;
    bat = enabled;
    bottom = enabled;

    command-not-found = enabled;

    direnv = enabled // withZsh;

    gh = enabled // {
      settings.git_protocol = "ssh";
    };
    git = enabled // {
      userName = "Colton Donnelly";

      aliases = {
        cam = "commit -am";
      };
    };

    lsd = enabled;

    neovim = enabled;

    skim = enabled // withZsh // {
      defaultCommand = "fd --type f || find .";
    };
    starship = enabled // withZsh // {
      settings = {
        add_newline = false;
        format = "$username"
          + "$hostname"
          + "$directory"
          + "$git_branch"
          + "$git_state"
          + "$cmd_duration"
          + "$line_break"
          + "$character";

        character = {
          success_symbol = "[❯](purple)";
          error_symbol = "[❯](red)";
          vimcmd_symbol = "[❮](green)";
        };
        cmd_duration = {
          format = "[$duration]($style) ";
          style = "yellow";
        };

        directory = {
          style = "blue";
        };

        git_branch = {
          format = "[$branch]($style)";
          style = "bright-black";
        };
        git_status = {
          format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
          style = "cyan";
          conflicted = "";
          untracked = "​";
          modified = "​";
          staged = "​";
          renamed = "​";
          deleted = "​";
          stashed = "≡";
        };
        git_state = {
          format = "\\([$state( $progress_current/$progress_total)]($style)\\) ";
          style = "bright-black";
        };
      };
    };

    tealdeer = enabled;

    vscode = enabled;

    zoxide = enabled // withZsh;
    zsh = enabled // {
      autocd = false;
      defaultKeymap = "viins";
      enableAutosuggestions = true;
      enableSyntaxHighlighting = true;
      profileExtra = ''
        # because i'm sick of setting this every time i run darwin-rebuild
        export NIXPKGS_ALLOW_UNFREE=1
        export PAGER="bat"
      '';
      shellAliases = {
        k = "clear";
      };

      oh-my-zsh = enabled // {
        plugins = [
          # "deno"
          # "direnv"
          # "fnm"
          # "gh"
          # "git"
          # "golang"
          # "man"
          # "ripgrep"
          # "rust"
          "vi-mode"
        ];
      };
    };
  };
}
