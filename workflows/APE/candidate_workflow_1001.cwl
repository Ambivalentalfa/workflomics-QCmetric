# WorkflowNo_1000
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1000
doc: A workflow including the tool(s) RAAMS, MS-Isotope, OpenSWATH, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
  input_2:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
  input_3:
    type: File
    format: "http://edamontology.org/format_3246" # TraML
steps:
  RAAMS_01:
    run: add-path-to-the-implementation/RAAMS.cwl 
    in:
      RAAMS_in_1: input_2
    out: [RAAMS_out_1]
  MS-Isotope_02:
    run: add-path-to-the-implementation/MS-Isotope.cwl 
    in:
      MS-Isotope_in_1: RAAMS_01/RAAMS_out_1
    out: [MS-Isotope_out_1]
  OpenSWATH_03:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: input_1
      OpenSWATH_in_2: input_3
    out: [OpenSWATH_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: OpenSWATH_03/OpenSWATH_out_1
      OpenMS_in_2: MS-Isotope_02/MS-Isotope_out_1
      OpenMS_in_3: input_2
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