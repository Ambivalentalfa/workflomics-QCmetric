# WorkflowNo_4
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_4
doc: A workflow including the tool(s) esimsa, nontarget, esimsa2D, OpenSWATH, Mascot Server.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
  input_2:
    type: File
    format: "http://edamontology.org/format_1972" # NCBI format
  input_3:
    type: File
    format: "http://edamontology.org/format_1432" # Phylip character frequencies format
steps:
  esimsa_01:
    run: add-path-to-the-implementation/esimsa.cwl 
    in:
      esimsa_in_1: input_2
      esimsa_in_2: input_3
      esimsa_in_3: input_3
    out: [esimsa_out_1, esimsa_out_2, esimsa_out_3]
  nontarget_02:
    run: add-path-to-the-implementation/nontarget.cwl 
    in:
      nontarget_in_1: esimsa_01/esimsa_out_1
      nontarget_in_2: esimsa_01/esimsa_out_1
      nontarget_in_3: input_3
    out: [nontarget_out_1, nontarget_out_2, nontarget_out_3]
  esimsa2D_03:
    run: add-path-to-the-implementation/esimsa2D.cwl 
    in:
      esimsa2D_in_1: input_2
      esimsa2D_in_2: nontarget_02/nontarget_out_3
      esimsa2D_in_3: input_3
    out: [esimsa2D_out_1, esimsa2D_out_2, esimsa2D_out_3]
  OpenSWATH_04:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: input_1
      OpenSWATH_in_2: esimsa2D_03/esimsa2D_out_2
    out: [OpenSWATH_out_1]
  Mascot Server_05:
    run: add-path-to-the-implementation/Mascot Server.cwl 
    in:
      Mascot Server_in_1: OpenSWATH_04/OpenSWATH_out_1
      Mascot Server_in_2: esimsa_01/esimsa_out_2
    out: [Mascot Server_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
    outputSource: Mascot Server_05/Mascot Server_out_1