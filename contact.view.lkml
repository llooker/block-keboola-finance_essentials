include: "//@{CONFIG_PROJECT_NAME}/contact.view"

view: contact {
  extends: [contact_config]
}

view: contact_core {
  sql_table_name: @{SCHEMA_NAME}.CONTACT ;;

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

  dimension: default_link {
    type: string
    sql: 'default' ;;
    hidden: yes
    description: "Dummy dimension for explore result merging purposes only"
  }

  measure: count {
    type: count
    drill_fields: [contact_id, invoice.count]
  }
}
