{
  description = "A non-std set of Nix utilities";

  inputs = {
    devenv.url = "github:cachix/devenv";

    haumea.url = "github:nix-community/haumea";
    haumea.inputs.nixpkgs.follows = "nixpkgs";

    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, self, std, ... }@inputs:
    std.growOn
      {
        inherit inputs;
        cellsFrom = std.incl ./nix [ "support" ];
        cellBlocks = [
          (std.blockTypes.functions "shell")
        ];
      }
      {
        devShells = std.harvest self [ "support" "shell" ];
        lib = import ./nix/nonstd/lib.nix {
          inherit inputs;
        };
      };
}
