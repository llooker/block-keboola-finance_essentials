view: invoice_item {
  sql_table_name: INVOICE_ITEM ;;

  dimension: invoice_item_id {
    primary_key: yes
    label: "Invoice Item ID"
    type: string
    sql: ${TABLE}."INVOICE_ITEM_ID" ;;
  }

  dimension: invoice_id {
    type: string
    hidden: yes
    sql: ${TABLE}."INVOICE_ID" ;;
  }

  dimension: item_description {
    type: string
    sql: ${TABLE}."ITEM_DESCRIPTION" ;;
  }

  dimension: line_amount_original {
    type: number
    sql: ${TABLE}."LINE_AMOUNT_ORIGINAL" ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}."QUANTITY" ;;
  }

  dimension: unit_amount_original {
    type: number
    sql: ${TABLE}."UNIT_AMOUNT_ORIGINAL" ;;
  }

  measure: count {
    type: count
    drill_fields: [invoice_item_id, invoice.invoice_id]
  }
}
