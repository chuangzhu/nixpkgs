{
  lib,
  buildGoModule,
  fetchFromGitHub,
}:

buildGoModule rec {
  pname = "matrix-federation-tester";
  version = "0.9";

  src = fetchFromGitHub {
    owner = "matrix-org";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-jf33eyjt4C5E1ite1NKkiQAwvB7zB9NQHdr+w/6nloQ=";
  };

  vendorHash = "sha256-UQUtD1zJaJf8UyRGUFSUHAB3OPfNFuVdc/oPUQrC6Do=";

  meta = {
    description = "Tester for Matrix federation";
    homepage = "https://federationtester.matrix.org/";
    # Check https://github.com/matrix-org/matrix-federation-tester for updates
    license = lib.licenses.unfree;
    maintainers = with lib.maintainers; [ chuangzhu ];
  };
}
