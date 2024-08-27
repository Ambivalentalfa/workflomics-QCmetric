# WorkflowNo_362
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_362
doc: A workflow including the tool(s) CrosstalkDB, CrosstalkDB, PRIDE Toolsuite, Percolator, Quant.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3578" # IDAT
  input_2:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_3:
    type: File
    format: "http://edamontology.org/format_3652" # dta
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_2
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  CrosstalkDB_02:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: CrosstalkDB_01/CrosstalkDB_out_3
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  PRIDE Toolsuite_03:
    run: add-path-to-the-implementation/PRIDE Toolsuite.cwl 
    in:
      PRIDE Toolsuite_in_1: CrosstalkDB_02/CrosstalkDB_out_4
    out: [PRIDE Toolsuite_out_1]
  Percolator_04:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: PRIDE Toolsuite_03/PRIDE Toolsuite_out_1
    out: [Percolator_out_1]
  Quant_05:
    run: add-path-to-the-implementation/Quant.cwl 
    in:
      Quant_in_1: input_3
      Quant_in_2: Percolator_04/Percolator_out_1
    out: [Quant_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3468" # xls
    outputSource: Quant_05/Quant_out_1