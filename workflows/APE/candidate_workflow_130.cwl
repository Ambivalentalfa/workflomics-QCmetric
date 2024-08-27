# WorkflowNo_127
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_127
doc: A workflow including the tool(s) XTandemPipeline, OpenMS, PChopper, protk, PeptideShaker.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_2:
    type: File
    format: "http://edamontology.org/format_3604" # SVG
  input_3:
    type: File
    format: "http://edamontology.org/format_3655" # pepXML
steps:
  XTandemPipeline_01:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: input_3
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  OpenMS_02:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_1
      OpenMS_in_2: input_2
      OpenMS_in_3: XTandemPipeline_01/XTandemPipeline_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  PChopper_03:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: OpenMS_02/OpenMS_out_1
    out: [PChopper_out_1]
  protk_04:
    run: add-path-to-the-implementation/protk.cwl 
    in:
      protk_in_1: XTandemPipeline_01/XTandemPipeline_out_2
      protk_in_2: input_3
    out: [protk_out_1, protk_out_2]
  PeptideShaker_05:
    run: add-path-to-the-implementation/PeptideShaker.cwl 
    in:
      PeptideShaker_in_1: PChopper_03/PChopper_out_1
      PeptideShaker_in_2: protk_04/protk_out_1
      PeptideShaker_in_3: input_1
    out: [PeptideShaker_out_1, PeptideShaker_out_2, PeptideShaker_out_3, PeptideShaker_out_4]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3253" # Manchester OWL Syntax
    outputSource: PeptideShaker_05/PeptideShaker_out_1