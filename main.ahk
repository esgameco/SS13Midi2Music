#include AutoHotkey-Midi/Midi.ahk

Global midi

; Use first MIDI device found
Try {
    midi := new Midi()
    midi.OpenMidiIn( 0 )
} Catch, E {
    MsgBox, No Midi Device
    Exit, -1
}

; Note Map
global NoteMap := []

; Pick instrument
PickInstrument() {
    InputBox, UserInput, Pick Instrument, Possible Choices: Guitar Fiddle Sax Trumpet, False, 300, 200
    switch UserInput {
        case "Guitar": Guitar()
        case "Fiddle": Fiddle()
        case "Sax": Saxophone()
        case "Trumpet": Trumpet()
        Default: MsgBox, "No instrument selected"; 
    }
}

; Guitar - TODO: Use mouse presses to play guitar
Guitar() {

}

; Saxophone
Saxophone() { ; jmq2w3er5t6y7ui9o0p+14,8kzsxdc
    NoteMap["G3"]  := "j"
    NoteMap["G#3"] := "m"
    NoteMap["A3"]  := "q"
    NoteMap["A#3"] := "2"
    NoteMap["B3"]  := "w"

    NoteMap["C4"]  := "3"
    NoteMap["C#4"] := "e"
    NoteMap["D4"]  := "r"
    NoteMap["D#4"] := "5"
    NoteMap["E4"]  := "t"
    NoteMap["F4"]  := "6"
    NoteMap["F#4"] := "y"
    NoteMap["G4"]  := "7"
    NoteMap["G#4"] := "u"
    NoteMap["A4"]  := "i"
    NoteMap["A#4"] := "9"
    NoteMap["B4"]  := "o"

    NoteMap["C5"]  := "0"
    NoteMap["C#5"] := "p"
    NoteMap["D5"]  := "+"
    NoteMap["D#5"] := "1"
    NoteMap["E5"]  := "4"
    NoteMap["F5"]  := ","
    NoteMap["F#5"] := "8"
    NoteMap["G5"]  := "k"
    NoteMap["G#5"] := "z"
    NoteMap["A5"]  := "s"
    NoteMap["A#5"] := "x"
    NoteMap["B5"]  := "d"

    NoteMap["C6"]  := "c"
}

; Fiddle
Fiddle() { ; zsxdcvgbhnjmq2w3er5t6y7ui9o0p+14,8k
    NoteMap["A3"]  := "z"
    NoteMap["A#3"] := "s"
    NoteMap["B3"]  := "x"

    NoteMap["C4"]  := "d"
    NoteMap["C#4"] := "c"
    NoteMap["D4"]  := "v"
    NoteMap["D#4"] := "g"
    NoteMap["E4"]  := "b"
    NoteMap["F4"]  := "h"
    NoteMap["F#4"] := "n"
    NoteMap["G4"]  := "j"
    NoteMap["G#4"] := "m"
    NoteMap["A4"]  := "q"
    NoteMap["A#4"] := "2"
    NoteMap["B4"]  := "w"

    NoteMap["C5"]  := "3"
    NoteMap["C#5"] := "e"
    NoteMap["D5"]  := "r"
    NoteMap["D#5"] := "5"
    NoteMap["E5"]  := "t"
    NoteMap["F5"]  := "6"
    NoteMap["F#5"] := "y"
    NoteMap["G5"]  := "7"
    NoteMap["G#5"] := "u"
    NoteMap["A5"]  := "i"
    NoteMap["A#5"] := "9"
    NoteMap["B5"]  := "o"

    NoteMap["C6"]  := "0"
    NoteMap["C#6"] := "p"
    NoteMap["D6"]  := "+"
    NoteMap["D#6"] := "1"
    NoteMap["E6"]  := "4"
    NoteMap["F6"]  := ","
    NoteMap["F#6"] := "8"
    NoteMap["G6"]  := "k"
}

; Trumpet
Trumpet() { ; zsxdcvgbhnjmq2w3er5t6y7ui9o0p+14,
    NoteMap["E4"]  := "z"
    NoteMap["F4"]  := "s"
    NoteMap["F#4"] := "x"
    NoteMap["G4"]  := "d"
    NoteMap["G#4"] := "c"
    NoteMap["A3"]  := "v"
    NoteMap["A#3"] := "g"
    NoteMap["B3"]  := "b"

    NoteMap["C4"]  := "h"
    NoteMap["C#4"] := "n"
    NoteMap["D4"]  := "j"
    NoteMap["D#4"] := "m"
    NoteMap["E4"]  := "q"
    NoteMap["F4"]  := "2"
    NoteMap["F#4"] := "w"
    NoteMap["G4"]  := "3"
    NoteMap["G#4"] := "e"
    NoteMap["A4"]  := "r"
    NoteMap["A#4"] := "5"
    NoteMap["B4"]  := "t"

    NoteMap["C5"]  := "6"
    NoteMap["C#5"] := "y"
    NoteMap["D5"]  := "7"
    NoteMap["D#5"] := "u"
    NoteMap["E5"]  := "i"
    NoteMap["F5"]  := "9"
    NoteMap["F#5"] := "o"
    NoteMap["G5"]  := "0"
    NoteMap["G#5"] := "p"
    NoteMap["A5"]  := "+"
    NoteMap["A#5"] := "1"
    NoteMap["B5"]  := "4"

    NoteMap["C6"]  := ","
}

