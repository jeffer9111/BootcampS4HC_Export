CLASS zcl_material_information_c023 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_mateial_art
      IMPORTING
                matnr               TYPE matnr
      RETURNING VALUE(material_art) TYPE mara-mtart.
ENDCLASS.



CLASS zcl_material_information_c023 IMPLEMENTATION.
  METHOD get_mateial_art.
    DATA material TYPE mara.
    DATA production_date TYPE datn.

    production_date = sy-datum.

    SELECT SINGLE mtart
      FROM mara
      INTO CORRESPONDING FIELDS OF material
      WHERE matnr = matnr.

    material_art = material-mtart.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_information_c023.
    material_info = NEW zcl_material_information_c023( ).
    DATA(material_art) = material_info->get_mateial_art( 'RM34' ).
    out->write( material_art ).

  ENDMETHOD.

ENDCLASS.
