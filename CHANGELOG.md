# Pegasus Two - Changelog

## Version 0.2 - New Features & Bug Fixes

### 15 New Features Added:

#### 1. **Logging System**
- Automatic logging of all install, remove, and configuration actions
- Log file: `/etc/pegasus-two/pegasus.log` (or Termux equivalent)
- History file: `/etc/pegasus-two/history.log`
- Usage: Automatic (transparent to user)

#### 2. **Backup Before Removal**
- Automatically creates backups before removing git/curl/wget tools
- Backup location: `/etc/pegasus-two/backups/`
- Timestamp-based naming: `toolname_YYYYMMDD_HHMMSS.tar.gz`
- Usage: Automatic when removing tools

#### 3. **Tool Information Display**
- Show detailed information about any tool
- Command: `pegasus-two info [tool_name]`
- Displays: Name, Package, Description, URL, Installer, Dependencies, Installation Status

#### 4. **Export Installed Tools**
- Export a list of all installed tools to a file
- Command: `pegasus-two export [output_file]`
- Default file: `~/pegasus_installed_tools.txt`
- Creates timestamped list with tool names

#### 5. **Import and Install Tools**
- Install multiple tools from a file
- Command: `pegasus-two import [input_file]`
- Reads tool names from file (one per line)
- Ignores comment lines starting with #

#### 6. **Favorites System**
- Mark frequently used tools as favorites
- Commands:
  - `pegasus-two favorite add [tool_name]` - Add to favorites
  - `pegasus-two favorite remove [tool_name]` - Remove from favorites
  - `pegasus-two favorite list` - List all favorites
- Favorites stored in: `/etc/pegasus-two/favorites.dat`

#### 7. **Batch Installation**
- Install multiple tools in one command
- Command: `pegasus-two install tool1 tool2 tool3 ...`
- Automatically logs batch operations

#### 8. **Statistics Dashboard**
- View installation statistics
- Command: `pegasus-two stats`
- Shows:
  - Total tools available
  - Installed tools count
  - Not installed count
  - Total installations performed
  - Total removals performed

#### 9. **History Viewer**
- View recent installation/removal history
- Command: `pegasus-two history [n]`
- Default: Shows last 20 entries
- Displays timestamped actions

#### 10. **Dry-Run Mode**
- Test installation without executing
- Command: `pegasus-two dry-run [tool_name]`
- Shows what would be installed including dependencies
- No actual installation performed

#### 11. **List Installed Tools Only**
- View only installed tools
- Commands:
  - `pegasus-two installed`
  - `pegasus-two list installed`
- Shows green-colored list of installed tools

#### 12. **Filter by Category (CLI)**
- List tools in specific category from command line
- Command: `pegasus-two category [category_number]`
- Use `pegasus-two category` to see category list first

#### 13. **Verify Tool Installation**
- Check if tool is properly installed
- Command: `pegasus-two verify [tool_name]`
- Verifies:
  - Tool existence
  - File location
  - Executable permissions
- Shows ✓ or ✗ status indicators

#### 14. **Clean Backups**
- Remove all backup files to free space
- Command: `pegasus-two backup clean`
- Prompts for confirmation before deletion
- Logs cleanup action

#### 15. **Configuration Management**
- Store and retrieve user preferences
- Commands:
  - `pegasus-two config set [key] [value]` - Set configuration
  - `pegasus-two config get [key]` - Get specific value
  - `pegasus-two config get` - Show all configuration
- Config file: `/etc/pegasus-two/config.conf`
- Graceful error handling for permission issues

### Bug Fixes:

1. **Fixed typo in about section**
   - Changed "hakcing" to "hacking"

2. **Fixed infinite loop condition**
   - Changed `while [ true ]` to `while true` in category function

3. **Fixed wget command flag error**
   - Changed `-o` to `-O` in all wget download commands
   - The lowercase `-o` flag is for log output, uppercase `-O` is for saving files
   - Fixed 6 occurrences throughout the script
   - This bug prevented wget-based tools from downloading correctly

4. **Improved error handling**
   - Graceful handling of permission denied errors
   - Suppressed error messages for log file operations when permissions are insufficient
   - Better error messages with specific failure reasons

5. **Version updated**
   - Updated version from v0.1 to v0.2 throughout the script

### Enhanced Help System:

- Updated help text to include all 15 new features
- Better formatting with aligned descriptions
- Organized by feature categories:
  - Basic operations
  - Tool information & verification
  - Statistics & history
  - Import/export
  - Favorites
  - Advanced features

### Files Modified:

1. `pegasus-two` - Main script with all new features
2. `README.md` - Updated documentation with new commands
3. `CHANGELOG.md` - This file (new)

### Compatibility:

- All features work on both Termux and Linux systems
- Graceful degradation when permissions are insufficient
- Backward compatible with existing tool data format
- No breaking changes to existing commands

### Usage Notes:

- Logging is automatic and transparent
- Backups are created automatically before removal
- Permission errors are handled gracefully
- All new features integrate seamlessly with existing functionality

### Testing:

To test the new features:
```bash
# View help with new commands
pegasus-two help

# Test statistics
pegasus-two stats

# Test configuration
pegasus-two config set theme dark
pegasus-two config get theme

# Test favorites
pegasus-two favorite add nmap
pegasus-two favorite list

# Test dry-run
pegasus-two dry-run nmap

# Test history
pegasus-two history 10
```
