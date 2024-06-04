# WorkflowNo_1617
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1617
doc: A workflow including the tool(s) PChopper, PeptideProphet, OpenMS, mspire_mspire-sequest, MSiReader.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_2311" # EMBL-HTML
  input_3:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
steps:
  PChopper_01:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: input_1
    out: [PChopper_out_1]
  PeptideProphet_02:
    run: add-path-to-the-implementation/PeptideProphet.cwl 
    in:
      PeptideProphet_in_1: input_2
    out: [PeptideProphet_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: input_1
      OpenMS_in_3: PeptideProphet_02/PeptideProphet_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  mspire_mspire-sequest_04:
    run: add-path-to-the-implementation/mspire_mspire-sequest.cwl 
    in:
      mspire_mspire-sequest_in_1: OpenMS_03/OpenMS_out_1
    out: [mspire_mspire-sequest_out_1]
  MSiReader_05:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: PChopper_01/PChopper_out_1
      MSiReader_in_2: mspire_mspire-sequest_04/mspire_mspire-sequest_out_1
    out: [MSiReader_out_1, MSiReader_out_2]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3620" # xlsx
    outputSource: MSiReader_05/MSiReader_out_1
