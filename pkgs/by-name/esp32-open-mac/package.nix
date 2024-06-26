{
  stdenv,
  cmake,
  fetchFromGitHub,
  nixpkgs-esp-dev,
}:
# let correct-esp-dev = nixpkgs-esp-dev.packages.x86_64-linux.esp-idf-full;
let correct-esp-dev = nixpkgs-esp-dev.packages.x86_64-linux.esp-idf-full.override {
rev = "v5.0.1";
sha256 = "sha256-kyCEoA8synodDfYdN8gq2/ezacxz5DFOD9wrPDZC89U=";
};

in

stdenv.mkDerivation {
  pname = "esp32-open-mac";
  version = "unstable-2024-05-26";

  # NOTE: the `IDF_PATH` environment variable is set in a setupHook of nixpkgs-esp-dev

  src = fetchFromGitHub {
    owner = "esp32-open-mac";
    repo = "esp32-open-mac";
    rev = "96eb701991b4c23fcad2332934a6f9519e76fefa";
    hash = "sha256-TBgCUIsI4efrpWnucYL2A2Zj3bt52Sx0IErG5Stcdx0=";
  };

  nativeBuildInputs = [ correct-esp-dev cmake ];
}
