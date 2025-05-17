{ inputs }@_libArgs:
inputs.nixpkgs.lib.removeAttrs
  (inputs.haumea.lib.load {
    inputs = { inherit inputs; };
    src = ./.;
  })
  [ "lib" ]
