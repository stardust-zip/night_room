{pkgs, ...}:

{
  languages.go = {
    enable = true;
    package = pkgs.go;
  };

  packages = [
    pkgs.golangci-lint
    pkgs.gopls
    pkgs.go-tools
    pkgs.delve
  ];

  processes.backend = {
    exec = "go run ./cmd/server";
  };

  enterShell = ''
    echo "Welcome to Night Room backend environment"
    echo "Go version: $(go version)"
    echo "To run the backend server in the background, use devenv up"
    export PS1="Golang DEVENV $PS1"
  '';

}
