#Gen UCC Metrics

UCC -dir ./ -outdir ./Metrics -nodup -nouncounted -unified

#Parse metric files into just the values we need (total comments, embedded comments, physical SLOCs, logical SLOCs, and file path)
#Start after line 11 and print columns 3,4,9,8,11 (See above)
awk -F, 'NR>11{print $3,$4,$9,$8,$11}' OFS=',' ./Metrics/TOTAL_outfile.csv >./Metrics/TEMP_TOTAL_outfile.csv
#Deletes all lines after the data stops
awk -F, '{if($1!=""){print}else{exit}}' OFS=',' ./Metrics/TEMP_TOTAL_outfile.csv >./Metrics/NEW_TOTAL_outfile.csv

#Parse metric files into just the values we need for maintainability index (3-metric, 4-metric, file path)

#Start after line 11 and print columns 1,2,3
awk -F, 'NR>11{print $1,$2,$3}' OFS=',' ./Metrics/outfile_maintainability_index.csv >./Metrics/TEMP_outfile_maintainability_index.csv
#Deletes all lines after the data stops
awk -F, '{if($1!=""){print}else{exit}}' OFS=',' ./Metrics/TEMP_outfile_maintainability_index.csv >./Metrics/NEW_outfile_maintainability_index.csv

#Convert into xml

#Read each line from the parsed CSV
while IFS=, read -r wholeCom embCom phySLOC logSLOC path
do
	echo -e "<row>" >> ./Metrics/UCC.xml
	echo -e "\t<wholeCom>$wholeCom</wholeCom>" >> ./Metrics/UCC.xml
	echo -e "\t<embCom>$embCom</embCom>" >> ./Metrics/UCC.xml
	echo -e "\t<phySLOC>$phySLOC</phySLOC>" >> ./Metrics/UCC.xml
	echo -e "\t<logSLOC>$logSLOC</logSLOC>" >> ./Metrics/UCC.xml
	echo -e "\t<path>$path</path>" >> ./Metrics/UCC.xml
	echo -e "</row>" >> ./Metrics/UCC.xml
done < ./Metrics/NEW_TOTAL_outfile.csv

#Read each line from the parsed CSV
while IFS=, read -r main3 main4 path
do
	echo -e "<row>" >> ./Metrics/UCC_main.xml
	echo -e "\t<main3>$main3</main3>" >> ./Metrics/UCC_main.xml
	echo -e "\t<main4>$main4</main4>" >> ./Metrics/UCC_main.xml
	echo -e "\t<path>$path</path>" >> ./Metrics/UCC_main.xml
	echo -e "</row>" >> ./Metrics/UCC_main.xml
done < ./Metrics/NEW_outfile_maintainability_index.csv
