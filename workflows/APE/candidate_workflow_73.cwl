# WorkflowNo_72
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_72
doc: A workflow including the tool(s) Unipept CLI, InDigestion, PChopper, MyriMatch, Multi-Q.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1964" # plain text format (unformatted)
  input_2:
    type: File
    format: "http://edamontology.org/format_1964" # plain text format (unformatted)
  input_3:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
steps:
  Unipept CLI_01:
    run: add-path-to-the-implementation/Unipept CLI.cwl 
    in:
      Unipept CLI_in_1: input_1
      Unipept CLI_in_2: input_2
    out: [Unipept CLI_out_1, Unipept CLI_out_2]
  InDigestion_02:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: Unipept CLI_01/Unipept CLI_out_1
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  PChopper_03:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: InDigestion_02/InDigestion_out_3
    out: [PChopper_out_1]
  MyriMatch_04:
    run: add-path-to-the-implementation/MyriMatch.cwl 
    in:
      MyriMatch_in_1: input_3
      MyriMatch_in_2: PChopper_03/PChopper_out_1
    out: [MyriMatch_out_1]
  Multi-Q_05:
    run: add-path-to-the-implementation/Multi-Q.cwl 
    in:
      Multi-Q_in_1: input_3
      Multi-Q_in_2: MyriMatch_04/MyriMatch_out_1
    out: [Multi-Q_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3157" # EBI Application Result XML
    outputSource: Multi-Q_05/Multi-Q_out_1
