# WorkflowNo_141
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_141
doc: A workflow including the tool(s) OBI-Warp, mzStar, EncyclopeDIA, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_3:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
steps:
  OBI-Warp_01:
    run: add-path-to-the-implementation/OBI-Warp.cwl 
    in:
      OBI-Warp_in_1: input_3
    out: [OBI-Warp_out_1]
  mzStar_02:
    run: add-path-to-the-implementation/mzStar.cwl 
    in:
      mzStar_in_1: OBI-Warp_01/OBI-Warp_out_1
    out: [mzStar_out_1]
  EncyclopeDIA_03:
    run: add-path-to-the-implementation/EncyclopeDIA.cwl 
    in:
      EncyclopeDIA_in_1: input_3
      EncyclopeDIA_in_2: input_2
    out: [EncyclopeDIA_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_1
      OpenMS_in_2: mzStar_02/mzStar_out_1
      OpenMS_in_3: EncyclopeDIA_03/EncyclopeDIA_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  OpenSWATH_05:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: OpenMS_04/OpenMS_out_2
    out: [OpenSWATH_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
    outputSource: OpenSWATH_05/OpenSWATH_out_1