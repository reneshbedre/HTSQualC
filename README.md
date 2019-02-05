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

To install RseqFilt run following command in the root folder,

```
python3 setup.py install
```
