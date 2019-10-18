view: contact {
  sql_table_name: CONTACT ;;

  dimension: contact_id {
    primary_key: yes
    label: "Contact ID"
    type: string
    sql: ${TABLE}."CONTACT_ID" ;;
  }

  dimension: contact {
    type: string
    sql: ${TABLE}."CONTACT" ;;
  }

  dimension: contact_status {
    type: string
    sql: ${TABLE}."CONTACT_STATUS" ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}."EMAIL" ;;
  }

  measure: count {
    type: count
    drill_fields: [contact_id, invoice.count]
  }
}
