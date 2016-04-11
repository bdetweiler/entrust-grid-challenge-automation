;; Entrust Grid Challenge Automation
;;
;; Copyright (c) 2016, Brian Detweiler
;; All rights reserved.

;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:

;; 1. Redistributions of source code must retain the above copyright notice, this
;;      list of conditions and the following disclaimer.
;; 2. Redistributions in binary form must reproduce the above copyright notice,
;;      this list of conditions and the following disclaimer in the documentation
;;      and/or other materials provided with the distribution.

;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
;; ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
;; ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
;; (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
;; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
;; ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
;; (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;; The views and conclusions contained in the software and documentation are those
;; of the authors and should not be interpreted as representing official policies,
;; either expressed or implied, of the FreeBSD Project.

;; Use ctrl-alt-n to run the script - Change this to whatever you like
^!n::readUNMCPage()



readUNMCPage() {

    Send ^a
    Sleep 500
    Send ^c

    Loop, parse, clipboard, `n, `r
    {
        i := A_Index
        haystack := A_LoopField
        
        ;; Look for a string like [B4] [H1] [I2] [J2] and pull out those individual values
        needleRegex := "O)\[([A-Z0-9]{2})\] \[([A-Z0-9]{2})\] \[([A-Z0-9]{2})\] \[([A-Z0-9]{2})\]"

        FoundPos := RegExMatch(haystack, needleRegex, Match)
        if (FoundPos > 0)
        {
            ;; Matches
            first := Match.1
            second := Match.2
            third := Match.3
            fourth := Match.4

            ;; Grid results from my personal grid
            newFirst := mapGridChallenge(first)
            newSecond := mapGridChallenge(second)
            newThird := mapGridChallenge(third)
            newFourth := mapGridChallenge(fourth)

            ;; MsgBox, 0, Hello - %newFirst% - %newSecond% - %newThird% - %newFourth% ;; - %myMatch.Value(3)% - %myMatch.Value(4)%
            Send {tab}
            Send %newFirst%%newSecond%%newThird%%newFourth%
            Send {enter}
        }
        
        ;; IfMsgBox, No, break
    }
}

;; This will be specific to your grid card (and I made all this data up, so it's not from a real card).
mapGridChallenge(foo) {

    ;; A's
    if (foo == "A1") {
        return "C"
    }
    if (foo == "A2") {
        return "2"
    }
    if (foo == "A3") {
        return "H"
    }
    if (foo == "A4") {
        return "5"
    }
    if (foo == "A5") {
        return "1"
    }

    ;; B's
    if (foo == "B1") {
        return "J"
    }
    if (foo == "B2") {
        return "4"
    }
    if (foo == "B3") {
        return "S"
    }
    if (foo == "B4") {
        return "T"
    }
    if (foo == "B5") {
        return "N"
    }

    ;; C's
    if (foo == "C1") {
        return "7"
    }
    if (foo == "C2") {
        return "Y"
    }
    if (foo == "C3") {
        return "K"
    }
    if (foo == "C4") {
        return "1"
    }
    if (foo == "C5") {
        return "1"
    }


    ;; D's 
    if (foo == "D1") {
        return "1"
    }
    if (foo == "D2") {
        return "2"
    }
    if (foo == "D3") {
        return "3"
    }
    if (foo == "D4") {
        return "4"
    }
    if (foo == "D5") {
        return "5"
    }

    ;; E's
    if (foo == "E1") {
        return "S"
    }
    if (foo == "E2") {
        return "5"
    }
    if (foo == "E3") {
        return "1"
    }
    if (foo == "E4") {
        return "T"
    }
    if (foo == "E5") {
        return "N"
    }

    ;; F's
    if (foo == "F1") {
        return "2"
    }
    if (foo == "F2") {
        return "4"
    }
    if (foo == "F3") {
        return "5"
    }
    if (foo == "F4") {
        return "6"
    }
    if (foo == "F5") {
        return "7"
    }

    ;; G's
    if (foo == "G1") {
        return "M"
    }
    if (foo == "G2") {
        return "8"
    }
    if (foo == "G3") {
        return "N"
    }
    if (foo == "G4") {
        return "T"
    }
    if (foo == "G5") {
        return "S"
    }

    ;; H's
    if (foo == "H1") {
        return "0"
    }
    if (foo == "H2") {
        return "3"
    }
    if (foo == "H3") {
        return "J"
    }
    if (foo == "H4") {
        return "F"
    }
    if (foo == "H5") {
        return "I"
    }

    ;; I's
    if (foo == "I1") {
        return "S"
    }
    if (foo == "I2") {
        return "6"
    }
    if (foo == "I3") {
        return "7"
    }
    if (foo == "I4") {
        return "1"
    }
    if (foo == "I5") {
        return "M"
    }

    ;; J's
    if (foo == "J1") {
        return "S"
    }
    if (foo == "J2") {
        return "9"
    }
    if (foo == "J3") {
        return "1"
    }
    if (foo == "J4") {
        return "4"
    }
    if (foo == "J5") {
        return "F"
    }
}
