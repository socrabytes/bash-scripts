# Zsh Scripts

This directory contains scripts related to Zsh customization and management.

## theme-manager.sh

### Overview

`theme-manager.sh` is a Bash script designed to help manage and categorize Zsh themes automatically. This script is particularly useful for users who have just installed Oh My Zsh and set their `ZSH_THEME="random"`, which shuffles through different themes each time a new shell instance is opened. The script captures the currently loaded theme and, upon exiting the shell, prompts the user to categorize the theme as "Liked" or "Disliked." It will continue running until all available themes have been categorized.

### Features

- **Automatic Theme Detection**: Captures the currently loaded theme by checking the `$RANDOM_THEME` variable when you start your shell session.
- **User Prompt on Exit**: Prompts you to categorize the theme when you exit your shell session.
- **Theme Categorization**: Allows you to mark themes as "Liked" or "Disliked," and keeps track of your preferences.
- **Completion Notification**: Notifies you when all themes have been categorized, allowing you to set `ZSH_THEME_RANDOM_CANDIDATES` to cycle only through your liked themes.

### Usage

1. **Setup**:
   - Ensure the script is executable and sourced in your `.zshrc` to run automatically when you start and exit your shell sessions.
   - Add the following line to your `.zshrc`:
     ```bash
     source ~/Code-Ubuntu/bash-scripts/zsh/theme-manager.sh
     ```
   - Ensure your `.zshrc` has the following settings:
     ```bash
     ZSH_THEME="random"
     # ZSH_THEME_RANDOM_CANDIDATES=()  # Optional: Will be used once you have categorized all themes
     ```

2. **Running the Script**:
   - The script runs automatically each time you start and exit your shell.
   - When you close the shell, you will be prompted to categorize the current theme.

3. **Categorization**:
   - **Liked**: Marks the theme as a favorite and stores it in the list of "Liked" themes.
   - **Disliked**: Marks the theme as not preferred and stores it in the list of "Disliked" themes.

4. **Completion**:
   - Once all themes have been categorized, the script will notify you that all themes have been reviewed.
   - You can then edit your `.zshrc` to include only your liked themes:
     ```bash
     ZSH_THEME_RANDOM_CANDIDATES=( "theme1" "theme2" "theme3" )
     ZSH_THEME="random"
     ```

### Configuration

- **Preferences File**: The script stores your theme preferences in `~/.zsh_theme_preferences`. You can manually edit this file if needed, though it's recommended to let the script manage it.

### Example Workflow

1. Start a new terminal session.
2. A random theme is loaded, and you see it in your terminal.
3. Work as usual in your terminal session.
4. When you exit the terminal, the script prompts you to categorize the theme as "Liked" or "Disliked."
5. The script logs your preference and prepares for the next session.
6. Once all themes are categorized, update your `.zshrc` to only include the themes you like.

### Future Enhancements

- Adding a feature to revisit and change theme preferences after initial categorization.
- Integrating with Zsh theme frameworks for more advanced theme management.

### Troubleshooting

- If the script does not prompt you as expected, ensure it’s correctly sourced in your `.zshrc` and that the file has execute permissions.
- Check the `~/.zsh_theme_preferences` file for any inconsistencies or errors.


