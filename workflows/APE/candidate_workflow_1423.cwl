# WorkflowNo_1422
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1422
doc: A workflow including the tool(s) CrosstalkDB, esimsa2D, MSiReader, ComPIL, PEAKS Q.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_2:
    type: File
    format: "http://edamontology.org/format_3822" # GML
  input_3:
    type: File
    format: "http://edamontology.org/format_3609" # qualillumina
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  esimsa2D_02:
    run: add-path-to-the-implementation/esimsa2D.cwl 
    in:
      esimsa2D_in_1: input_3
      esimsa2D_in_2: input_2
      esimsa2D_in_3: input_2
    out: [esimsa2D_out_1, esimsa2D_out_2, esimsa2D_out_3]
  MSiReader_03:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: esimsa2D_02/esimsa2D_out_2
      MSiReader_in_2: CrosstalkDB_01/CrosstalkDB_out_2
    out: [MSiReader_out_1, MSiReader_out_2]
  ComPIL_04:
    run: add-path-to-the-implementation/ComPIL.cwl 
    in:
      ComPIL_in_1: MSiReader_03/MSiReader_out_2
    out: [ComPIL_out_1]
  PEAKS Q_05:
    run: add-path-to-the-implementation/PEAKS Q.cwl 
    in:
      PEAKS Q_in_1: ComPIL_04/ComPIL_out_1
    out: [PEAKS Q_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_2311" # EMBL-HTML
    outputSource: PEAKS Q_05/PEAKS Q_out_1
