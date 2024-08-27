# WorkflowNo_1726
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1726
doc: A workflow including the tool(s) msmsEDA, MSiReader, msConvert, PECAN (PEptide-Centric Analysis), Mascot Server.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3911" # msh
  input_2:
    type: File
    format: "http://edamontology.org/format_3682" # imzML metadata file
  input_3:
    type: File
    format: "http://edamontology.org/format_3162" # MAGE-TAB
steps:
  msmsEDA_01:
    run: add-path-to-the-implementation/msmsEDA.cwl 
    in:
      msmsEDA_in_1: input_2
    out: [msmsEDA_out_1, msmsEDA_out_2, msmsEDA_out_3]
  MSiReader_02:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_2
      MSiReader_in_2: msmsEDA_01/msmsEDA_out_3
    out: [MSiReader_out_1, MSiReader_out_2]
  msConvert_03:
    run: add-path-to-the-implementation/msConvert.cwl 
    in:
      msConvert_in_1: MSiReader_02/MSiReader_out_2
    out: [msConvert_out_1]
  PECAN (PEptide-Centric Analysis)_04:
    run: add-path-to-the-implementation/PECAN (PEptide-Centric Analysis).cwl 
    in:
      PECAN (PEptide-Centric Analysis)_in_1: msConvert_03/msConvert_out_1
      PECAN (PEptide-Centric Analysis)_in_2: input_3
    out: [PECAN (PEptide-Centric Analysis)_out_1, PECAN (PEptide-Centric Analysis)_out_2]
  Mascot Server_05:
    run: add-path-to-the-implementation/Mascot Server.cwl 
    in:
      Mascot Server_in_1: input_2
      Mascot Server_in_2: PECAN (PEptide-Centric Analysis)_04/PECAN (PEptide-Centric Analysis)_out_2
    out: [Mascot Server_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
    outputSource: Mascot Server_05/Mascot Server_out_1