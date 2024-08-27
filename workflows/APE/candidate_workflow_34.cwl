# WorkflowNo_33
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_33
doc: A workflow including the tool(s) CrosstalkDB, MS-Fit, OpenMS, CrosstalkDB, ComplexBrowser.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_2549" # OBO
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_3:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_3
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  MS-Fit_02:
    run: add-path-to-the-implementation/MS-Fit.cwl 
    in:
      MS-Fit_in_1: input_1
    out: [MS-Fit_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_1
      OpenMS_in_2: input_2
      OpenMS_in_3: MS-Fit_02/MS-Fit_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  CrosstalkDB_04:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: CrosstalkDB_01/CrosstalkDB_out_3
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  ComplexBrowser_05:
    run: add-path-to-the-implementation/ComplexBrowser.cwl 
    in:
      ComplexBrowser_in_1: OpenMS_03/OpenMS_out_2
      ComplexBrowser_in_2: CrosstalkDB_04/CrosstalkDB_out_1
    out: [ComplexBrowser_out_1, ComplexBrowser_out_2, ComplexBrowser_out_3]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
    outputSource: ComplexBrowser_05/ComplexBrowser_out_1