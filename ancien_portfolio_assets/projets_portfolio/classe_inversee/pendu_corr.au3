#include <GUIConstantsEx.au3>
#include <EditConstants.au3>
#include <Array.au3>

; Tableau/Dictionnaire de mots à deviner
Global $mots[10]=["programmation","ordinateur","souris","clavier","plantes","mots","fleurs","orange","fichier","serveur"]
Global $mot_affiche=""; lettre/mot trouvé pour l'instant
Global $nb_essais=11

$nbr_aleatoire=Random(0,Ubound($mots)-1,1)
Global $lettres_essayees=""
Global $lettres_fausses=""

;Conversion du mot à deviner en majuscules
Global $mot_a_trouver=StringUpper($mots[$nbr_aleatoire])
For $i=0 to StringLen($mot_a_trouver)-1
	$mot_affiche&="_"
Next

;Initialisation du nombre de lettres restantes
Global $lettres_restantes=StringLen($mot_a_trouver)

;Création de l'interface graphique
$visuel = GUICreate("Jeu du Pendu", 500, 200)

; Champ de texte pour afficher le mot partiellement deviné
$visuel_mot = GUICtrlCreateLabel($mot_affiche, 10, 10, 280, 30)
GUICtrlSetFont($visuel_mot, 14, 800)

; Champ de texte pour saisir une lettre
Global $texte=GUICtrlCreateLabel("Lettre :",10,60)
Global $input_lettre = GUICtrlCreateInput("", 50, 50)
Global $bouton = GUICtrlCreateButton("Devinez", 100, 50)
Global $label_lettres_fausses=GUICtrlCreateLabel("Lettres Fausses :",10,100)
Global $visuel_lettres_fausses=GUICtrlCreateLabel("",10,115,500,20)
Global $label_essais_restants=GuiCtrlCreateLabel("Essais Restants :",200,10)
Global $essais_restants=GuiCtrlCreateLabel($nb_essais,200,25)
Global $label_nb_lettres_restantes=GuiCtrlCreateLabel("Lettres restantes : ",200,50)
Global $nb_lettres_restantes=GuiCtrlCreateLabel(StringLen($mot_a_trouver),200,65,100,10)

;Affichage de l'interface graphique
GUISetState(@SW_SHOW)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
    Case $bouton
	    ConsoleWrite("clique bouton"&@CRLF)
            Local $lettre = GUICtrlRead($input_lettre)
	    ConsoleWrite("recuperer la lettre"&@CRLF)
            If StringLen($lettre) = 1 And StringIsAlpha($lettre) Then
		$lettre=StringUpper($lettre)
                jeu($lettre)
            EndIf
            GUICtrlSetData($input_lettre, "")
    EndSwitch
WEnd


Func jeu($lettre)
	If StringInStr($lettres_essayees,$lettre)=1 Then
		$nb_essais-=1
	Else 
		$lettres_essayees &= $lettre
		If StringInStr($mot_a_trouver,$lettre)=0 Then
			$nb_essais-=1
			$lettres_fausses&=" "&$lettre
		Else	
			affichagePartieMot($lettre)
			$mot_complet=verifMot()
			$lettres_restantes-=1
			if $mot_complet  Then
				MsgBox(0,"Fin ","Vous avez gagné (avec "&11-$nb_essais&" erreurs) Le mot était "&$mot_a_trouver)
				Exit
			EndIf
			
		EndIf
	EndIf
	
	ConsoleWrite($lettres_essayees)
	GUICtrlSetData($visuel_lettres_fausses,$lettres_fausses)
	GUICtrlSetData($nb_lettres_restantes,$lettres_restantes)
	GUICtrlSetData($essais_restants,$nb_essais)
	If $nb_essais=0 Then
		Exit MsgBox(0,"Fin "," Vous avez perdu , le mot était "&$mot_a_trouver)
	EndIf
	
EndFunc

Func affichagePartieMot($lettre)
	$mot_recherche=$mot_a_trouver
        For $i =1 To StringLen($mot_a_trouver)
		If StringMid($mot_recherche,$i,1)=$lettre Then
			$mot_affiche=StringReplace($mot_affiche,$i,$lettre,1)
		EndIf
	Next
    GUICtrlSetData($visuel_mot,$mot_affiche)
EndFunc

Func verifMot()
	$retour=True
	$i=1
	While $retour=True and $i<StringLen($mot_a_trouver)
		if StringMid($mot_affiche,$i,1)="_" Then
			$retour=false
		EndIf
		$i+=1
	WEnd	
	return $retour
EndFunc