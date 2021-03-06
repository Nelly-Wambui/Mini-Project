#Assign data directory to a variable
path1=~/ncbi/mapped-sequences/unmapped-reads/unmapped-fastq/kaiju
#Loops through each file
for file in $(cat ../Raw-Data/SraAccList.txt)
do
mkdir $path1/virus-dna/$file-contigs/blast-results
touch $path1/virus-dna/blast-results/$file-blast-results.txt
for id in $(cat $path1/$file/identifiers.txt)
do
#Performs a blastn search of each sequence and saves results to an output file
blastn -db BGdb -query $path1/virus-dna/$file-contigs/$id.fasta -out $path1/virus-dna/$file-contigs/blast-results/$id.out -max_target_seqs 1 
echo $id >> $path1/virus-dna/blast-results/$file-blast-result.txt
grep '>' $path1/virus-dna/$file-contigs/blast-results/$id.out >> $file-blast-result.txt
done
echo $file' complete'
done 
