# WorkflowNo_313
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_313
doc: A workflow including the tool(s) dig, MyriMatch, OpenMS, MassChroQ, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3710" # WIFF format
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_3:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
steps:
  dig_01:
    run: add-path-to-the-implementation/dig.cwl 
    in:
      dig_in_1: input_2
    out: [dig_out_1]
  MyriMatch_02:
    run: add-path-to-the-implementation/MyriMatch.cwl 
    in:
      MyriMatch_in_1: input_1
      MyriMatch_in_2: input_2
    out: [MyriMatch_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: dig_01/dig_out_1
      OpenMS_in_3: MyriMatch_02/MyriMatch_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  MassChroQ_04:
    run: add-path-to-the-implementation/MassChroQ.cwl 
    in:
      MassChroQ_in_1: OpenMS_03/OpenMS_out_1
    out: [MassChroQ_out_1]
  OpenSWATH_05:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: MassChroQ_04/MassChroQ_out_1
    out: [OpenSWATH_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
    outputSource: OpenSWATH_05/OpenSWATH_out_1
