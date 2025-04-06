# Borderless

AHK script that displays whatever key is currently pressed in a floating borderless window. The window can be dragged to any position.


<br><br>

# Description
Asked AI to generate a description for me about what the code does.


🤖⬇️

<br><br>



This AutoHotkey v2 script creates an overlay that displays currently pressed modifier keys (Ctrl, Alt, Shift) and alphanumeric keys (A-Z and 0-9) in real-time. Here's a detailed breakdown:

### Key Features:
1. **Persistent Overlay**:
   - Creates a small, always-on-top, borderless window (GUI) that shows pressed keys
   - The window has a black background with white text (size 20, bold)
   - The overlay is draggable (can be moved by clicking and dragging)

2. **Key Monitoring**:
   - Checks every 100ms (via SetTimer) for pressed keys
   - Tracks:
     - Modifier keys: Ctrl, Alt, Shift
     - Alphabet keys: A-Z
     - Number keys: 0-9

3. **Dynamic Display**:
   - Only shows the overlay when at least one key is pressed
   - Automatically hides when no keys are pressed
   - Adjusts the window width based on which modifiers are pressed:
     - Alt adds 50 pixels
     - Ctrl adds 60 pixels
     - Shift adds 80 pixels
   - Starts with a base width of 20 pixels

4. **Efficiency**:
   - Only updates the display when the pressed keys change (compares to lastKeys)
   - Uses RTrim to remove trailing spaces from the key display

### Technical Details:
- `#Requires AutoHotkey v2.0`: Specifies AHK version requirement
- `#SingleInstance Force`: Prevents multiple instances
- `Persistent`: Keeps script running even without timers
- The GUI is created with:
  - `+AlwaysOnTop`: Stays above other windows
  - `-Caption`: No title bar
  - `+ToolWindow`: Special style that doesn't show in taskbar

### Use Case:
This is useful for:
- Demonstrating keyboard inputs (e.g., in tutorials)
- Verifying key presses when you can't see the keyboard
- Debugging keyboard input issues
- Creating screen recordings where key presses need to be visible

The script efficiently monitors and displays only the most commonly used keys in a clean, customizable overlay that can be moved around the screen as needed.
