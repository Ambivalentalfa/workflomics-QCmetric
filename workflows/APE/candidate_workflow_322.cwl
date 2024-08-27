# WorkflowNo_321
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_321
doc: A workflow including the tool(s) InfernoRDN, CrosstalkDB, EncyclopeDIA, IsobariQ, ComplexBrowser.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_3:
    type: File
    format: "http://edamontology.org/format_3620" # xlsx
steps:
  InfernoRDN_01:
    run: add-path-to-the-implementation/InfernoRDN.cwl 
    in:
      InfernoRDN_in_1: input_3
    out: [InfernoRDN_out_1, InfernoRDN_out_2]
  CrosstalkDB_02:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: InfernoRDN_01/InfernoRDN_out_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  EncyclopeDIA_03:
    run: add-path-to-the-implementation/EncyclopeDIA.cwl 
    in:
      EncyclopeDIA_in_1: input_1
      EncyclopeDIA_in_2: input_2
    out: [EncyclopeDIA_out_1]
  IsobariQ_04:
    run: add-path-to-the-implementation/IsobariQ.cwl 
    in:
      IsobariQ_in_1: EncyclopeDIA_03/EncyclopeDIA_out_1
    out: [IsobariQ_out_1]
  ComplexBrowser_05:
    run: add-path-to-the-implementation/ComplexBrowser.cwl 
    in:
      ComplexBrowser_in_1: IsobariQ_04/IsobariQ_out_1
      ComplexBrowser_in_2: CrosstalkDB_02/CrosstalkDB_out_4
    out: [ComplexBrowser_out_1, ComplexBrowser_out_2, ComplexBrowser_out_3]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3508" # PDF
    outputSource: ComplexBrowser_05/ComplexBrowser_out_1