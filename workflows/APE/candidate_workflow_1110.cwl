# WorkflowNo_1107
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1107
doc: A workflow including the tool(s) InDigestion, DeconMSn, EncyclopeDIA, IsobariQ, DIA-Umpire.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1705" # HET group dictionary entry format
  input_2:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
  input_3:
    type: File
    format: "http://edamontology.org/format_3712" # Thermo RAW
steps:
  InDigestion_01:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: input_1
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  DeconMSn_02:
    run: add-path-to-the-implementation/DeconMSn.cwl 
    in:
      DeconMSn_in_1: input_3
      DeconMSn_in_2: input_3
    out: [DeconMSn_out_1, DeconMSn_out_2, DeconMSn_out_3]
  EncyclopeDIA_03:
    run: add-path-to-the-implementation/EncyclopeDIA.cwl 
    in:
      EncyclopeDIA_in_1: input_2
      EncyclopeDIA_in_2: InDigestion_01/InDigestion_out_3
    out: [EncyclopeDIA_out_1]
  IsobariQ_04:
    run: add-path-to-the-implementation/IsobariQ.cwl 
    in:
      IsobariQ_in_1: EncyclopeDIA_03/EncyclopeDIA_out_1
    out: [IsobariQ_out_1]
  DIA-Umpire_05:
    run: add-path-to-the-implementation/DIA-Umpire.cwl 
    in:
      DIA-Umpire_in_1: DeconMSn_02/DeconMSn_out_3
      DIA-Umpire_in_2: IsobariQ_04/IsobariQ_out_1
      DIA-Umpire_in_3: InDigestion_01/InDigestion_out_3
    out: [DIA-Umpire_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3162" # MAGE-TAB
    outputSource: DIA-Umpire_05/DIA-Umpire_out_1
