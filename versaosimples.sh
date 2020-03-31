#! /bin/bash
IFS=$"/"

echo -e "Write your query in this exact format: DATABASE/SEARCH TERMS/QUERYKEY/WEBENV-STRING"

read dbquery searchterm key webenv

echo -e "\n"

esearch -db $dbquery -query "$searchterm" | efetch -format fasta

python -mwebbrowser "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=$dbquery&query_key=$key&WebEnv=$webenv&usehistory=y&rettype=fasta"


