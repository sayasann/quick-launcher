# App Launcher

Tired of opening applications one by one every time?

A simple tool that launches your selected applications sequentially on Windows, with a time interval you specify.

Run it from the shell with `./launcher.sh`

## Features

- Launch multiple applications with a custom time interval
- IntelliJ IDEA project manager - list and open your projects directly
- Create new Spring Boot projects via Spring Initializr

## Usage

1. Add your application paths to `apps.txt`
2. Run `./launcher.sh`
3. Choose from the menu:
   - **[1]** Launch all applications
   - **[2]** Open an IntelliJ project or create a new one via Spring Initializr
   - **[3]** Close all tabs
4. Enter the time interval (seconds)
5. Confirm

## Files

- `launcher.sh` - Main script
- `apps.txt` - Application list (add this to .gitignore)

## Example (apps.txt)

/c/Program Files/Microsoft SQL Server Management Studio 21/Release/Common7/IDE/SSMS.exe

/c/Program Files/JetBrains/IntelliJ IDEA 2024.1/bin/idea64.exe

/c/Users/username/AppData/Local/Programs/Microsoft VS Code/Code.exe

/c/Users/username/AppData/Local/Postman/Postman.exe

/c/Program Files/Git/git-bash.exe


## Requirements

- Git Bash (https://git-scm.com/download/win)
- Windows
- IntelliJ IDEA (for project manager feature)

## License

MIT
