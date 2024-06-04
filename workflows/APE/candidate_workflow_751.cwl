# WorkflowNo_750
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_750
doc: A workflow including the tool(s) raw2mzDB, OpenSWATH, Mascot Server, OpenMS, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3710" # WIFF format
  input_2:
    type: File
    format: "http://edamontology.org/format_3652" # dta
  input_3:
    type: File
    format: "http://edamontology.org/format_3246" # TraML
steps:
  raw2mzDB_01:
    run: add-path-to-the-implementation/raw2mzDB.cwl 
    in:
      raw2mzDB_in_1: input_1
    out: [raw2mzDB_out_1]
  OpenSWATH_02:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: raw2mzDB_01/raw2mzDB_out_1
      OpenSWATH_in_2: input_3
    out: [OpenSWATH_out_1]
  Mascot Server_03:
    run: add-path-to-the-implementation/Mascot Server.cwl 
    in:
      Mascot Server_in_1: OpenSWATH_02/OpenSWATH_out_1
      Mascot Server_in_2: raw2mzDB_01/raw2mzDB_out_1
    out: [Mascot Server_out_1]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: input_2
      OpenMS_in_3: Mascot Server_03/Mascot Server_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  OpenSWATH_05:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: OpenMS_04/OpenMS_out_2
    out: [OpenSWATH_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
    outputSource: OpenSWATH_05/OpenSWATH_out_1
