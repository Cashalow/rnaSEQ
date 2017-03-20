for i in $(ls *_fastqc)
do
  cd $i;
  sed -n '/Overrepresented/,$p' fastqc_data.txt | sed '/>>END_MODULE/q' | tail -n +2 | head -n -1 > overrepresented_sequences.txt
  tail -n +2 overrepresented_sequences.txt | cut -f 1 | sed -e 's/^/>Seq\n/' > overrepresented_sequences.fasta
  tail -n +2 overrepresented_sequences.txt | cut -f 3 | awk '{s+=$1} END {print s}' > total_percent_overrepresented.txt
  cd ..;
  done
