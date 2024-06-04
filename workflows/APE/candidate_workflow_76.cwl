# WorkflowNo_75
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_75
doc: A workflow including the tool(s) CrosstalkDB, CrosstalkDB, ComPIL, IsobariQ, LimmaRP.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_2:
    type: File
    format: "http://edamontology.org/format_3913" # Loom
  input_3:
    type: File
    format: "http://edamontology.org/format_3859" # JCAMP-DX
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  CrosstalkDB_02:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: CrosstalkDB_01/CrosstalkDB_out_3
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  ComPIL_03:
    run: add-path-to-the-implementation/ComPIL.cwl 
    in:
      ComPIL_in_1: input_3
    out: [ComPIL_out_1]
  IsobariQ_04:
    run: add-path-to-the-implementation/IsobariQ.cwl 
    in:
      IsobariQ_in_1: ComPIL_03/ComPIL_out_1
    out: [IsobariQ_out_1]
  LimmaRP_05:
    run: add-path-to-the-implementation/LimmaRP.cwl 
    in:
      LimmaRP_in_1: CrosstalkDB_02/CrosstalkDB_out_3
      LimmaRP_in_2: IsobariQ_04/IsobariQ_out_1
    out: [LimmaRP_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3508" # PDF
    outputSource: LimmaRP_05/LimmaRP_out_1
