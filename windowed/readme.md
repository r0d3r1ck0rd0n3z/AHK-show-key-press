# Show pressed keys in window

Displays whatever keys are currently pressed in a floating window. The window can be resized.

If using for OBS, apply a chroma key to remove the green background.


# Description
Asked AI to generate a description for me about what the code does.


This AutoHotkey v2 script is specifically designed for use with OBS (Open Broadcaster Software) for streaming or recording purposes. Here's a detailed breakdown:

### Key Differences from Previous Version:
1. **Visual Design Changes**:
   - Background color is now a teal-like color (`c00b140`)
   - Uses "Arial Rounded MT Bold" font with black text
   - Window is resizable (`+Resize` flag)
   - Has a title bar ("For OBS") unlike the previous borderless version

2. **OBS-Specific Features**:
   - The window title "For OBS" suggests it's meant to be captured as a source in OBS
   - Initial window position centered on screen (`xCenter yCenter`)
   - Starts with default width of 200 pixels (`w200`)

3. **Different Show/Hide Logic**:
   - Uses `ControlShow`/`ControlHide` on the text element instead of showing/hiding the entire GUI
   - This means the window frame remains visible even when no keys are pressed

### Functionality:
- Same core functionality as before:
  - Tracks Ctrl/Alt/Shift modifiers
  - Tracks A-Z letters
  - Tracks 0-9 numbers
  - Updates display only when key combination changes
  - Adjusts width based on active modifiers

### Technical Improvements:
1. The window is now resizable (`+Resize`) which may be useful for OBS layout adjustments
2. The persistent window frame (instead of completely hiding) makes it easier to position in OBS
3. More professional font choice for streaming purposes

### Typical OBS Use Case:
1. Add this window as a "Window Capture" source in OBS
2. Position it where you want viewers to see your key presses
3. The teal background allows for easy chroma-keying if desired
4. The persistent frame helps with alignment in OBS

### Behavior Notes:
- Keeps the window frame visible
- Text content will disappear when no keys are pressed, but the window remains
- Width adjustments occur based on modifier keys

This version is suitable for streaming setups where you want a persistent, professional-looking key display that integrates well with OBS, while the first version was more minimalistic for general desktop use.