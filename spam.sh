#!/bin/bash

# Cores e estilos
VERDE="\e[32m"
RESET="\e[0m"
NEGRITO="\e[1m"

# Função barra de carregamento animada
barra_carregamento() {
  echo -ne "${VERDE}CARREGANDO "
  for i in {1..20}; do
    echo -ne "#"
    sleep 0.1
  done
  echo -e " 100%${RESET}\n"
  sleep 0.5
}

# Visual ASCII + slogan
ascii_art() {
  clear
  echo -e "${VERDE}${NEGRITO}"
  echo "███████╗██████╗ ███╗   ███╗"
  echo "██╔════╝██╔══██╗████╗ ████║"
  echo "█████╗  ██████╔╝██╔████╔██║"
  echo "██╔══╝  ██╔══██╗██║╚██╔╝██║"
  echo "███████╗██║  ██║██║ ╚═╝ ██║"
  echo "╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝"
  echo "     DOCTOR CORINGA PRESENTS"
  echo -e "      ${NEGRITO}O PODER DO ENVIAR SPAM${RESET}"
  echo
}

menu_principal() {
  ascii_art
  echo -e "${VERDE}${NEGRITO}1) ENVIAR SPAM${RESET}"
  echo -e "${VERDE}${NEGRITO}2) DENUNCIAR NÚMERO${RESET}"
  echo -e "${VERDE}${NEGRITO}3) SAIR${RESET}"
  echo
  echo -ne "ESCOLHA UMA OPÇÃO: "
  read opcao
}

enviar_spam() {
  echo -ne "DIGITE O NÚMERO ALVO (ex: 5511999999999): "
  read numero
  echo -ne "DIGITE A QUANTIDADE DE MENSAGENS PARA ENVIAR: "
  read quantidade
  
  echo
  echo -e "${VERDE}ENVIANDO SPAM PARA $numero...${RESET}"
  barra_carregamento
  for ((i=1; i<=quantidade; i++)); do
    echo -e "${VERDE}MENSAGEM $i ENVIADA PARA $numero${RESET}"
    sleep 0.5
  done
  echo -e "${VERDE}ENVIO DE SPAM FINALIZADO!${RESET}"
  voltar_menu
}

denunciar_numero() {
  echo -ne "DIGITE O NÚMERO PARA DENUNCIAR: "
  read numero_denuncia
  echo
  echo -e "${VERDE}NÚMERO $numero_denuncia DENUNCIADO AO SISTEMA.${RESET}"
  sleep 1
  voltar_menu
}

voltar_menu() {
  echo
  echo -ne "PRESSIONE ENTER PARA VOLTAR AO MENU PRINCIPAL..."
  read
}

# Loop do menu principal
while true; do
  menu_principal
  case $opcao in
    1) enviar_spam ;;
    2) denunciar_numero ;;
    3) echo -e "${VERDE}SAINDO... OBRIGADO POR USAR O SISTEMA DO DOCTOR CORINGA!${RESET}"; exit 0 ;;
    *) echo "OPÇÃO INVÁLIDA!"; sleep 1 ;;
  esac
done
