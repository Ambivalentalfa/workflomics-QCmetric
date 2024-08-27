# WorkflowNo_136
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_136
doc: A workflow including the tool(s) CrosstalkDB, MSiReader, CPM, MS-Fit, Multi-Q.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
  input_2:
    type: File
    format: "http://edamontology.org/format_3162" # MAGE-TAB
  input_3:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_3
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  MSiReader_02:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_2
      MSiReader_in_2: CrosstalkDB_01/CrosstalkDB_out_2
    out: [MSiReader_out_1, MSiReader_out_2]
  CPM_03:
    run: add-path-to-the-implementation/CPM.cwl 
    in:
      CPM_in_1: MSiReader_02/MSiReader_out_2
      CPM_in_2: input_2
    out: [CPM_out_1, CPM_out_2]
  MS-Fit_04:
    run: add-path-to-the-implementation/MS-Fit.cwl 
    in:
      MS-Fit_in_1: CPM_03/CPM_out_2
    out: [MS-Fit_out_1]
  Multi-Q_05:
    run: add-path-to-the-implementation/Multi-Q.cwl 
    in:
      Multi-Q_in_1: input_1
      Multi-Q_in_2: MS-Fit_04/MS-Fit_out_1
    out: [Multi-Q_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
    outputSource: Multi-Q_05/Multi-Q_out_1