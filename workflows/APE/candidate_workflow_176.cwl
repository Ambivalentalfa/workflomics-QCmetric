# WorkflowNo_175
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_175
doc: A workflow including the tool(s) Jtraml, PChopper, EncyclopeDIA, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1628" # ABI
  input_2:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_3:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
steps:
  Jtraml_01:
    run: add-path-to-the-implementation/Jtraml.cwl 
    in:
      Jtraml_in_1: input_1
    out: [Jtraml_out_1]
  PChopper_02:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: Jtraml_01/Jtraml_out_1
    out: [PChopper_out_1]
  EncyclopeDIA_03:
    run: add-path-to-the-implementation/EncyclopeDIA.cwl 
    in:
      EncyclopeDIA_in_1: input_3
      EncyclopeDIA_in_2: Jtraml_01/Jtraml_out_1
    out: [EncyclopeDIA_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_2
      OpenMS_in_2: PChopper_02/PChopper_out_1
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
