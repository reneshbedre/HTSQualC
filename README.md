# HTSeqQC
HTSeqQC is an automated quality control analysis tool for a single and 
paired-end high-throughput sequencing data (HTS) generated from Illumina
sequencing platforms.

## Features
- Simultaneously filter and/or trim reads for adapter or primer 
  contamination, uncalled bases (N), and low-quality reads
- Supports single and paired-end reads
- Analyze multiple samples simultaneously
- Parallel computation for accelerating the speed of analysis
- Visualization and statistics
- Docker image is available
- Available on CyVerse Discovery Environment (DE)
- No dependency on an external open-source tool

## Getting Started

### Prerequisites
You need Python 3 (tested on 3.6 and 3.7) to install and run HTSeqQC. Following Python 3 
packages need to install before running the HTSeqQC. If you have not .
installed these packages, HTSeqQC will guide you to install them.

```
numpy
pysam
matplotlib
termcolor
datetime
```

### Installing

Clone or download HTSeqQC using following command,

```
git clone https://github.com/reneshbedre/HTSeqQC.git
```

To install HTSeqQC, run following command in the root folder,

```
python setup.py install
```

Install using conda,

```
conda install -c bioconda htseqqc
```

### How to use

Print help message to see all required and optional parameters,

```
filter.py -h
```
```
usage: filter.py [-h] [-a INPUT_FILES_1] [-b INPUT_FILES_2] [-c QUAL_FMT]
                 [-e N_CONT] [-f ADPT_SEQS] [-d MIN_SIZE] [-g ADPT_MATCH]
                 [-i QUAL_THRESH] [-n TRIM_OPT] [-p WIND_SIZE]
                 [-r MIN_LEN_FILT] [-q CPU] [-m OUT_FMT] [-v VIS_OPT]
                 [--version]

Quality control analysis of single and paired-end sequence data


optional arguments:
  -h, --help            show this help message and exit
  -a INPUT_FILES_1, --p1 INPUT_FILES_1
                        Single end input files or left files for paired-end
                        data (.fastq, .fq). Multiple sample files must be
                        separated by comma or space
  -b INPUT_FILES_2, --p2 INPUT_FILES_2
                        Right files for paired-end data (.fastq, .fq).
                        Multiple files must be separated by comma or space
  -c QUAL_FMT, --qfmt QUAL_FMT
                        Quality value format [1= Illumina 1.8, 2= Illumina
                        1.3,3= Sanger]. If quality format not provided, it
                        will automatically detect based on sequence data
  -e N_CONT, --nb N_CONT
                        Filter the reads containing given % of uncalled bases
                        (N)
  -f ADPT_SEQS, --adp ADPT_SEQS
                        Trim the adapter and truncate the read sequence
                        (multiple adapter sequences must be separated by
                        comma)
  -d MIN_SIZE, --msz MIN_SIZE
                        Filter the reads which are lesser than minimum size
  -g ADPT_MATCH, --per ADPT_MATCH
                        Truncate the read sequence if it matches to adapter
                        sequence equal or more than given percent (0.0-1.0)
                        [default=0.9]
  -i QUAL_THRESH, --qthr QUAL_THRESH
                        Filter the read sequence if average quality of bases
                        in reads is lower than threshold (1-40) [default:20]
  -n TRIM_OPT, --trim TRIM_OPT
                        If trim option set to True, the reads with low quality
                        (as defined by option --qthr) will be trimmed instead
                        of discarding [True|False] [default: False]
  -p WIND_SIZE, --wsz WIND_SIZE
                        The window size for trimming (5->3) the reads. This
                        option should always set when -trim option is defined
                        [default: 5]
  -r MIN_LEN_FILT, --mlk MIN_LEN_FILT
                        Minimum length of the reads to retain after trimming
  -q CPU, --cpu CPU     Number of CPU [default:2]
  -m OUT_FMT, --ofmt OUT_FMT
                        Output file format (fastq/fasta) [default:fastq]
  -v VIS_OPT, --no-vis VIS_OPT
                        No figures will be produced [True|False]
                        [default:False]
  --version             show program's version number and exit
```


Run For single-end reads

```
# for single sample
filter.py OPTIONS -a fastq_file

# for multiple samples
filter.py OPTIONS -a fastq_file_1,fastq_file_2
```

Filter paired-end reads
```
# for single sample
filter.py OPTIONS -a fastq_file_left -b fastq_file_right
# for multiple samples
filter.py OPTIONS -a fastq_file_left_1,fastq_file_left_2 -b fastq_file_right_1,fastq_file_right_2
```

### Output
HTSeqQC produces the filtered cleaned HTS data as FASTQ/FASTA files, 
and statistics and visualization of filtered cleaned HTS datasets. The
output will be saved in folder with name ending as filtering_out.

### License

This project is available under the MIT License. See complete details in [LICENSE](LICENSE) file.

### HTSeqQC Analysis commands used for test datasets

**Download the test paired and single end data using NCBI SRA toolkit**
```
fastq-dump --split-files SRR2165176
fastq-dump --split-files SRR2165177
fastq-dump --split-files SRR2165178
fastq-dump  SRR1805340
```

*Run HTSeqQC as a command line tool (Linux and Mac)*
- for paired end data with default parameter (setting 1)

`filter.py --cpu 18 --p1 SRR2165176_1.fastq --p2 SRR2165176_2.fastq`

- for paired end data with quality threshold, adapter sequences, and 
  uncalled based parameters (setting 2)
  
`filter.py --cpu 18 --qthr 25 --nb 5 --adp AGATCGGAAGAGCACACGTCTGAACTCCAGTCA,AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT --p1 SRR2165176_1.fastq --p2 SRR2165176_2.fastq` 

- for paired end data with default parameter and multiple samples (setting 3)

`filter.py --cpu 18 --p1 SRR2165176_1.fastq,SRR2165177_1.fastq,SRR2165178_1.fastq --p2 SRR2165176_2.fastq,SRR2165177_2.fastq,SRR2165178_2.fastq`

- for single end data with default parameter (setting 4)

`filter.py --cpu 18 --p1 SRR1805340.fastq`
