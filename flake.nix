{
  description = "A flake for executing NPbench";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with nixpkgs.legacyPackages.x86_64-linux;
      let 
        my-python-packages = python-packages: with python-packages; [
          matplotlib
          numpy
          pandas
          #pygount
          scipy
          setuptools
        ];
        python-with-my-packages = python3.withPackages my-python-packages;
      in
      stdenv.mkDerivation {
        name = "NPbench";
        buildInputs = [ python-with-my-packages ];
        src = self;
      };
  };
}
