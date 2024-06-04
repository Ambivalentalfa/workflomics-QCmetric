# WorkflowNo_1162
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1162
doc: A workflow including the tool(s) PEAKS DB, OpenMS, msaccess, esimsa2D, esimsa2D.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3614" # ENCODE broad peak format
  input_2:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
  input_3:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  PEAKS DB_01:
    run: add-path-to-the-implementation/PEAKS DB.cwl 
    in:
      PEAKS DB_in_1: input_2
      PEAKS DB_in_2: input_3
    out: [PEAKS DB_out_1, PEAKS DB_out_2]
  OpenMS_02:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_2
      OpenMS_in_2: input_3
      OpenMS_in_3: PEAKS DB_01/PEAKS DB_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  msaccess_03:
    run: add-path-to-the-implementation/msaccess.cwl 
    in:
      msaccess_in_1: input_2
      msaccess_in_2: OpenMS_02/OpenMS_out_1
    out: [msaccess_out_1, msaccess_out_2, msaccess_out_3]
  esimsa2D_04:
    run: add-path-to-the-implementation/esimsa2D.cwl 
    in:
      esimsa2D_in_1: input_1
      esimsa2D_in_2: msaccess_03/msaccess_out_1
      esimsa2D_in_3: msaccess_03/msaccess_out_1
    out: [esimsa2D_out_1, esimsa2D_out_2, esimsa2D_out_3]
  esimsa2D_05:
    run: add-path-to-the-implementation/esimsa2D.cwl 
    in:
      esimsa2D_in_1: input_1
      esimsa2D_in_2: esimsa2D_04/esimsa2D_out_1
      esimsa2D_in_3: msaccess_03/msaccess_out_1
    out: [esimsa2D_out_1, esimsa2D_out_2, esimsa2D_out_3]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_1948" # nbrf/pir
    outputSource: esimsa2D_05/esimsa2D_out_1
