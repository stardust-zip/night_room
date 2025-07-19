{ pkgs, lib, config, ...}:
{
  languages.python = {
    enable = true;
    package = pkgs.python313;
    uv = {
      enable = true;
      sync.enable = true;
    };
  };

  packages = [
    pkgs.postgresql_16
    pkgs.python313Packages.python-lsp-server
    pkgs.python313Packages.pyflakes
    pkgs.python313Packages.black

    # requirements.txt
    pkgs.python313Packages.django
    pkgs.python313Packages.djangorestframework-stubs
    pkgs.python313Packages.djangorestframework-simplejwt
  ];



  services.postgres = {
    enable = true;
    package = pkgs.postgresql_16;
  };

  enterShell = ''
    echo "--- 🐍 Welcome to the Backend Shell 🐍 ---"
    python --version
    pip --version

    echo ""
    echo "✅ Dependencies from requirements.txt have been installed."

    echo ""
    echo "🐘 PostgreSQL Info:"
    echo "   Service is running in the background."
    echo "   To connect manually, run: psql ''${config.services.postgres.psqlConnectionString}"

    echo ""
    echo "🚀 Next Steps:"
    echo "   1. If this is the first time, start your Django project: django-admin startproject myproject ."
    echo "   2. Apply database migrations: python manage.py migrate"
    echo "   3. Run the development server: python manage.py runserver"
    echo "-----------------------------------------------"
  '';


}
