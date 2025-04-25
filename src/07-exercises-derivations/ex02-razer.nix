# Да се има в предвид, че "razer-cli --version" ще хвърли грешка, свързана с daemon.
# Daemon-и са сървиси, програми които се изпълняват на заден план в системата.
# По условие, трябва или "--version" да работи, или "--help", и забелязваме, че
# "razer-cli --help" си работи, затова зачитаме задачата за решена.
# Проблема с daemon-a зачитаме за част от конфигурацията на системата за сег.
with import <nixpkgs> { };
python3Packages.buildPythonApplication rec {
  name = "razer";
  version = "2.3.0";

  src = fetchFromGitHub {
    owner = "LoLei";
    repo = "razer-cli";
    tag = "v${version}";
    hash = "sha256-uwTqDCYmG/5dyse0tF/CPG+9SlThyRyeHJ0OSBpcQio=";
  };

  dependencies = with python3Packages; [
    openrazer
  ];
}
