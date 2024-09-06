# Define the file paths for preferences and logs
PREFERENCE_FILE=~/.zsh_theme_preferences
LOG_FILE=~/.zsh_theme_log

# Initialize the preferences file if it doesn't exist
if [ ! -f "$PREFERENCE_FILE" ]; then
    touch "$PREFERENCE_FILE"
fi

# Initialize the log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi

# Function to prompt rating on shell exit
rate_theme() {
    # Capture the current loaded theme
    CURRENT_THEME=$(echo $RANDOM_THEME)
    
    echo "Rate the theme '$CURRENT_THEME':"
    echo "1. Like"
    echo "2. Don't Like" 
    echo "3. Not Sure <---- Decide Later"
    # Read user input and store it in the 'rating' variable
    read  "rating?Choose 1-3 [3]: "     
        
    # Remove any existing entry for the current theme
    sed -i "/^$CURRENT_THEME/d" "$PREFERENCE_FILE"

    # Update preferences based on user input
    case $rating in
        1)
            echo "$CURRENT_THEME=LIKED" >> "$PREFERENCE_FILE"
            echo "$(date): Rated $CURRENT_THEME as LIKED" >> "$LOG_FILE"
            ;;
        2)
            echo "$CURRENT_THEME=DISLIKED" >> "$PREFERENCE_FILE"
            echo "$(date): Rated $CURRENT_THEME as DISLIKED" >> "$LOG_FILE"
            ;;
        3)
            # No action needed, theme remains uncategorized
            echo "$(date): Deferred rating for $CURRENT_THEME" >> "$LOG_FILE"
            ;;
        *)
            echo "Invalid option. Please rate the theme properly next time."
            ;;
    esac

    # Check if all themes are categorized (excluding "Not Sure")
    ALL_THEMES=( $(ls $ZSH/themes | sed 's/\.zsh-theme$//') )  # List all available themes
    CATEGORIZED_THEMES=( $(cut -d '=' -f 1 "$PREFERENCE_FILE") )

    if [ ${#CATEGORIZED_THEMES[@]} -eq ${#ALL_THEMES[@]} ]; then
        echo "All Zsh themes have been cycled through and categorized!"
    fi
    
    # Pause before allowing the terminal to close
    read "?$CURRENT_THEME=LIKED added to .zsh_theme_log ---> Press Enter to close the terminal..."
}

# Trap the EXIT signal to run the rate_theme function before the terminal closes
trap rate_theme EXIT
