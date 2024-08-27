# WorkflowNo_174
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_174
doc: A workflow including the tool(s) PChopper, InDigestion, EncyclopeDIA, Multi-Q, DIA-Umpire.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
  input_3:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
steps:
  PChopper_01:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: input_1
    out: [PChopper_out_1]
  InDigestion_02:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: PChopper_01/PChopper_out_1
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  EncyclopeDIA_03:
    run: add-path-to-the-implementation/EncyclopeDIA.cwl 
    in:
      EncyclopeDIA_in_1: input_3
      EncyclopeDIA_in_2: InDigestion_02/InDigestion_out_3
    out: [EncyclopeDIA_out_1]
  Multi-Q_04:
    run: add-path-to-the-implementation/Multi-Q.cwl 
    in:
      Multi-Q_in_1: input_2
      Multi-Q_in_2: EncyclopeDIA_03/EncyclopeDIA_out_1
    out: [Multi-Q_out_1]
  DIA-Umpire_05:
    run: add-path-to-the-implementation/DIA-Umpire.cwl 
    in:
      DIA-Umpire_in_1: input_2
      DIA-Umpire_in_2: Multi-Q_04/Multi-Q_out_1
      DIA-Umpire_in_3: input_1
    out: [DIA-Umpire_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3162" # MAGE-TAB
    outputSource: DIA-Umpire_05/DIA-Umpire_out_1