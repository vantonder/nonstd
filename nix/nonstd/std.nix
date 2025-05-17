{ inputs, ... }@_haumeaArgs:
let
  inherit (inputs) std;
  inherit (inputs.nixpkgs) lib;

  mkNixosSystem = _systemName: { host, profiles, users }:
    lib.nixosSystem {
      modules = [ host ] ++ profiles ++ users;
    };

  pickSystem = platform: target: path:
    lib.attrsets.mapAttrs
      mkNixosSystem
      (std.harvest target path)."${platform}";
in
{
  system."x86_64" = pickSystem "x86_64-linux";
}
