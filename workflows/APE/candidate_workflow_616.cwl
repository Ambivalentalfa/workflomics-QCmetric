# WorkflowNo_615
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_615
doc: A workflow including the tool(s) PepNovo, CCdigest, MS-Fit, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_2:
    type: File
    format: "http://edamontology.org/format_3653" # pkl
  input_3:
    type: File
    format: "http://edamontology.org/format_1641" # affymetrix-exp
steps:
  PepNovo_01:
    run: add-path-to-the-implementation/PepNovo.cwl 
    in:
      PepNovo_in_1: input_2
    out: [PepNovo_out_1]
  CCdigest_02:
    run: add-path-to-the-implementation/CCdigest.cwl 
    in:
      CCdigest_in_1: PepNovo_01/PepNovo_out_1
    out: [CCdigest_out_1]
  MS-Fit_03:
    run: add-path-to-the-implementation/MS-Fit.cwl 
    in:
      MS-Fit_in_1: input_3
    out: [MS-Fit_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_1
      OpenMS_in_2: CCdigest_02/CCdigest_out_1
      OpenMS_in_3: MS-Fit_03/MS-Fit_out_1
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
