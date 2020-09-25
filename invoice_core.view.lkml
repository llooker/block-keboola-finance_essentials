include: "//@{CONFIG_PROJECT_NAME}/invoice.view"

view: invoice {
  extends: [invoice_config]
}

view: invoice_core {
  sql_table_name: @{SCHEMA_NAME}.INVOICE ;;
  drill_fields: [invoice_id]

  dimension: invoice_id {
    label: "Invoice ID"
    primary_key: yes
    type: string
    sql: ${TABLE}."INVOICE_ID" ;;
  }

  dimension: contact_id {
    type: string
    hidden: yes
    sql: ${TABLE}."CONTACT_ID" ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}."CREATED_DATE" ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}."CURRENCY" ;;
  }

  dimension: days_overdue {
    type: number
    sql: ${TABLE}."DAYS_OVERDUE" ;;
  }

  dimension_group: due {
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
    sql: ${TABLE}."DUE_DATE" ;;
  }

  dimension: invoice_number {
    type: string
    sql: ${TABLE}."INVOICE_NUMBER" ;;
  }

  dimension: invoice_status {
    type: string
    sql: ${TABLE}."INVOICE_STATUS" ;;
  }

  dimension: invoice_type {
    type: string
    sql: ${TABLE}."INVOICE_TYPE" ;;
  }

  dimension: is_paid {
    label: "Paid"
    type: yesno
    sql: ${TABLE}."IS_PAID" ;;
  }

  dimension_group: paid {
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
    sql: ${TABLE}."PAID_ON" ;;
  }

  dimension: net_amount_dimension {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_AMOUNT_ORIGINAL" ;;
  }

  dimension: total_amount_dimension {
    type: number
    hidden: yes
    sql: ${TABLE}."TOTAL_AMOUNT_WITH_VAT_ORIGINAL" ;;
  }

  dimension_group: current_payment_offset {
    hidden: yes
    type: duration
    intervals: [day]
    sql_start: ${TABLE}."DUE_DATE" ;;
    sql_end: current_date ;;
  }

  dimension_group: past_payment_offset {
    hidden: yes
    type: duration
    intervals: [day]
    sql_start: ${TABLE}."DUE_DATE" ;;
    sql_end: ${TABLE}."PAID_ON" ;;
  }

  dimension: payment_status_group {
    case: {
      when: {
        sql: ${days_current_payment_offset} <= -7;;
        label: "Current"
      }
      when: {
        sql: ${days_current_payment_offset} > -7 AND ${days_current_payment_offset} <= 1;;
        label: "Coming Up"
      }
      when: {
        sql: ${days_current_payment_offset} > 1 AND ${days_current_payment_offset} <= 30;;
        label: "Past Due - <30"
      }
      when: {
        sql: ${days_current_payment_offset} > 30 AND ${days_current_payment_offset} <= 60;;
        label: "Past Due - 30+"
      }
      when: {
        sql: ${days_current_payment_offset} > 60;;
        label: "Past Due - 60+"
      }
      else:"Unknown"
    }
  }

  measure: net_amount {
    type: sum
    sql: ${net_amount_dimension} ;;
    value_format_name: usd
    drill_fields: [invoice_list*]
  }

  measure: total_amount {
    type: sum
    sql: ${total_amount_dimension} ;;
    value_format_name: usd
    drill_fields: [invoice_list*]
  }

  measure: total_amount_paid {
    type: sum
    sql: ${total_amount_dimension} ;;
    filters: {
      field: is_paid
      value: "true"
    }
    value_format_name: usd
    drill_fields: [invoice_list*]
  }

  measure: total_amount_open{
    type: sum
    sql: ${total_amount_dimension} ;;
    filters: {
      field: is_paid
      value: "false"
    }
    value_format_name: usd
    drill_fields: [invoice_list*]
  }

  measure: balance_amount {
    type: sum
    sql: (CASE
            WHEN ${invoice_type}='issued'
            THEN ${TABLE}."TOTAL_AMOUNT_WITH_VAT_ORIGINAL"
            ELSE ${TABLE}."TOTAL_AMOUNT_WITH_VAT_ORIGINAL"*-1
          END) ;;
    value_format: "$# ### ##0.00; ($# ### ##0.00)"
    drill_fields: [invoice_list*]
  }

  measure: invoice_count {
    type: count
    drill_fields: [invoice_list*]
  }

  measure: open_invoice_count {
    type: count
    filters: {
      field: is_paid
      value: "false"
    }
    drill_fields: [invoice_list*]
  }

  measure: past_payment_delay_average {
    type: average
    sql: ${days_past_payment_offset} ;;
    filters: {
      field: is_paid
      value: "true"
    }
    precision: 0
    value_format: "##0 \D\a\y\s"
  }

  measure: current_payment_delay_average {
    type: average
    sql: ${days_current_payment_offset} ;;
    filters: {
      field: is_paid
      value: "false"
    }
    precision: 0
    value_format: "##0 \D\a\y\s"
  }

  set: invoice_list {
    fields: [invoice_number,contact.contact,created_date,due_date,is_paid,total_amount]
  }
}
