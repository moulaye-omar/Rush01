#!/bin/bash  

#generer un nombre aleatoire entre 0 et 100
#nbre_a_deviner=$((RANDOM % 100+1))
nbre_a_deviner=$(od -An -N2 -i /dev/urandom | awk '{print ($1 % 100)+1}')
#initialiser le nombre d'essaie a 0
essaie=0
#message d'accueil du joueur
echo -e "\nBienvenue dans le jeu  : devine le nombre :)\n J'ai choisi un nombre entre 1 et 100.A toi de le deviner.\n"
#boucle infini si la condition n'est pas vraie ou qu'il sort pas du boucle
while true; do
	#recuperer le nbre du joueur
	read -p "Entre ton nombre : " nbre_utilisateur
	#incrementation d'essaie
	((essaie++))
	#comparaison du nbre saisie par le joueur et le vrai nombre
	if [[ "$nbre_utilisateur" -eq "$nbre_a_deviner" ]]; then
		#si le joueur a trouver on l'affiche et on sort du boucle(fin du jeu)
		echo -e "\nBravo!!!\nTu as trouve le nombre en $essaie essais."
		break
	#sinon si le nbre est plus grand on affiche
	elif [[ "$nbre_utilisateur" -lt "$nbre_a_deviner" ]]; then
		echo -e "\n C'est plus grand.\n"
	#sinon le nbre est plus petit on affiche
	else 
		echo -e "\n C'est plus petit.\n"
	fi
	#Apres 5 et 10 essaie on demande a l'utilisateur s'il veut continue le jeu ou pas
	if (( "$essaie" == "5" || "$essaie" == "10" )); then
		echo -e " 1_Continuer le jeu \n 2_Arreter le jeu\n"
		read -p " Votre reponse est : " reponse
		if [[ "$reponse" == "2" ]]; then
			echo -e "Aurevoir !!! \n Bonne chance, a la prochaine."
			break
		fi
	fi
done
