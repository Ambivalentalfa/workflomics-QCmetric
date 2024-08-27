# WorkflowNo_1730
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1730
doc: A workflow including the tool(s) massXpert, massXpert, pymzML, Percolator, Quant.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3248" # mzQuantML
  input_2:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_3:
    type: File
    format: "http://edamontology.org/format_3157" # EBI Application Result XML
steps:
  massXpert_01:
    run: add-path-to-the-implementation/massXpert.cwl 
    in:
      massXpert_in_1: input_3
      massXpert_in_2: input_1
    out: [massXpert_out_1, massXpert_out_2]
  massXpert_02:
    run: add-path-to-the-implementation/massXpert.cwl 
    in:
      massXpert_in_1: input_3
      massXpert_in_2: massXpert_01/massXpert_out_2
    out: [massXpert_out_1, massXpert_out_2]
  pymzML_03:
    run: add-path-to-the-implementation/pymzML.cwl 
    in:
      pymzML_in_1: massXpert_02/massXpert_out_1
    out: [pymzML_out_1]
  Percolator_04:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: pymzML_03/pymzML_out_1
    out: [Percolator_out_1]
  Quant_05:
    run: add-path-to-the-implementation/Quant.cwl 
    in:
      Quant_in_1: input_2
      Quant_in_2: Percolator_04/Percolator_out_1
    out: [Quant_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3468" # xls
    outputSource: Quant_05/Quant_out_1