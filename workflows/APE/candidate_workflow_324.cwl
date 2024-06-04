# WorkflowNo_323
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_323
doc: A workflow including the tool(s) OpenChrom, Xtractor, TopPIC, XTandemPipeline, Quant.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_2:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_3:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  OpenChrom_01:
    run: add-path-to-the-implementation/OpenChrom.cwl 
    in:
      OpenChrom_in_1: input_2
    out: [OpenChrom_out_1, OpenChrom_out_2]
  Xtractor_02:
    run: add-path-to-the-implementation/Xtractor.cwl 
    in:
      Xtractor_in_1: input_2
      Xtractor_in_2: OpenChrom_01/OpenChrom_out_1
      Xtractor_in_3: input_2
    out: [Xtractor_out_1, Xtractor_out_2, Xtractor_out_3]
  TopPIC_03:
    run: add-path-to-the-implementation/TopPIC.cwl 
    in:
      TopPIC_in_1: Xtractor_02/Xtractor_out_3
      TopPIC_in_2: input_3
    out: [TopPIC_out_1, TopPIC_out_2]
  XTandemPipeline_04:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: TopPIC_03/TopPIC_out_1
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  Quant_05:
    run: add-path-to-the-implementation/Quant.cwl 
    in:
      Quant_in_1: input_1
      Quant_in_2: XTandemPipeline_04/XTandemPipeline_out_1
    out: [Quant_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3468" # xls
    outputSource: Quant_05/Quant_out_1
