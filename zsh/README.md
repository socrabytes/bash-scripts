# Zsh Scripts

This directory contains scripts related to Zsh customization and management.

## theme-manager.sh

### Overview

`theme-manager.sh` is a shell `.zsh` script designed to help manage and categorize Zsh themes automatically. This script is particularly useful for users who have just installed Oh My Zsh and set their `ZSH_THEME="random"`, which shuffles through different themes each time a new shell instance is opened. The script captures the currently loaded theme and, upon exiting the shell, prompts the user to categorize the theme as "Liked" or "Disliked." It will continue running until all available themes have been categorized.

### Features

- **Automatic Theme Detection**: Captures the currently loaded theme by checking the `$RANDOM_THEME` variable when you start your shell session.
- **User Prompt on Exit**: Prompts you to categorize the theme when you exit your shell session.
- **Theme Categorization**: Allows you to mark themes as "Liked" or "Disliked," and keeps track of your preferences.
- **Logging**: Records each theme rating along with the date and time to a log file (`~/.zsh_theme_log`).
- **Completion Notification**: Notifies you when all themes have been categorized, allowing you to set `ZSH_THEME_RANDOM_CANDIDATES` to cycle only through your liked themes.

### Installation and Setup

1. **(Optional) Make the script executable**:
   ```bash
   chmod +x /path/to/theme-manager.sh
   ```
   This step is only necessary if you plan to run the script directly, but it's not required if you're sourcing it in .zshrc.

2. **Add the following line to your `.zshrc`** to source the script automatically when you start and exit your shell sessions:
   ```bash
   source /path/to/theme-manager.sh
   ```

3. **Ensure your `.zshrc` has the following settings**:
   ```bash
   ZSH_THEME="random"
   ```

### Usage

1. **Start a new terminal session**: The script will automatically capture the currently loaded random theme.
2. **Rate the theme**: Upon exiting the shell, you’ll be prompted to categorize the current theme:
    - `1` for "Pass (Like it)"
    - `2` for "Don't Like"
    - `3` for "Not Sure (Decide Later)"
3. **View Logs**: Your ratings are logged in `~/.zsh_theme_log`. You can view this file to see a history of your theme ratings.

### Example Workflow

1. Start a new terminal session.
2. A random theme is loaded, and you see it in your terminal.
3. Work as usual in your terminal session.
4. When you exit the terminal, the script prompts you to categorize the theme as "Liked" or "Disliked."
5. The script logs your preference and prepares for the next session.
6. Once all themes are categorized, update your `.zshrc` to only include the themes you like.
   ```bash
   ZSH_THEME_RANDOM_CANDIDATES=( "theme1" "theme2" "theme3" )
   ```

### Configuration
- **Preferences File**: The script stores your theme preferences in `~/.zsh_theme_preferences`. You can manually edit this file if needed, though it's recommended to let the script manage it.
- **Log File**: The script logs each theme rating with a timestamp in `~/.zsh_theme_log`. This log file provides a historical record of when and how you rated each theme. You can refer to this file if you want to review your past decisions or troubleshoot any issues with theme categorization.

### Future Enhancements

- [ ] Add a feature to automatically configure `ZSH_THEME_RANDOM_CANDIDATES` in `.zshrc` with all themes marked as "Liked" in the `.zsh_theme_preferences` file. This would allow the shell to randomly cycle through only your preferred themes.

---

### Troubleshooting

- If the script does not prompt you as expected, ensure it’s correctly sourced in your `.zshrc` and that the file has execute permissions.
- Check the `~/.zsh_theme_preferences` file for any inconsistencies or errors.


