# WorkflowNo_1216
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1216
doc: A workflow including the tool(s) CrosstalkDB, PEAKS DB, OpenMS, OpenSWATH, MSiReader.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_2:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_3:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  PEAKS DB_02:
    run: add-path-to-the-implementation/PEAKS DB.cwl 
    in:
      PEAKS DB_in_1: input_2
      PEAKS DB_in_2: input_3
    out: [PEAKS DB_out_1, PEAKS DB_out_2]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_2
      OpenMS_in_2: input_3
      OpenMS_in_3: PEAKS DB_02/PEAKS DB_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  OpenSWATH_04:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: OpenMS_03/OpenMS_out_2
    out: [OpenSWATH_out_1]
  MSiReader_05:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: OpenSWATH_04/OpenSWATH_out_1
      MSiReader_in_2: CrosstalkDB_01/CrosstalkDB_out_3
    out: [MSiReader_out_1, MSiReader_out_2]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3591" # TIFF
    outputSource: MSiReader_05/MSiReader_out_1
