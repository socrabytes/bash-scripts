#!/bin/bash

# Define the file paths for preferences and logs
PREFERENCE_FILE=~/.zsh_theme_preferences
LOG_FILE=~/.zsh_theme_log

# Step 1: Capture the current loaded theme
CURRENT_THEME=$(echo $RANDOM_THEME)

# Step 2: Initialize the preferences file if it doesn't exist
if [ ! -f "$PREFERENCE_FILE" ]; then
    touch "$PREFERENCE_FILE"
fi

# Step 3: Initialize the log file if it doesn't exist
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi

# Step 4: Function to prompt rating on shell exit
rate_theme() {
    echo "Rate the theme '$CURRENT_THEME':"
    echo "1. Pass (Like it)"
    echo "2. Don't Like" 
    echo "3. Not Sure (Decide Later)"
    read -p "Select an option (1/2/3): " rating
    
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
}

# Step 5: Run the rating function on shell exit
trap rate_theme EXIT

# Optional: Review and Edit Preferences
edit_preferences() {
    echo "Select a theme to re-categorize:"
    select theme in $(cat "$PREFERENCE_FILE" | cut -d '=' -f 1); do
        rate_theme "$theme"
        break
    done
}

# If you want to trigger editing preferences manually, you could call the function here
# Uncomment the following line to enable manual editing at the start
# edit_preferences
