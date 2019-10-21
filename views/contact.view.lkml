view: contact {
  sql_table_name: CONTACT ;;

  dimension: contact_id {
    primary_key: yes
    label: "Contact ID"
    type: string
    sql: ${TABLE}."CONTACT_ID" ;;
    html: <a href={{contact_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
  }

  dimension: contact_url {
    hidden: yes
    sql: 'https://go.xero.com/Contacts/View/'||${contact_id} ;;
  }

  dimension: contact {
    type: string
    sql: ${TABLE}."CONTACT" ;;
    html: <a href={{contact_url}} target="_blank"><font color="blue">{{ value }}</font></a> ;;
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
