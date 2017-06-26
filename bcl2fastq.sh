#PBS -l walltime=100:00:00
#PBS -l mem=120gb
#PBS -l nodes=1:ppn=28
#PBS -M megan.bowman@vai.org
#PBS -m abe
#PBS -N bcl2fastq

cd $PBS_O_WORKDIR

/secondary/projects/bbc/tools/bcl2fastq/default/bin/bcl2fastq &> bcl2fastq.log

cd ./Data/Intensities/BaseCalls

/primary/vari/software/zacks_usc_devel/mergeNextSeqLanes/mergeNextseqLanes.pl

/secondary/projects/bbc/tools/fastqc/fastqc-0.11.5/fastqc -t 28 *_L000_*

mkdir FastQC

mv *.zip FastQC
mv *.html FastQC

multiqc FastQC

