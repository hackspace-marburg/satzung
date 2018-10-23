with import <nixpkgs> {};

let
  texliveComb = texlive.combine {
    inherit (texlive) scheme-small IEEEtran;
  };
in stdenv.mkDerivation {
  name = "satzung-hsmr";
  src = ./.;

  nativeBuildInputs = [texliveComb];

  buildPhase = "pdflatex satzung.tex";
  installPhase = "cp satzung.pdf $out";
}
