# WorkflowNo_1166
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1166
doc: A workflow including the tool(s) PEAKS DB, OpenMS, Pep3D, Graph Extract, MSiReader.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
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
      PEAKS DB_in_1: input_1
      PEAKS DB_in_2: input_3
    out: [PEAKS DB_out_1, PEAKS DB_out_2]
  OpenMS_02:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_1
      OpenMS_in_2: input_3
      OpenMS_in_3: PEAKS DB_01/PEAKS DB_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  Pep3D_03:
    run: add-path-to-the-implementation/Pep3D.cwl 
    in:
      Pep3D_in_1: input_1
      Pep3D_in_2: OpenMS_02/OpenMS_out_1
    out: [Pep3D_out_1, Pep3D_out_2]
  Graph Extract_04:
    run: add-path-to-the-implementation/Graph Extract.cwl 
    in:
      Graph Extract_in_1: Pep3D_03/Pep3D_out_1
    out: [Graph Extract_out_1]
  MSiReader_05:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_2
      MSiReader_in_2: Graph Extract_04/Graph Extract_out_1
    out: [MSiReader_out_1, MSiReader_out_2]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3592" # BMP
    outputSource: MSiReader_05/MSiReader_out_1
