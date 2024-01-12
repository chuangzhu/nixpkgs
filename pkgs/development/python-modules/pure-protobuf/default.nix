{ lib
, buildPythonPackage
, pythonOlder
, fetchFromGitHub
, poetry-core
, poetry-dynamic-versioning
, typing-extensions
, pytestCheckHook
, pytest-benchmark
, pytest-cov
, pydantic
}:

buildPythonPackage rec {
  pname = "pure-protobuf";
  version = "3.0.0";

  format = "pyproject";
  # < 3.10 requires get-annotations which isn't packaged yet
  disabled = pythonOlder "3.10";

  src = fetchFromGitHub {
    owner = "eigenein";
    repo = "protobuf";
    rev = "refs/tags/${version}";
    hash = "sha256-MjxJTX672LSEqZkH39vTD/+IhCTp6FL2z15S7Lxj6Dc=";
  };

  nativeBuildInputs = [
    poetry-core
    poetry-dynamic-versioning
    typing-extensions
  ];

  propagatedBuildInputs = [
    typing-extensions
  ];

  checkInputs = [
    pytestCheckHook
    pytest-benchmark
    pytest-cov
    pydantic
  ];

  pythonImportsCheck = [
    "pure_protobuf"
  ];

  meta = with lib; {
    description = "Python implementation of Protocol Buffers with dataclass-based schemas";
    homepage = "https://github.com/eigenein/protobuf";
    changelog = "https://github.com/eigenein/protobuf/releases/tag/${version}";
    license = licenses.mit;
    maintainers = with maintainers; [ chuangzhu ];
  };
}
