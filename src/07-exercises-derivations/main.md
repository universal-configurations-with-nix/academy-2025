---
title: Задачи по пакетиране на програми с Nix
date: 24.04.2025
---

## Преговор

::: nonincremental

- Разгледали сме до сега пакетиране на програми чрез:

  - `builtins.derivation`
  - `stdenv.mkDerivation`
  - `buildGoModule`
  - `buildRustPackage`
  - `buildDotnetModule`
  - `buildNimPackage`
  - `buildPythonApplication`

:::

# Задачи

- Може (трябва) да използвате функции в `builtins` и `nixpkgs`

- **Не** може да използвате (други) външни библиотеки за пакетиране

- Може да зачитате, че програма е пакетирана ако `program --help` *или* `program --version` върнат резултат

- Пакетирайте най-новия releasе, ако такъв съществува

- При доста пакети, `check` фазата няма да тръгне директно.
  Не е проблем да я изключите.

## Пакетирайте Python програми

**Задача 1** - <https://github.com/OpenTTD/nml>

**Задача 2** - <https://github.com/LoLei/razer-cli>

**Задача 3** - <https://codeberg.org/svartstare/pass2csv>\
*Упътване: използвайте `fetchFromGitea`, документация [тук](https://ryantm.github.io/nixpkgs/builders/fetchers/#fetchfromgitea)*

## Пакетирайте Rust програми

**Задача 4** - <https://github.com/evmar/n2>

**Задача 5** - <https://gitlab.com/kornelski/mandown>\
*Упътване: използвайте `fetchFromGitLab`, използва се по същия начин като `fetchFromGitHub`*

**Задача 6** - <https://crates.io/crates/petname>\
*Упътване: използвайте `fetchCrate`, за да си спестите `Cargo.lock`. То приема `pname` и `version` от crates.io, и също приема `hash`.*

## Пакетирайте Go програми

**Задача 7** - <https://github.com/cfoust/cy>

**Задача 8** - <https://github.com/lestrrat-go/jwx>\
*Упътване: забележете в коя директория в хранилището се намира jwx и използвайте `modRoot`*

**Задача 9** - <https://chromium.googlesource.com/infra/luci/luci-go>\
*Упътване: използвайте `fetchFromGitiles`, документация [тук](https://ryantm.github.io/nixpkgs/builders/fetchers/#fetchfromgitiles)*

## Пакетирайте Nim програми

**Задача 10** - <https://github.com/nim-lang/c2nim>

**Задача 11** - <https://git.sr.ht/~ehmry/base45>\
*Упътване: използвайте `fetchFromSourcehut`, документация [тук](https://ryantm.github.io/nixpkgs/builders/fetchers/#fetchfromsourcehut)*

**Задача 12** - <https://github.com/jiro4989/nimtetris>\
*Упътване: създайте "lock" файл през `nim_lk`*
