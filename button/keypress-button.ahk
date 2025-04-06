#Requires AutoHotkey v2.0
#SingleInstance Force
Persistent

SetTimer(CheckKeys, 100)

global lastKeys := ""
global modGui := Gui("+AlwaysOnTop +ToolWindow +Resize","For OBS")
modGui.BackColor := "c00b140"
modGui.SetFont("s20 bold cBlack","Arial Rounded MT Bold")

textElementA := modGui.Add("button", "Left x10  y10 w0 w80 -Wrap", "")
textElementB := modGui.Add("button", "Left x10  y10 w0 w38 -Wrap", "")
textElementC := modGui.Add("button", "Left x100 y10 w0 w38 -Wrap", "") 

; Make GUI fully draggable
OnMessage(0x201, (*) => PostMessage(0xA1, 2, modGUI.Hwnd))

CheckKeys() {
    global lastKeys, modGui, textElement

    keysA := ""
	keysB := ""

    ; Check CTRL, ALT & SHIFT
    if GetKeyState("Ctrl", "P")
       keysA .= " Ctrl "
    if GetKeyState("Alt", "P")
       keysA .= " Alt "
    if GetKeyState("Shift", "P")
       keysA .= " Shift "


    ; Check A–Z
    loop 26 {
        char := Chr(64 + A_Index)  ; Chr(65)="A" to Chr(90)="Z"
        if GetKeyState(char, "P")
           keysB .= " " char " "
    }

    ; Check 0–9
    loop 10 {
        num := Mod(A_Index, 10)  ; 1–10 → 1–9,0
        if GetKeyState(num, "P")
           keysB .= " " num " "
    }

    if (keysA != lastKeys or keysB != lastKeys) {
        
	if 	keysA = ""
		lastKeys := keysB
	if 	keysB = ""
		lastKeys := keysA


        if (keysA != "" or keysB != "") {
            	textElementA.Text := RTrim(keysA)
		textElementB.Text := RTrim(keysB)
		textElementC.Text := RTrim(keysB)
            	ShowOverlay()
        } else {
            HideOverlay()
        }
    }
}

ShowOverlay() {
    global textElementA, textElementB, textElementC


	if 	( GetKeyState("Alt") or GetKeyState("Ctrl") or GetKeyState("Shift") ) {
		ControlShow textElementA
		ControlHide textElementB
		if textElementC.Text != "" 
		   ControlShow textElementC 
		if textElementC.Text = "" 
		   ControlHide textElementC 
		}

	else 	{
		ControlHide textElementA
		ControlShow textElementB
		ControlHide textElementC
		}

}

HideOverlay() {
    	global textElementA, textElementB, textElementC
	ControlHide textElementA
	ControlHide textElementB
	ControlHide textElementC
}

HideOverlay()
modGui.Show("xCenter yCenter w200")
