{
  stdenv,
  cmake,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "esp32-open-mac";
  version = "unstable-2024-05-26";

  src = fetchFromGitHub {
    owner = "esp32-open-mac";
    repo = "esp32-open-mac";
    rev = "96eb701991b4c23fcad2332934a6f9519e76fefa";
    hash = "sha256-TBgCUIsI4efrpWnucYL2A2Zj3bt52Sx0IErG5Stcdx0=";
  };

  nativeBuildInputs = [ cmake ];
}
