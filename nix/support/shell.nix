{ cell, inputs }@_stdArgs: {
  default = inputs.devenv.lib.mkShell
    {
      inherit inputs;
      pkgs = inputs.nixpkgs;
      modules = [
        ({ config, pkgs, ... }: {
          languages.nix.enable = true;
          packages = with pkgs; [
            nixpkgs-fmt
          ];
        })
      ];
    };
}
