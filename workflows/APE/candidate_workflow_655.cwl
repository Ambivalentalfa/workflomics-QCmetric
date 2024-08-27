# WorkflowNo_654
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_654
doc: A workflow including the tool(s) ProSight Lite, PChopper, MS-Fit, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1392" # DIALIGN format
  input_2:
    type: File
    format: "http://edamontology.org/format_1963" # UniProtKB format
  input_3:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  ProSight Lite_01:
    run: add-path-to-the-implementation/ProSight Lite.cwl 
    in:
      ProSight Lite_in_1: input_3
      ProSight Lite_in_2: input_1
      ProSight Lite_in_3: input_2
    out: [ProSight Lite_out_1, ProSight Lite_out_2]
  PChopper_02:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: input_3
    out: [PChopper_out_1]
  MS-Fit_03:
    run: add-path-to-the-implementation/MS-Fit.cwl 
    in:
      MS-Fit_in_1: input_3
    out: [MS-Fit_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: ProSight Lite_01/ProSight Lite_out_1
      OpenMS_in_2: PChopper_02/PChopper_out_1
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