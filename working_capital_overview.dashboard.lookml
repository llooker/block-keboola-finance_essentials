- dashboard: working_capital_overview
  title: Working Capital Overview
  layout: newspaper
  elements:
  - name: ''
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://www.keboola.com/data/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - title: AR/AP Aging
    name: AR/AP Aging
    model: keboola_block_xero
    explore: invoice
    type: looker_column
    fields: [invoice.balance_amount, invoice.payment_status_group, invoice.invoice_type]
    pivots: [invoice.invoice_type]
    fill_fields: [invoice.payment_status_group]
    filters:
      invoice.is_paid: 'No'
    sorts: [invoice.payment_status_group, invoice.invoice_type]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issued - invoice.balance_amount,
            id: issued - invoice.balance_amount, name: issued}, {axisId: received
              - invoice.balance_amount, id: received - invoice.balance_amount, name: received}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    series_colors:
      received - invoice.balance_amount: "#ed6168"
    series_labels:
      issued - invoice.balance_amount: Accounts Receivable
      received - invoice.balance_amount: Accounts Payable
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    row: 4
    col: 12
    width: 12
    height: 8
  - name: 'Scaffold'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Finance - Xero</b></font>
    row: 0
    col: 0
    width: 7
    height: 2
  - name: 'Dashboard'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Working Capital Overview</b></font>
    body_text: ''
    row: 0
    col: 7
    width: 11
    height: 2
  - title: Account Balance History
    name: Account Balance History
    model: keboola_block_xero
    explore: account_balance
    type: table
    fields: [account_balance.account_balance_total, account.account, account_balance.date_month]
    pivots: [account_balance.date_month]
    fill_fields: [account_balance.date_month]
    filters:
      account_balance.date_month: 3 months
      account_balance.last_day_of_month: 'true'
    sorts: [account_balance.account_balance_total desc 0, account_balance.date_month]
    limit: 500
    total: true
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#ed6168",
        color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 4
    col: 0
    width: 12
    height: 8
  - title: AR - AP Balance
    name: AR - AP Balance
    model: keboola_block_xero
    explore: invoice
    type: single_value
    fields: [invoice.balance_amount]
    filters:
      invoice.is_paid: 'No'
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: "#ed6168",
        font_color: "#e7e7e7", color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: "#9fc190", font_color: "#e7e7e7", color_application: {
          collection_id: legacy, palette_id: legacy_diverging1, options: {constraints: {
              min: {type: minimum}, mid: {type: number, value: 0}, max: {type: maximum}},
            mirror: true, reverse: false, stepped: false}}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: issued - invoice.balance_amount,
            id: issued - invoice.balance_amount, name: issued}, {axisId: received
              - invoice.balance_amount, id: received - invoice.balance_amount, name: received}],
        showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: normal
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_colors:
      received - invoice.balance_amount: "#ed6168"
    series_labels:
      issued - invoice.balance_amount: Accounts Receivable
      received - invoice.balance_amount: Accounts Payable
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: true
    show_silhouette: false
    totals_color: "#808080"
    listen: {}
    row: 2
    col: 8
    width: 8
    height: 2
  - title: Accounts Balances Total
    name: Accounts Balances Total
    model: keboola_block_xero
    explore: account_balance
    type: single_value
    fields: [account_balance.account_balance_total]
    filters:
      account_balance.date_month: 1 months
      account_balance.last_day_of_month: 'true'
    sorts: [account_balance.account_balance_total desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: "#ed6168",
        font_color: "#e7e7e7", color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: "#9fc190", font_color: "#e7e7e7", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 2
    col: 0
    width: 8
    height: 2
  - name: Working Capital
    title: Working Capital
    merged_queries:
    - model: keboola_block_xero
      explore: invoice
      type: single_value
      fields: [invoice.balance_amount, contact.default_link]
      filters:
        invoice.is_paid: 'No'
      sorts: [invoice.balance_amount desc]
      limit: 500
      query_timezone: America/Los_Angeles
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes: [{label: '', orientation: left, series: [{axisId: issued - invoice.balance_amount,
              id: issued - invoice.balance_amount, name: issued}, {axisId: received
                - invoice.balance_amount, id: received - invoice.balance_amount, name: received}],
          showLabels: false, showValues: true, unpinAxis: false, tickDensity: default,
          tickDensityCustom: 5, type: linear}]
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      y_axis_tick_density_custom: 5
      show_x_axis_label: false
      show_x_axis_ticks: true
      y_axis_scale_mode: linear
      x_axis_reversed: false
      y_axis_reversed: false
      plot_size_by_field: false
      trellis: ''
      stacking: normal
      limit_displayed_rows: false
      legend_position: center
      series_types: {}
      point_style: none
      series_colors:
        received - invoice.balance_amount: "#ed6168"
      series_labels:
        issued - invoice.balance_amount: Accounts Receivable
        received - invoice.balance_amount: Accounts Payable
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: true
      show_silhouette: false
      totals_color: "#808080"
    - model: keboola_block_xero
      explore: account_balance
      type: table
      fields: [account_balance.account_balance_total, account.default_link]
      filters:
        account_balance.last_day_of_month: 'true'
        account_balance.date_month: 1 months
      limit: 500
      query_timezone: America/Los_Angeles
      join_fields:
      - field_name: account.default_link
        source_field_name: contact.default_link
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#ed6168",
        color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: greater
          than, value: 0, background_color: "#9fc190", font_color: "#e7e7e7", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    type: single_value
    series_types: {}
    hidden_fields: [invoice.balance_amount, account_balance.account_balance_total]
    dynamic_fields: [{table_calculation: working_capital, label: Working Capital,
        expression: "${invoice.balance_amount}+${account_balance.account_balance_total}",
        value_format: "$# ##0.00; ($# ##0.00)", value_format_name: !!null '', _kind_hint: measure,
        _type_hint: number}]
    row: 2
    col: 16
    width: 8
    height: 2
