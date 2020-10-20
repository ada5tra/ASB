#! /bin/bash

		#introduction to the program and requirements for a successful operation

            echo -e "\n"
            read -n 1 -s -r -p"The following script requires internet connection and the following packages: python3.6 , ncbi-entrez-direct for it to work. Please install it before using. This script will search and retrieve sequences using the NBCI Entrez API. Please write at prompt, followed by [ENTER] $CONTINUEKEY"
	    echo -e "\n"

		#beggining of the selection of the database to be used

	    while true; do
		    read -p "DATABASE: [If you do not know which databases are available, please WRITE info]	" dbquery
		    case $dbquery in
			"info") echo -e "\nThese are the available databases:\n";einfo -dbs; echo -e "\n";;
			"") ;;
			* ) echo -e "\n";echo  -e "\n The selected database is $dbquery"; break;;
		    esac
	    done
		#end of the selection; beggining of user input of search terms
	    echo -e "\n"
            read -p "SEARCH TERM: Do not use commas, use instead 'AND' (example: Psammodromus algirus[organism] AND cytb[gene]):	" searchterm
            echo -e "\n The chosen search terms are $searchterm.\n"

		#presents the webenv e querykey codes from the search in the STDOUT with the XML format

            esearch -db $dbquery -query "$searchterm"
	    echo -e "\n For future usage of this search, please save this output."

		#the user manually inserts the arguments

	    echo -e "\n To retrieve the results of your search, please insert the requested codes, which match with the above."
            read -p "QUERY KEY: (example: 1)" key
            read -p "WEB ENVIRONMENT STRING: (example: NCID_1_469239...)" webenv
           
		#end of search mode; beggining of fetch mode

            echo -e "\n The following sequences were found... [PRESS Q TO SKIP THEM]\t"
            echo -e "\n"
            esearch -db $dbquery -query "$searchterm" | efetch -format fasta | more
            echo -e "\n "

		#end of fetch mode; beginning of download mode (optional for the user)

            while true; do
		    read -p "Do you want to save the results in a FASTA file (this will open your browser)? [y/n]	" yn
		    case $yn in
			[Yy]* ) echo -e "\n\nYour file will be downloaded shortly...\n"; python -mwebbrowser "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=$dbquery&query_key=$key&WebEnv=$webenv&usehistory=y&rettype=fasta"; echo -e "\nFile downloaded successfully."; #into (~/Downloads/"$date"_fetched_sequences_of_"$searchterm"_from_db_"$dbquery".fasta).\n"
 break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes [y] or no [n].";;
		    esac
	    done  	
		#end of download mode; credits and closing
            read -n 1 -s -r -p "Thank you for using this script. Created by Catarina Rodrigues & Miguel Cisneiros in March 2020 [PRESS ANY KEY TO CLOSE]."





