# RseqFilt
RseqFilt is an automated sequence filtering analysis tool for a single and paired-end high throughput RNA-seq data generated from Illumina sequencing platforms.

## Features
- Simultaneously filter and/or trim reads for adapter or primer contamination, uncalled bases (N), GC content, and low-quality reads
- Supports single and paired-end reads
- Analyze multiple samples simultaneously
- Parallel computation for accelerating the speed of analysis
- Visualization and statistics
- Docker image is available
- No dependency on an external open-source tool

## Getting Started

### Prerequisites
You need Python3 to install and run RSeqFilt. Following Python3 packages need to install before running the tool. If you have not installed these packages, RseqFilt will guide you to install them.

```
numpy
pysam
matplotlib
termcolor
datetime
```

### Installing

Clone or download RseqFilt using following command,

```
git clone https://github.com/reneshbedre/RseqFilt.git
```

To install RseqFilt, run following command in the root folder,

```
python3 setup.py install
```

### How to use

Print help message to see all required and optional parameters,

```
filter.py -h
```

Filter single-end reads

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

### License

This project is available under the MIT License. See complete details in [LICENSE](LICENSE) file.
