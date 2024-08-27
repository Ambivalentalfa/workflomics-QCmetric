# WorkflowNo_446
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_446
doc: A workflow including the tool(s) PIA - Protein Inference Algorithms, OpenSWATH, OpenSWATH, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_2352" # BioXSD (XML)
  input_2:
    type: File
    format: "http://edamontology.org/format_3702" # MSF
  input_3:
    type: File
    format: "http://edamontology.org/format_3246" # TraML
steps:
  PIA - Protein Inference Algorithms_01:
    run: add-path-to-the-implementation/PIA - Protein Inference Algorithms.cwl 
    in:
      PIA - Protein Inference Algorithms_in_1: input_2
    out: [PIA - Protein Inference Algorithms_out_1, PIA - Protein Inference Algorithms_out_2]
  OpenSWATH_02:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: input_2
    out: [OpenSWATH_out_1]
  OpenSWATH_03:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: OpenSWATH_02/OpenSWATH_out_1
      OpenSWATH_in_2: input_3
    out: [OpenSWATH_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: OpenSWATH_03/OpenSWATH_out_1
      OpenMS_in_2: input_1
      OpenMS_in_3: PIA - Protein Inference Algorithms_01/PIA - Protein Inference Algorithms_out_1
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