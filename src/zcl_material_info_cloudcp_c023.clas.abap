CLASS zcl_material_info_cloudcp_c023 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
    METHODS get_mateial_art
      IMPORTING
                matnr               TYPE I_Product-Product
      RETURNING VALUE(material_art) TYPE I_Product-ProductType.
ENDCLASS.



CLASS zcl_material_info_cloudcp_c023 IMPLEMENTATION.
  METHOD get_mateial_art.
    DATA material TYPE I_Product.
    DATA production_date TYPE datn.

    production_date = cl_abap_context_info=>get_system_date( ).

    SELECT SINGLE       FROM I_Product FIELDS ProductType
      WHERE Product = @matnr       INTO CORRESPONDING FIELDS OF @material .

    material_art = material-ProductType.

  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    DATA material_info TYPE REF TO zcl_material_info_cloudcp_c023.
    material_info = NEW zcl_material_info_cloudcp_c023( ).
    DATA(material_art) = material_info->get_mateial_art( 'RM34' ).
    out->write( material_art ).

  ENDMETHOD.

ENDCLASS.
