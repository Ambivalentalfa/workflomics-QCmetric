# WorkflowNo_1077
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1077
doc: A workflow including the tool(s) ProSight PTM, Xtractor, adjustPKL, OpenSWATH, Mascot Server.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
  input_2:
    type: File
    format: "http://edamontology.org/format_3713" # Mascot .dat file
  input_3:
    type: File
    format: "http://edamontology.org/format_1391" # HMMER-aln
steps:
  ProSight PTM_01:
    run: add-path-to-the-implementation/ProSight PTM.cwl 
    in:
      ProSight PTM_in_1: input_2
    out: [ProSight PTM_out_1]
  Xtractor_02:
    run: add-path-to-the-implementation/Xtractor.cwl 
    in:
      Xtractor_in_1: input_3
      Xtractor_in_2: input_2
      Xtractor_in_3: input_3
    out: [Xtractor_out_1, Xtractor_out_2, Xtractor_out_3]
  adjustPKL_03:
    run: add-path-to-the-implementation/adjustPKL.cwl 
    in:
      adjustPKL_in_1: ProSight PTM_01/ProSight PTM_out_1
      adjustPKL_in_2: ProSight PTM_01/ProSight PTM_out_1
    out: [adjustPKL_out_1, adjustPKL_out_2]
  OpenSWATH_04:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: input_1
      OpenSWATH_in_2: Xtractor_02/Xtractor_out_3
    out: [OpenSWATH_out_1]
  Mascot Server_05:
    run: add-path-to-the-implementation/Mascot Server.cwl 
    in:
      Mascot Server_in_1: OpenSWATH_04/OpenSWATH_out_1
      Mascot Server_in_2: adjustPKL_03/adjustPKL_out_1
    out: [Mascot Server_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
    outputSource: Mascot Server_05/Mascot Server_out_1