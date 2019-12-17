view: account_balance {
  sql_table_name: ACCOUNT_BALANCE ;;
  drill_fields: [account_balance_id]

  dimension: account_balance_id {
    primary_key: yes
    label: "Account Balance ID"
    type: string
    sql: ${TABLE}."ACCOUNT_BALANCE_ID" ;;
  }

  dimension: account_currency {
    type: string
    sql: ${TABLE}."ACCOUNT_CURRENCY" ;;
  }

  dimension: account_id {
    type: string
    hidden: yes
    sql: ${TABLE}."ACCOUNT_ID" ;;
  }

  dimension: balance_original_dimension {
    type: number
    hidden: yes
    sql: ${TABLE}."BALANCE_ORIGINAL" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}."DATE" ;;
  }

  dimension: last_day_of_month {
    type: string
    sql: ${TABLE}."LAST_DAY_OF_MONTH" ;;
  }

  measure: account_balance_total {
    type: sum
    sql: ${balance_original_dimension} ;;
    value_format_name: usd
    drill_fields: [account.account,account_balance_total]
  }

measure: account_balance_average {
  type: average
  sql: ${balance_original_dimension} ;;
  value_format_name: usd
  drill_fields: [account.account,account_balance_average]
}

  measure: count {
    type: count
    drill_fields: [account_balance_id, account.account_id]
  }
}
