#!/bin/bash

# Função para exibir o menu
exibir_menu() {
    # Definindo cores
    BLUE='\033[1;34m'
    GREEN='\033[1;32m'
    CYAN='\033[1;36m'
    YELLOW='\033[1;33m'
    RESET='\033[0m'

    clear
    echo -e "${CYAN}==================================${RESET}"
    echo -e "${GREEN}        MENU DE INSTALAÇÃO        ${RESET}"
    echo -e "${CYAN}==================================${RESET}"
    echo -e "${YELLOW}1.${RESET} ${BLUE}Instalar ZoneMinder Ubuntu 22.04${RESET}"
    echo -e "${YELLOW}2.${RESET} ${BLUE}Criar rede em modo bridge${RESET}"
    echo -e "${YELLOW}3.${RESET} ${BLUE}Instalar outro script (placeholder)${RESET}"
    echo -e "${YELLOW}4.${RESET} ${BLUE}Sair${RESET}"
    echo -e "${CYAN}==================================${RESET}"
}

# Função para instalar o ZoneMinder
instalar_zoneminder() {
    echo "Baixando e executando o script de instalação do ZoneMinder..."
    # Link direto para o script de instalação do ZoneMinder no GitHub
    local url="https://raw.githubusercontent.com/lucfll/zoneminder/main/zonerminder%20script%20instala%C3%A7%C3%A3o"
    
    # Nome do arquivo temporário para salvar o script baixado
    local script_temp="install_zoneminder.sh"

    # Baixa o script e verifica se o download foi bem-sucedido
    if curl -sSL "$url" -o "$script_temp"; then
        chmod +x "$script_temp"
        ./"$script_temp"
        rm -f "$script_temp" # Remove o script temporário após a execução
    else
        echo "Erro: Não foi possível baixar o script de instalação do ZoneMinder!"
    fi
}

# Função para criar rede em modo bridge
criar_rede_bridge() {
    echo "Baixando e executando o script de criação de rede em modo bridge..."
    # Link direto para o script de criação de rede em modo bridge no GitHub
    local url="https://raw.githubusercontent.com/lucfll/redemodobridge/main/redemodobridge.sh"
    
    # Nome do arquivo temporário para salvar o script baixado
    local script_temp="redemodobridge.sh"

    # Baixa o script e verifica se o download foi bem-sucedido
    if curl -sSL "$url" -o "$script_temp"; then
        chmod +x "$script_temp"
        ./"$script_temp"
        rm -f "$script_temp" # Remove o script temporário após a execução
    else
        echo "Erro: Não foi possível baixar o script de criação de rede em modo bridge!"
    fi
}

# Função para outro script (placeholder)
outro_script() {
    echo "Opção de outro script em construção..."
}

# Loop principal do menu
while true; do
    exibir_menu
    read -p "Escolha uma opção: " opcao

    case $opcao in
        1)
            instalar_zoneminder
            ;;
        2)
            criar_rede_bridge
            ;;
        3)
            outro_script
            ;;
        4)
            echo "Saindo..."
            exit 0
            ;;
        *)
            echo "Opção inválida! Por favor, escolha uma opção válida."
            ;;
    esac
done

