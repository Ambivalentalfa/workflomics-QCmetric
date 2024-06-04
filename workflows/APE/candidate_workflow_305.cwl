# WorkflowNo_304
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_304
doc: A workflow including the tool(s) InDigestion, protk, protk, Percolator, Libra.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_2570" # completely unambiguous pure rna sequence
  input_3:
    type: File
    format: "http://edamontology.org/format_3655" # pepXML
steps:
  InDigestion_01:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: input_2
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  protk_02:
    run: add-path-to-the-implementation/protk.cwl 
    in:
      protk_in_1: InDigestion_01/InDigestion_out_3
      protk_in_2: input_3
    out: [protk_out_1, protk_out_2]
  protk_03:
    run: add-path-to-the-implementation/protk.cwl 
    in:
      protk_in_1: input_1
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
