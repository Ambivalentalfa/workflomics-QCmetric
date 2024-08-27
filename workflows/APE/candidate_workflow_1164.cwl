# WorkflowNo_1163
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1163
doc: A workflow including the tool(s) InDigestion, MR-MSPOLYGRAPH, TopPIC, Percolator, Libra.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3681" # mzTab
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_3:
    type: File
    format: "http://edamontology.org/format_3652" # dta
steps:
  InDigestion_01:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: input_1
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  MR-MSPOLYGRAPH_02:
    run: add-path-to-the-implementation/MR-MSPOLYGRAPH.cwl 
    in:
      MR-MSPOLYGRAPH_in_1: input_3
      MR-MSPOLYGRAPH_in_2: InDigestion_01/InDigestion_out_3
    out: [MR-MSPOLYGRAPH_out_1, MR-MSPOLYGRAPH_out_2]
  TopPIC_03:
    run: add-path-to-the-implementation/TopPIC.cwl 
    in:
      TopPIC_in_1: MR-MSPOLYGRAPH_02/MR-MSPOLYGRAPH_out_2
      TopPIC_in_2: input_2
    out: [TopPIC_out_1, TopPIC_out_2]
  Percolator_04:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: TopPIC_03/TopPIC_out_1
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