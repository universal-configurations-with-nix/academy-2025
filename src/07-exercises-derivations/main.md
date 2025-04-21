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

- При доста пакети, `check` фазата няма да тръгне директно.
  Не е проблем да я изключите.

## Пакетирайте Python програми

**Задача 1** - <https://github.com/OpenTTD/nml>

**Задача 2** - <https://github.com/LoLei/razer-cli>

**Задача 3** - <https://codeberg.org/svartstare/pass2csv>

## Пакетирайте Rust програми

**Задача 4** - <https://github.com/evmar/n2>

**Задача 5** - <https://gitlab.com/kornelski/mandown>

**Задача 6** - <https://crates.io/crates/toml2nix>\
*Упътване: използвайте `fetchCrate` и създайте `Cargo.lock`*

## Пакетирайте Go програми

**Задача 7** - <https://github.com/cfoust/cy>

**Задача 8** - <https://github.com/lestrrat-go/jwx>\
*Упътване: забележете в коя директория се намира изходния код*

**Задача 9** - <https://chromium.googlesource.com/infra/luci/luci-go>\
*Упътване: използвайте `fetchFromGitiles`*

## Пакетирайте Nim програми

**Задача 10** - <https://github.com/nim-lang/c2nim>

**Задача 11** - <https://git.sr.ht/~ehmry/base45>\
*Упътване: използвайте `fetchFromSourcehut`*

**Задача 12** - <https://github.com/joachimschmidt557/nimmm>\
*Упътване: създайте lock файл*

## Пакетирайте C# програми

*Упътване: използвайте версия 8.0 на sdk и runtime*

**Задача 13** - <https://github.com/tyrrrz/discordchatexporter>

**Задача 14** - <https://github.com/calebh/Juniper>

**Задача 15** - <https://github.com/studyzy/imewlconverter>
