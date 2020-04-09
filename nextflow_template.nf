// input data directory path
DATAP = "/scratch/user/ren_net/software/HTSeqQC/test"
// input file extension
FileExtension="fastq"
// Check paired end files (for single end files remove 2)
// first should check the file name structure before using
allReads="${DATAP}/*_{1,2}.${FileExtension}"


log.info """\
         HTSeqQC Quality Filtering
         =============================
         reads : ${DATAP}
         """
         .stripIndent()


// for paired end reads
Channel
    .fromFilePairs(allReads)
    .ifEmpty { error "Cannot find any reads matching: ${DATAP}" }
    .set { read_pairs }


// filter data
process filterData {
    tag "$pair_id"

    input:
    set pair_id, file(reads) from read_pairs

    script:
    """
    # you can change HTSeqQC parameter here
    filter.py --cpu 18 --p1 ${reads[0]} --p2 ${reads[1]}

    """
}

