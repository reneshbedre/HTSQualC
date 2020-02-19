// input data directory path
DATAP = "/scratch/user/ren_net/software/RseqFilt/test"
// input file extension
FileExtension="fastq"
// for paired end files
allReads="${DATAP}/*_{1,2}.${FileExtension}"
// for single end files
//allReads="${DATAP}/*_{1}.${FileExtension}"

log.info """\
         RseqFilt Quality Filtering
         =============================
         reads : ${DATAP}
         """
         .stripIndent()

// for paired end reads
Channel
    .fromFilePairs(allReads)
    .ifEmpty { error "Cannot find any reads matching: ${DATAP}" }
    .set { reads }


// filter data
process filterData {
    tag "$pair_id"

    input:
    set pair_id, file(reccads) from read_pairs

    script:
    """
    # you can change HTSeqQC parameter here
    filter.py --cpu 18 --p1 ${reads[0]} --p2 ${reads[1]}
    """
}
