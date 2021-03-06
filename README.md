# POWER8-GEM
This workflow contains bash scripts that perform the following tasks on an IBM POWER8 architecture:

* Download RNA sequencing data in FASTQ format from the [EMBL-EBI](http://www.ebi.ac.uk/)
* Trim raw fastq files of poor quality reads and Illumina adapter sequences using [Trimmomatic](http://www.usadellab.org/cms/?page=trimmomatic)
* Map cleaned reads to a reference genome using  [Hisat2](https://ccb.jhu.edu/software/hisat2/manual.shtml)
* Quantify RNA transcript abundances using [StringTie](https://ccb.jhu.edu/software/stringtie/index.shtml?t=manual)
* Parse FPKM values from StringTie output into a Gene Expression Matrix (GEM)

This workflow utilizes Genome annotation files in GFF3 format to quantify transcript abudances as described in the following Nature Protocol:

Pertea, M., et al. (2016). "Transcript-level expression analysis of RNA-seq experiments with HISAT, StringTie and Ballgown." Nat. Protocols 11(9): 1650-1667.

Note that PBS-GEM does not perform transcript assembly, and will only quantify abundances of annotated reference transcripts.  

## Pre-Workflow User Input

### Install Software and Create Conda Environment

To install software needed for the POWER8-GEM workflow, run:

	$ chmod +x 00-Install-tools.sh
	$ sudo ./00-Install-tools.sh

When prompted for an installation location for Miniconda, enter:

	 /home/<user>/bin/miniconda2

The rest of the installation should proceed normally.

After all of the software has finished installing, the POWER8-GEM should be ready to run.

### Download and Index Reference Genome


The reference genome must be indexed using Hisat2.  Download a reference genome in FASTA (.fa) format, and place this file in the _Reference_ directory of the workflow.  To index this reference genome, execute the _Index-Genome.sh_ script and provide a reference prefix as an argument:

        $ ./Index-Genome.sh $REF_PREFIX
        
For example:

        $ ./Index-Genome.sh chr21-GRCh38

Please note that only one .fa genome file can be present in the _Reference_ directory.  Please remove the example file, "chr21-GRCh38.fa", before using your own data.  

### Download GFF3 Genome Annotation

A GFF3 file that corresponds to the reference genome must be placed in the _Reference_ directory.  Please check that only one GFF3 file is present.  


### Identify SRA sample ID's and modify SRAList.txt file

SRA sample ID's must be specified in the "SRAList.txt" file.  Please modify this file to specify the samples that you want to process.  Each SRA ID must be present on a new line.  

## Execute the Workflow

The workflow contains a small reference genome for testing.  To run the workflow, simply run the commands

./power8-gem.sh <ReferenceGenome>(ex. ./power8-gem.sh chr21-GRCh38)


If needed, you can execute each step of the pipeline as follows:  

### Download Input Data

    $ ./01-Prepare-inputs.sh  
  
### Trim Reads

    $ ./02-Trim-reads.sh

### Map Reads to Reference Genome 

    $ ./03-Map-reads.sh chr21-GRCh38
    
When using your own data, please replace "chr21-GRCh38" with the appropriate reference prefix (same as the $REF_PREFIX that you chose when indexing the reference genome).  

### Quantify Transcript Abundances

    $ ./04-Count-transcripts.sh

### Build Gene Expression Matrix (GEM)

    $ ./05-GEM-parse.sh
    
#### Comments/Notes

With full datasets, each step of this workflow can take several hours.  Please be sure that all PBS jobs have finished before moving onto the next step.  A "Logs" directory will be created upon initiation of the workflow.  Please inspect all log files for errors. 

NOTE: This is an adaptation of the PBS-GEM, which is based off the OSG-GEM. William Poehlman and Dr. Alex Feltus deserve credit for the development of those workflows.  

