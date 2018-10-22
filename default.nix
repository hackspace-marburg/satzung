with import <nixpkgs> {};

let
  texliveComb = texlive.combine {
    inherit (texlive) scheme-small
    acmart algorithm2e cm-super comment environ ifoddpage
    ncctools relsize trimspaces totpages xstring;
  };
in stdenv.mkDerivation {
  name = "satzung-hsmr";
  src = ./.;

  nativeBuildInputs = [texliveComb];

  buildPhase = "pdflatex satzung.tex";
  installPhase = "cp satzung.pdf $out";
}
