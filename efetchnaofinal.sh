#! /bin/bash

            echo -e "\n"
            read -n 1 -s -r -p" The following script requires the download of the package ncbi-entrez-direct and root access... Press [ENTER] to continue. $CONTINUEKEY"
            sudo apt install ncbi-entrez-direct


            echo -e "\n"
            read -n 1 -s -r -p "This script will retrieve sequences using the NBCI Entrez API. Please write at prompt, followed by [ENTER]. $CONTINUEKEY"

			echo -e "\n Please write the query database."
			read dbquery
			echo  -e "\n Database is $dbquery"

			echo -e "Please write your search terms. Do not use commas, use instead 'AND' (example: Psammodromus algirus[organism] AND cytb[gene] )"
            read searchterm
            echo  -e "The following sequences were found... [PRESS Q TO SKIP THEM]"

            

            esearch -db $dbquery -query "$searchterm" | efetch -format fasta | more

            echo -e "\n "
            read -n 1 -s -r -p "do you want to save the FASTA files?  [PRESS ENTER TO CONTINUE].$CONTINUEKEY"
           
   esearch -db $dbquery -query "$searchterm" | efetch -format fasta > ~/Downloads/ad5stra.fasta

            echo -e "\n"
            read -n 1 -s -r -p " File downloaded into (~/Downloads/ad5stra.fasta) Thank you for using this script. Created by Catarina Rodrigues & Miguel Cisneiros [PRESS ANY KEY TO CLOSE]."





