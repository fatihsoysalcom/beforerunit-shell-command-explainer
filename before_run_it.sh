#!/bin/bash

# This script simulates the core functionality of BeforeRunIt.
# It intercepts commands and provides explanations before execution.

# Define a function to explain commands
explain_command() {
    local cmd="$1"
    local explanation=""

    case "$cmd" in
        ls)
            explanation="Lists directory contents. Common options: -l (long format), -a (all files)."
            ;;
        cd)
            explanation="Changes the current directory. Usage: cd <directory_path>."
            ;;
        pwd)
            explanation="Prints the current working directory."
            ;;
        mkdir)
            explanation="Creates new directories. Usage: mkdir <directory_name>."
            ;;
        rm)
            explanation="Removes files or directories. Use with caution! Common options: -r (recursive), -f (force)."
            ;;
        echo)
            explanation="Displays a line of text. Usage: echo <text_to_display>."
            ;;
        man)
            explanation="Displays the manual page for a command. Usage: man <command_name>."
            ;;
        tldr)
            explanation="Provides simplified, common examples for commands. Usage: tldr <command_name>."
            ;;
        *)
            explanation="Unknown command. Consult 'man $cmd' or 'tldr $cmd' for more info."
            ;;
    esac

    echo "\n--- BeforeRunIt Explanation ---"
    echo "Command: $cmd"
    echo "Explanation: $explanation"
    echo "-----------------------------"
}

# Main loop to read and process commands
while true; do
    read -p "$(pwd)$ " -r user_input

    # Exit if user types 'exit' or 'quit'
    if [[ "$user_input" == "exit" || "$user_input" == "quit" ]]; then
        echo "Exiting shell."
        break
    fi

    # Extract the command name (first word)
    command_name=$(echo "$user_input" | awk '{print $1}')

    # Explain the command before executing it
    explain_command "$command_name"

    # Execute the command
    eval "$user_input"
done
