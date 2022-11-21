{
  description = "A silly little board game application";

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      packages.x86_64-linux.elixir_1_14 = pkgs.elixir_1_14;
      packages.x86_64-linux.elixir_ls = pkgs.elixir_ls;
      packages.x86_64-linux.libnotify = pkgs.libnotify;
      packages.x86_64-linux.inotify-tools = pkgs.inotify-tools;
      packages.x86_64-linux.nodejs-19_x = pkgs.nodejs-19_x;
      packages.x86_64-linux.postgresql_15 = pkgs.postgresql_15;

      devShell.x86_64-linux = pkgs.mkShell {
        buildInputs = [
          self.packages.x86_64-linux.elixir_1_14
          self.packages.x86_64-linux.elixir_ls
          self.packages.x86_64-linux.libnotify
          self.packages.x86_64-linux.inotify-tools
          self.packages.x86_64-linux.nodejs-19_x
          self.packages.x86_64-linux.postgresql_15
        ];

        shellHook = ''
          # export PGDATA="$PWD/db"
          ####################################################################
          # Create a diretory for the generated artifacts
          ####################################################################
          mkdir -p .nix-shell
          export NIX_SHELL_DIR=$PWD/.nix-shell
          ####################################################################
          # Put the PostgreSQL databases in the project diretory.
          ####################################################################
          export PGDATA=$NIX_SHELL_DIR/db
          ####################################################################
          # Put any Mix-related data in the project directory
          ####################################################################
          export MIX_HOME="$NIX_SHELL_DIR/.mix"
          export MIX_ARCHIVES="$MIX_HOME/archives"
          export PGDATA="$PWD/db"
          export ERL_AFLAGS="-kernel shell_history enabled"
        '';
      };
    };
}
