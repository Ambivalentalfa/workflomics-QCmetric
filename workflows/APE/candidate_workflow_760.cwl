# WorkflowNo_757
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_757
doc: A workflow including the tool(s) ComPIL, PEAKS Q, MSiReader, msConvert, SIM-XL.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_3:
    type: File
    format: "http://edamontology.org/format_1200" # smarts
steps:
  ComPIL_01:
    run: add-path-to-the-implementation/ComPIL.cwl 
    in:
      ComPIL_in_1: input_3
    out: [ComPIL_out_1]
  PEAKS Q_02:
    run: add-path-to-the-implementation/PEAKS Q.cwl 
    in:
      PEAKS Q_in_1: ComPIL_01/ComPIL_out_1
    out: [PEAKS Q_out_1]
  MSiReader_03:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_3
      MSiReader_in_2: PEAKS Q_02/PEAKS Q_out_1
    out: [MSiReader_out_1, MSiReader_out_2]
  msConvert_04:
    run: add-path-to-the-implementation/msConvert.cwl 
    in:
      msConvert_in_1: MSiReader_03/MSiReader_out_2
    out: [msConvert_out_1]
  SIM-XL_05:
    run: add-path-to-the-implementation/SIM-XL.cwl 
    in:
      SIM-XL_in_1: input_2
      SIM-XL_in_2: msConvert_04/msConvert_out_1
      SIM-XL_in_3: input_1
    out: [SIM-XL_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3247" # mzIdentML
    outputSource: SIM-XL_05/SIM-XL_out_1