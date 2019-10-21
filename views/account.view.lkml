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

  measure: count {
    type: count
    drill_fields: [account_id, account_balance.count]
  }
}
