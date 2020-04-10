#! /bin/bash

#must allow file to be executed as program
#user passes DATABASE and SEARCHTERM, respectively $1 and $2
#esearch is done, we can grep the QueryKey and WebEnv quietly
#efetch is done, as we now have the key and webenv quietly
# -O -    prints to stdout

#Catarina Rodrigues 2409
#Miguel Cisneiros 2674


QueryKey=$(wget -q https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi/\?db\=$1\&term\="$2"\&usehistory\=y -O - | grep -o -P '(?<=<QueryKey>).*(?=</QueryKey>)') 

WebEnv=$(wget -q https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi/\?db\=$1\&term\="$2"\&usehistory\=y -O -| grep -o -P '(?<=<WebEnv>).*(?=</WebEnv>)')


wget -q "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=$1&query_key=$QueryKey&WebEnv=$WebEnv&rettype=fasta" -O - | more




