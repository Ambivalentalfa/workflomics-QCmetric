# WorkflowNo_665
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_665
doc: A workflow including the tool(s) CCdigest, MS-Fit, OpenMS, MassChroQ, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1996" # pair
  input_2:
    type: File
    format: "http://edamontology.org/format_1957" # raw
  input_3:
    type: File
    format: "http://edamontology.org/format_2549" # OBO
steps:
  CCdigest_01:
    run: add-path-to-the-implementation/CCdigest.cwl 
    in:
      CCdigest_in_1: input_2
    out: [CCdigest_out_1]
  MS-Fit_02:
    run: add-path-to-the-implementation/MS-Fit.cwl 
    in:
      MS-Fit_in_1: input_3
    out: [MS-Fit_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: CCdigest_01/CCdigest_out_1
      OpenMS_in_3: MS-Fit_02/MS-Fit_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  MassChroQ_04:
    run: add-path-to-the-implementation/MassChroQ.cwl 
    in:
      MassChroQ_in_1: OpenMS_03/OpenMS_out_1
    out: [MassChroQ_out_1]
  OpenSWATH_05:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: MassChroQ_04/MassChroQ_out_1
    out: [OpenSWATH_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
    outputSource: OpenSWATH_05/OpenSWATH_out_1