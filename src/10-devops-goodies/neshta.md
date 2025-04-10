 terranix
Какво е terranix?

terranix ви позволява да използвате езика Nix, за да дефинирате Terraform конфигурации. В крайна сметка получавате .tf.json файлове, които се използват от стандартния Terraform.
Инсталация

Създайте shell.nix с:

```nix
{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [ pkgs.terraform pkgs.terranix ];
}
```

Примерен файл infra/config.nix

```nix
{ config, lib, ... }:

{
  terraform.required_providers.aws.source = "hashicorp/aws";

  provider.aws = {
    region = "us-east-1";
  };

  resource.aws_s3_bucket.mybucket = {
    bucket = "my-unique-nix-bucket-name";
    acl    = "private";
  };
}
```

Генериране и прилагане

```sh
terranix infra/config.nix > infra/main.tf.json
terraform -chdir=infra init
terraform -chdir=infra apply
```

Полезни съвети

- Можете да използвате nix develop с flake, за да имате terranix и terraform.

- Можете да използвате flake-parts и за Terranix проектите:

```nix
{
  perSystem = { pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      buildInputs = [ pkgs.terranix pkgs.terraform ];
    };
  };
}
```

# Cachix
Какво е Cachix?

Cachix е услуга, която ви позволява да кеширате и споделяте вашите Nix билдове в облака. Изключително полезна за CI/CD и екипна работа.
Настройка на локален проект
Инсталиране

```sh
nix-env -iA cachix -f https://cachix.org/api/v1/install
```

Конфигурация

```sh
cachix authtoken <your-token>
cachix use my-cache
```

Публикуване на билд

```sh
nix build .#myPackage
cachix push my-cache result
```

Примерна flake конфигурация с cachix

```nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];
      perSystem = { pkgs, ... }: {
        packages.default = pkgs.hello;
        devShells.default = pkgs.mkShell {
          buildInputs = [ pkgs.hello pkgs.cachix ];
          shellHook = ''
            cachix use my-cache
          '';
        };
      };
    };
}
```

# Демонстрация: CI с cachix и GitHub Actions

```yaml
name: CI

on:
  push:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: cachix/install-nix-action@v25
      - uses: cachix/cachix-action@v12
        with:
          name: my-cache
          authToken: '${{ secrets.CACHIX_AUTH_TOKEN }}'

      - run: nix build .#defaultPackage.x86_64-linux
```

#  Заключение


| Инструмент | Предимства |
| - | - |
| flake-parts | Модулност, четимост и поддръжка на flake проекти |
| terranix | Nix като DSL за Terraform |
| Cachix | Бързи билдове, кеширане и CI интеграция |

