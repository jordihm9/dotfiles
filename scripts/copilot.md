# GitHub Copilot CLI
## Install
```bash
gh extension install github/gh-copilot
```
## Usage
```bash
gh copilot <command> [flags]
```
## Commands
```bash
gh copilot auth [flags]  # Authenticate with GitHub Copilot
gh copilot config [flags]  # Configure GitHub Copilot settings
gh copilot completion [flags]  # Generate shell completion scripts
gh copilot help [command]  # Display help for a specific Commands
gh copilot list [flags]  # List available GitHub Copilot features
gh copilot status [flags]  # Show the current status of GitHub Copilot CLI
gh copilot version [flags]  # Show the version of GitHub Copilot CLI
```
## Flags
```bash
--help  # Show help for GitHub Copilot CLI
--version  # Show version information for GitHub Copilot CLI
--config <file>  # Specify a custom configuration file
--no-color  # Disable colored output
--verbose  # Enable verbose output
--quiet  # Suppress all output except errors
--log-level <level>  # Set the logging level (debug, info, warn, error)
--output <format>  # Specify the output format (json, yaml, text)
--timeout <duration>  # Set a timeout for Commands
--proxy <url>  # Set a proxy URL for network requests
--no-proxy  # Disable proxy Usage
--cache-dir <path>  # Specify a custom cache directory
--no-cache  # Disable caching
--interactive  # Enable interactive mode for Commands
--no-interactive  # Disable interactive mode
--force  # Force execution of Commands, ignoring warnings
--dry-run  # Simulate the execution of Commands without making changes
--confirm  # Require confirmation before executing Commands
--no-confirm  # Skip confirmation prompts
--context <name>  # Specify a context for Commands
--no-context  # Disable context for Commands
--profile <name>  # Use a specific profile for Commands
--no-profile  # Disable profile Usage
--include <pattern>  # Include specific items matching the pattern
--exclude <pattern>  # Exclude specific items matching the pattern
--limit <number>  # Limit the number of items processed by Commands
--offset <number>  # Set the offset for pagination
--sort <field>  # Sort items by the specified field
--filter <expression>  # Filter items based on the specified expression
--query <expression>  # Query items using a specific expression
--format <template>  # Format output using a custom template
--no-headers  # Disable headers in output
--headers <fields>  # Specify which headers to include in output
--fields <fields>  # Specify which fields to include in output
--columns <fields>  # Specify which columns to include in output
--rows <number>  # Set the number of rows to display in output
--page <number>  # Set the page number for paginated output
--per-page <number>  # Set the number of items per page for paginated output
--watch  # Watch for changes and re-execute Commands
--no-watch  # Disable watching for changes
--retry <number>  # Set the number of retries for failed Commands
--retry-delay <duration>  # Set the delay between retries
```
## Suggest commit message
```bash
gh copilot commit <message> [flags]  # Suggest a commit message based on changes
```