; Starts Key
StartKey(key) {
    C := NoteMap[key]
    SendInput, {%C% Down}
}

; Stops Key
StopKey(key) {
    C := NoteMap[key]
    SendInput, {%C% Up}
}

; Skips running midi note labels
Gosub, Menu

; Maps midi to notes defined
MidiNoteOnG3:
    StartKey("G3")
    Return
MidiNoteOffG3:
    StopKey("G3")
    Return
MidiNoteOnG#3:
    StartKey("G#3")
    Return
MidiNoteOffG#3:
    StopKey("G#3")
    Return
MidiNoteOnA3:
    StartKey("A3")
    Return
MidiNoteOffA3:
    StopKey("A3")
    Return
MidiNoteOnA#3:
    StartKey("A#3")
    Return
MidiNoteOffA#3:
    StopKey("A#3")
    Return
MidiNoteOnB3:
    StartKey("B3")
    Return
MidiNoteOffB3:
    StopKey("B3")
    Return

MidiNoteOnA4:
    StartKey("A4")
    Return
MidiNoteOffA4:
    StopKey("A4")
    Return
MidiNoteOnA#4:
    StartKey("A#4")
    Return
MidiNoteOffA#4:
    StopKey("A#4")
    Return
MidiNoteOnB4:
    StartKey("B4")
    Return
MidiNoteOffB4:
    StopKey("B4")
    Return
MidiNoteOnC4:
    StartKey("C4")
    Return
MidiNoteOffC4:
    StopKey("C4")
    Return
MidiNoteOnC#4:
    StartKey("C#4")
    Return
MidiNoteOffC#4:
    StopKey("C#4")
    Return
MidiNoteOnD4:
    StartKey("D4")
    Return
MidiNoteOffD4:
    StopKey("D4")
    Return
MidiNoteOnD#4:
    StartKey("D#4")
    Return
MidiNoteOffD#4:
    StopKey("D#4")
    Return
MidiNoteOnE4:
    StartKey("E4")
    Return
MidiNoteOffE4:
    StopKey("E4")
    Return
MidiNoteOnF4:
    StartKey("F4")
    Return
MidiNoteOffF4:
    StopKey("F4")
    Return
MidiNoteOnF#4:
    StartKey("F#4")
    Return
MidiNoteOffF#4:
    StopKey("F#4")
    Return
MidiNoteOnG4:
    StartKey("G4")
    Return
MidiNoteOffG4:
    StopKey("G4")
    Return
MidiNoteOnG#4:
    StartKey("G#4")
    Return
MidiNoteOffG#4:
    StopKey("G#4")
    Return

MidiNoteOnA5:
    StartKey("A5")
    Return
MidiNoteOffA5:
    StopKey("A5")
    Return
MidiNoteOnA#5:
    StartKey("A#5")
    Return
MidiNoteOffA#5:
    StopKey("A#5")
    Return
MidiNoteOnB5:
    StartKey("B5")
    Return
MidiNoteOffB5:
    StopKey("B5")
    Return
MidiNoteOnC5:
    StartKey("C5")
    Return
MidiNoteOffC5:
    StopKey("C5")
    Return
MidiNoteOnC#5:
    StartKey("C#5")
    Return
MidiNoteOffC#5:
    StopKey("C#5")
    Return
MidiNoteOnD5:
    StartKey("D5")
    Return
MidiNoteOffD5:
    StopKey("D5")
    Return
MidiNoteOnD#5:
    StartKey("D#5")
    Return
MidiNoteOffD#5:
    StopKey("D#5")
    Return
MidiNoteOnE5:
    StartKey("E5")
    Return
MidiNoteOffE5:
    StopKey("E5")
    Return
MidiNoteOnF5:
    StartKey("F5")
    Return
MidiNoteOffF5:
    StopKey("F5")
    Return
MidiNoteOnF#5:
    StartKey("F#5")
    Return
MidiNoteOffF#5:
    StopKey("F#5")
    Return
MidiNoteOnG5:
    StartKey("G5")
    Return
MidiNoteOffG5:
    StopKey("G5")
    Return
MidiNoteOnG#5:
    StartKey("G#5")
    Return
MidiNoteOffG#5:
    StopKey("G#5")
    Return

MidiNoteOnC6:
    StartKey("C6")
    Return
MidiNoteOffC6:
    StopKey("C6")
    Return
MidiNoteOnC#6:
    StartKey("C#6")
    Return
MidiNoteOffC#6:
    StopKey("C#6")
    Return
MidiNoteOnD6:
    StartKey("D6")
    Return
MidiNoteOffD6:
    StopKey("D6")
    Return
MidiNoteOnD#6:
    StartKey("D#6")
    Return
MidiNoteOffD#6:
    StopKey("D#6")
    Return
MidiNoteOnE6:
    StartKey("E6")
    Return
MidiNoteOffE6:
    StopKey("E6")
    Return
MidiNoteOnF6:
    StartKey("F6")
    Return
MidiNoteOffF6:
    StopKey("F6")
    Return
MidiNoteOnF#6:
    StartKey("F#6")
    Return
MidiNoteOffF#6:
    StopKey("F#6")
    Return
MidiNoteOnG6:
    StartKey("G6")
    Return
MidiNoteOffG6:
    StopKey("G6")
    Return

; Starts instrument selection menu
Menu:
    PickInstrument()
