set quiet

src_dir := env_var_or_default("SRC", join(justfile_directory(), "src"))

alias b   := build
alias bp  := build-presentable
alias bs  := build-slide
alias bps := build-presentable-slide
alias bsp := build-presentable-slide
alias ba  := build-all
alias bap := build-all-presentable
alias bpa := build-all-presentable

alias build-slide-presentable := build-presentable-slide
alias build-presentable-all   := build-all-presentable

alias h     := help
alias about := help

[no-cd]
default:
  [ -f '{{join(".", "main.md")}}' ] && just build || just build-all

# Convert input Markdown file to PDF in output_dir
[no-cd]
build input=join(".", "main.md") output_dir="." *EXTRA_ARGS="":
  #!/usr/bin/env sh
  if [ ! -f '{{input}}' ]
  then
      echo 'Input "{{input}}" does not exist or is not a regular file!' >/dev/stderr
      exit 1
  fi
  if [ ! -d '{{output_dir}}' ]
  then
      echo 'Output directory "{{output_dir}}" does not exist or is not a directory!' >/dev/stderr
      exit 2
  fi

  input_dir="{{parent_directory(absolute_path(join(invocation_directory(), input)))}}"
  cd "$input_dir"
  output_file="{{absolute_path(join(output_dir, "${input_dir##*/}.pdf"))}}"
  echo '"{{input}}" -> "'$output_file'"'

  input_file="{{input}}"
  input_file="${input_file##*/}"
  pandoc --pdf-engine=xelatex -t beamer --slide-level=2       \
         --metadata-file="{{join(src_dir, "metadata.yaml")}}" \
         -s "$input_file"                                     \
         -o "$output_file" {{EXTRA_ARGS}}

# Like build, but PDF has incremental lists and navigation symbols
build-presentable input=join(".", "main.md") output_dir=".": (build input output_dir "-i" "-V navigation=horizontal")

# Like build, but take slide number instead of Markdown file
[no-cd]
build-slide number output_dir="." *EXTRA_ARGS="": (_build-slide 'build' number output_dir EXTRA_ARGS)

# Like build-presentable, but take slide number instead of Markdown file
[no-cd]
build-presentable-slide number output_dir="." *EXTRA_ARGS="": (_build-slide 'build-presentable' number output_dir EXTRA_ARGS)

_build-slide type number output_dir="." *EXTRA_ARGS="":
  just {{type}} {{join(src_dir, "0*" + number + "*", "main.md")}} {{output_dir}} {{EXTRA_ARGS}}

# Build all presentations in SRC
build-all output_dir=join(justfile_directory(), "slides") *EXTRA_ARGS="":
  #!/usr/bin/env sh
  mkdir -p "{{output_dir}}"
  for presentation in {{join(src_dir, "*", "")}}
  do
      just build "${presentation}main.md" "{{output_dir}}" {{EXTRA_ARGS}} || break
  done

# Like build-all, but build-presentable is used for each slide
build-all-presentable output_dir=join(justfile_directory(), "present"): (build-all output_dir "-i" "-V navigation=horizontal")

notes:
  nvim -V1 -Es -u '~/.config/nvim/init.lua' +":Neorg export to-file ./notes/structure.md" ./notes/structure.norg
  awk '/^#/ { match($0, /^#+/); if (RLENGTH != l) c = 1; l = RLENGTH; sub(/# /, "&" ((l == 1) ? "Лекция " ++tc ")" : c++ ".") " ") } 1' ./notes/structure.md > temp
  mv temp ./notes/structure.md
  pandoc ./notes/structure.md -f markdown -t pdf --pdf-engine=xelatex -V mainfont="Liberation Serif" -V linkcolor="blue" -s -o ./notes/structure.pdf

help:
  #!/usr/bin/env sh
  bold=$(echo -e '\033[1m')
  green=$(echo -e '\033[32m')
  yellow=$(echo -e '\033[33m')
  res=$(echo -e '\033[0m')
  cat <<EOF
  ${bold}${green}RELATIVE TO CURRENT/WORKING DIRECTORY${res}

    ${green}b     ${yellow}[MD_FILE_PATH] [OUTPUT_DIRECTORY]${res}
    ${green}build ${yellow}[MD_FILE_PATH] [OUTPUT_DIRECTORY]${res}
        Convert Markdown file to PDF

    ${green}bp                ${yellow}[MD_FILE_PATH] [OUTPUT_DIRECTORY]${res}
    ${green}build-presentable ${yellow}[MD_FILE_PATH] [OUTPUT_DIRECTORY]${res}
        Convert Markdown file to PDF, where unordered lists are incremental and
        bottom-right navbar is inserted

  ${bold}${green}RELATIVE TO REPOSITORY ROOT DIRECTORY${res}

    ${green}bs          ${yellow}[PRESENTATION_NUMBER] [OUTPUT_DIRECTORY]${res}
    ${green}build-slide ${yellow}[PRESENTATION_NUMBER] [OUTPUT_DIRECTORY]${res}
        Convert presentation to PDF

    ${green}bsp                     ${yellow}[PRESENTATION_NUMBER] [OUTPUT_DIRECTORY]${res}
    ${green}build-slide-presentable ${yellow}[PRESENTATION_NUMBER] [OUTPUT_DIRECTORY]${res}
        Convert presentation to PDF, where unordered lists are incremental and
        bottom-right navbar is inserted

    ${green}ba        ${yellow}[OUTPUT_DIRECTORY]${res}
    ${green}build-all ${yellow}[OUTPUT_DIRECTORY]${res}
        Convert all presentations to PDF files

    ${green}bap                   ${yellow}[OUTPUT_DIRECTORY]${res}
    ${green}build-all-presentable ${yellow}[OUTPUT_DIRECTORY]${res}
        Convert all presentations to PDF files, where unordered lists are
        incremental and bottom-right navbar is inserted
  EOF
