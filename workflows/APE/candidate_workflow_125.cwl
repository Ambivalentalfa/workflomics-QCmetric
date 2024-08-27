# WorkflowNo_124
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_124
doc: A workflow including the tool(s) CrosstalkDB, imDEV, Graph Extract, OpenSWATH, Mascot Server.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_2:
    type: File
    format: "http://edamontology.org/format_3162" # MAGE-TAB
  input_3:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  imDEV_02:
    run: add-path-to-the-implementation/imDEV.cwl 
    in:
      imDEV_in_1: CrosstalkDB_01/CrosstalkDB_out_3
    out: [imDEV_out_1, imDEV_out_2]
  Graph Extract_03:
    run: add-path-to-the-implementation/Graph Extract.cwl 
    in:
      Graph Extract_in_1: imDEV_02/imDEV_out_2
    out: [Graph Extract_out_1]
  OpenSWATH_04:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: input_3
      OpenSWATH_in_2: input_2
    out: [OpenSWATH_out_1]
  Mascot Server_05:
    run: add-path-to-the-implementation/Mascot Server.cwl 
    in:
      Mascot Server_in_1: OpenSWATH_04/OpenSWATH_out_1
      Mascot Server_in_2: Graph Extract_03/Graph Extract_out_1
    out: [Mascot Server_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3681" # mzTab
    outputSource: Mascot Server_05/Mascot Server_out_1