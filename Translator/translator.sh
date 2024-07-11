#!/usr/bin/env bash
#By Nya
#Begin at 2024-01-08 00:03
#End at 2024-01-08 00:50
###################
# START OF SCRIPT #
###################

SCRIPTPATH=${0}

function print_help() {
	echo -e "A translation script using Nya's self-built translation API.\n\n"
	echo -e "Args: "
	echo -e "-h, --help\t print this help.\n\n"
	echo -e "Example: "
	echo -e "${SCRIPTPATH} en zsh \"I like you!\""
	echo -e "Return: "
	echo -e '{"inputs":{"text":"I like you!","source_lang":"en","target_lang":"zh"},"response":{"translated_text":"我喜欢你!"}}\n\n'
	echo -e "Analytics: "
	echo -e "${SCRIPTPATH} [source_lang] [get_lang] \"[text]\"\n\n"
}
if [[ -z $# ]]; then
	echo -e " Missing parameters.Enter \"${SCRIPTPATH} -h\" to get isage.Now exiting..." && exit 2
fi

if [[ ${1} == "-h" || ${1} == "--help" ]]; then
	print_help && exit 0
fi
echo -e "Copy the code below and execute it:"
cat <<EOF
---
curl -X POST https://translation.nnyyaa.eu.org/ -d '{
    "text": "${3}",
    "source_lang": "${1}",
    "target_lang": "${2}"
}'
---
EOF
###################
#  END OF SCRIPT  #
###################
