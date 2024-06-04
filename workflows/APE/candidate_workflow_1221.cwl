# WorkflowNo_1220
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1220
doc: A workflow including the tool(s) CrosstalkDB, OpenSWATH, InDigestion, EncyclopeDIA, Libra.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_2:
    type: File
    format: "http://edamontology.org/format_1335" # Smith-Waterman format
  input_3:
    type: File
    format: "http://edamontology.org/format_3313" # BLC
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  OpenSWATH_02:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: CrosstalkDB_01/CrosstalkDB_out_3
    out: [OpenSWATH_out_1]
  InDigestion_03:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: input_2
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  EncyclopeDIA_04:
    run: add-path-to-the-implementation/EncyclopeDIA.cwl 
    in:
      EncyclopeDIA_in_1: OpenSWATH_02/OpenSWATH_out_1
      EncyclopeDIA_in_2: InDigestion_03/InDigestion_out_3
    out: [EncyclopeDIA_out_1]
  Libra_05:
    run: add-path-to-the-implementation/Libra.cwl 
    in:
      Libra_in_1: EncyclopeDIA_04/EncyclopeDIA_out_1
    out: [Libra_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: Libra_05/Libra_out_1
