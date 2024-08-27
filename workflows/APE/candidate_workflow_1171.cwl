# WorkflowNo_1170
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1170
doc: A workflow including the tool(s) XTandemPipeline, protk, protk, Percolator, Libra.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3711" # X!Tandem XML
  input_2:
    type: File
    format: "http://edamontology.org/format_3313" # BLC
  input_3:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  XTandemPipeline_01:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: input_1
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  protk_02:
    run: add-path-to-the-implementation/protk.cwl 
    in:
      protk_in_1: input_3
      protk_in_2: XTandemPipeline_01/XTandemPipeline_out_1
    out: [protk_out_1, protk_out_2]
  protk_03:
    run: add-path-to-the-implementation/protk.cwl 
    in:
      protk_in_1: input_3
      protk_in_2: protk_02/protk_out_1
    out: [protk_out_1, protk_out_2]
  Percolator_04:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: protk_03/protk_out_1
    out: [Percolator_out_1]
  Libra_05:
    run: add-path-to-the-implementation/Libra.cwl 
    in:
      Libra_in_1: Percolator_04/Percolator_out_1
    out: [Libra_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: Libra_05/Libra_out_1