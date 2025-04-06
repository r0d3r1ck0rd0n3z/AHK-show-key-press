#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

SetTimer(CheckKeys, 100)

global lastKeys := ""
global modGui := Gui("+AlwaysOnTop -Caption +ToolWindow")
modGui.BackColor := "Black"
modGui.SetFont("s20 bold cWhite")

; Make GUI fully draggable
OnMessage(0x201, (*) => PostMessage(0xA1, 2, modGUI.Hwnd))

textElement := modGui.Add("Text", "Left x15 y10 BackgroundBlack", "")

CheckKeys() {
    global lastKeys, modGui, textElement

    keys := ""

  ; Check CTRL, ALT & SHIFT
    if GetKeyState("Ctrl", "P")
       keys .= "Ctrl "
    if GetKeyState("Alt", "P")
       keys .= "Alt "
    if GetKeyState("Shift", "P")
       keys .= "Shift "


  ; Check A–Z
    loop 26 {
        char := Chr(64 + A_Index)  ; Chr(65)="A" to Chr(90)="Z"
        if GetKeyState(char, "P")
           keys .= char
    }

  ; Check 0–9
    loop 10 {
        num := Mod(A_Index, 10)  ; 1–10 → 1–9,0
        if GetKeyState(num, "P")
           keys .= num
    }

    if (keys != lastKeys) {
        lastKeys := keys


      ; Adjust width of window if modifier keys are pressed
	wdt := 20
	
	if GetKeyState("Alt")
	   wdt := wdt + 50
	if GetKeyState("Ctrl") 
	   wdt := wdt + 60
	if GetKeyState("Shift") 
	   wdt := wdt + 80
	
	textElement.Move(,,wdt)



        if (keys != "") {
            textElement.Text := RTrim(keys)
            ShowOverlay()
        } else {
            HideOverlay()
        }
    }
}

ShowOverlay() {
    global modGui
    modGui.Show("NoActivate autosize")
}

HideOverlay() {
    global modGui
    modGui.Hide()
}
