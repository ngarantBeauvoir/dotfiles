echo "Setting up macOS defaults..."
################################################################################
# System Preferences > Sound
################################################################################

# Play feedback when volume is changed
defaults write -globalDomain "com.apple.sound.beep.feedback" -int 1


################################################################################
# System Preferences > General > Language & Region
################################################################################

defaults write ".GlobalPreferences_m" AppleLanguages -array fr-CA
defaults write -globalDomain AppleLanguages -array fr-CA


################################################################################
# System Preferences > Appearance
################################################################################

# Click in the scrollbar to: Jump to the spot that's clicked
defaults write -globalDomain AppleScrollerPagingBehavior -bool true


################################################################################
# System Preferences > Accessibility
################################################################################

# Pointer Control >  Trackpad Options > Dragging Style: Three Finger Drag
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool false
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true


################################################################################
# System Preferences > Control Center
################################################################################

# Control Centre Modules > Bluetooth > Show in Menu Bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible Bluetooth" -bool true

# Control Centre Modules > Screen Mirroring > Don't Show in Menu Bar
defaults write "com.apple.airplay" showInMenuBarIfPresent -bool false

# Control Centre Modules > Sound > Always Show in Menu Bar
defaults write "com.apple.controlcenter" "NSStatusItem Visible Sound" -bool true

# Control Centre Modules > Now Playing > Don't Show in Menu Bar 
defaults write "com.apple.airplay" "NSStatusItem Visible NowPlaying" -bool false

# Menu Bar Only > Clock Options > Show Date : Always
defaults write "com.apple.menuextra.clock" ShowDate -int 2

# Menu Bar Only > Clock Options > Show tyhe day of a week
defaults write "com.apple.menuextra.clock" ShowDayOfWeek -bool true

# Menu Bar Only > Spotlight > Don't Show in Menu Bar
defaults -currentHost write com.apple.Spotlight MenuItemHidden -int 1

# Menu bar clock format
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm:ss\""


################################################################################
# System Preferences > Siri & Spotlight
################################################################################

#Ask Siri
defaults write com.apple.Siri SiriPrefStashedStatusMenuVisible -bool false
defaults write com.apple.Siri VoiceTriggerUserEnabled -bool false

# Disable Siri Suggestions
defaults write com.apple.Spotlight SiriSuggestionsEnabled -bool false



################################################################################
# System Preferences > Desktop & Dock
################################################################################

# Dock > Size:
defaults write com.apple.dock tilesize -int 36

# Dock > Magnification
defaults write com.apple.dock largesize -int 54

# Dock > Magnification
defaults write com.apple.dock magnification -bool true

# Dock > Minimize windows using: Scale effect
defaults write com.apple.dock mineffect -string "scale"

# Dock > Minimize windows into application icon
defaults write com.apple.dock minimize-to-application -bool true

# Dock > Hide recent applications in Dock
defaults write com.apple.dock "show-recents" -bool false

# Windows & Apps > Prefer tabs when opening documents
defaults write -globalDomain AppleWindowTabbingMode -string "always"

# Mission Control > Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Show hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true

# Show connected servers on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true


################################################################################
# System Preferences > Lock Screen
################################################################################

# Start Screen Saver when inactive: Never
defaults -currentHost write com.apple.screensaver idleTime -int 0


################################################################################
# System Preferences > Keyboard
################################################################################

# Key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Delay until repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Keyboard navigation
defaults write -globalDomain AppleKeyboardUIMode -int 2

# Txt Input > Show Input menu in menu bar
defaults write com.apple.TextInputMenu visible -bool false

# Txt Input > Correct spelling automatically
defaults write -globalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Txt Input > Capitalise words automatically
defaults write -globalDomain NSAutomaticCapitalizationEnabled -bool false

# Txt Input > Add full stop with double-space
defaults write -globalDomain NSAutomaticPeriodSubstitutionEnabled -bool false


################################################################################
# System Preferences > Trackpad
################################################################################

# Tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true


################################################################################
# Finder > Preferences
################################################################################

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# New Window on user home folder
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Finder > View > As List
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Search scope > Search the current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Show icon in the title bar
defaults write com.apple.universalaccess "showWindowTitlebarIcons"


# Kill affected apps
for app in "Dock" "Finder"; do
  killall "${app}" > /dev/null 2>&1
done
echo "Apps killed."

# Change default keybinding for numpad "," to "."
mkdir ~/Library/KeyBindings && cd ~/Library/KeyBindings && touch DefaultKeyBinding.dict && echo '{"#," = ("insertText:", ".");}' > DefaultKeyBinding.dict
echo "Key binding changed successfully."

# Done
echo "Done. Note that some of these changes require a logout/restart to take effect."