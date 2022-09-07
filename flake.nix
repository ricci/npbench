{
  description = "A flake for executing NPbench";

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux =
      with nixpkgs.legacyPackages.x86_64-linux;
      let 
        python-with-my-packages = python310.withPackages
         (python-packages: with python-packages; [
          matplotlib
          numpy
          pandas
          #pygount
          scipy
          setuptools
        ]);
      in
      stdenv.mkDerivation {
        name = "NPbench";
        buildInputs = [ python-with-my-packages ];
        src = self;
      };
  };
}
