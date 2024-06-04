# WorkflowNo_372
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_372
doc: A workflow including the tool(s) Unipept CLI, DeconMSn, InDigestion, MyriMatch, Libra.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3712" # Thermo RAW
  input_2:
    type: File
    format: "http://edamontology.org/format_1964" # plain text format (unformatted)
  input_3:
    type: File
    format: "http://edamontology.org/format_1964" # plain text format (unformatted)
steps:
  Unipept CLI_01:
    run: add-path-to-the-implementation/Unipept CLI.cwl 
    in:
      Unipept CLI_in_1: input_2
      Unipept CLI_in_2: input_3
    out: [Unipept CLI_out_1, Unipept CLI_out_2]
  DeconMSn_02:
    run: add-path-to-the-implementation/DeconMSn.cwl 
    in:
      DeconMSn_in_1: input_1
      DeconMSn_in_2: input_1
    out: [DeconMSn_out_1, DeconMSn_out_2, DeconMSn_out_3]
  InDigestion_03:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: Unipept CLI_01/Unipept CLI_out_1
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  MyriMatch_04:
    run: add-path-to-the-implementation/MyriMatch.cwl 
    in:
      MyriMatch_in_1: DeconMSn_02/DeconMSn_out_3
      MyriMatch_in_2: InDigestion_03/InDigestion_out_3
    out: [MyriMatch_out_1]
  Libra_05:
    run: add-path-to-the-implementation/Libra.cwl 
    in:
      Libra_in_1: MyriMatch_04/MyriMatch_out_1
    out: [Libra_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: Libra_05/Libra_out_1
