view: account {
  sql_table_name: ACCOUNT ;;
  drill_fields: [account_id]

  dimension: account_id {
    primary_key: yes
    label: "Account ID"
    type: string
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: account {
    type: string
    sql: ${TABLE}."ACCOUNT" ;;
  }

  dimension: account_currency {
    type: string
    sql: ${TABLE}."ACCOUNT_CURRENCY" ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}."ACCOUNT_NUMBER" ;;
  }

  dimension: account_status {
    type: string
    sql: ${TABLE}."ACCOUNT_STATUS" ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}."ACCOUNT_TYPE" ;;
  }

  dimension: default_link {
    type: string
    hidden: yes
    sql: 'default' ;;
    description: "Dummy dimension for explore result merging purposes only"
  }

  measure: count {
    type: count
    drill_fields: [account_id, account_balance.count]
  }
}
