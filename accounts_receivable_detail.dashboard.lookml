- dashboard: accounts_receivable_detail
  title: Accounts Receivable Detail
  layout: newspaper
  elements:
  - name: 'powered by'
    type: text
    body_text: <a href="https://keboola.com" target="_blank"> <img src="https://www.keboola.com/data/poweredByKeboola.png"
      width="100%"/>
    row: 0
    col: 18
    width: 6
    height: 2
  - title: AR Total
    name: AR Total
    model: keboola_block_xero
    explore: invoice
    type: single_value
    fields: [invoice.total_amount]
    filters:
      invoice.is_paid: 'No'
    limit: 500
    query_timezone: America/Los_Angeles
    row: 2
    col: 0
    width: 6
    height: 2
  - title: Current AR
    name: Current AR
    model: keboola_block_xero
    explore: invoice
    type: single_value
    fields: [invoice.total_amount]
    filters:
      invoice.is_paid: 'No'
      invoice.payment_status_group: Current, Coming Up
    sorts: [invoice.total_amount desc]
    limit: 500
    query_timezone: America/Los_Angeles
    row: 2
    col: 6
    width: 6
    height: 2
  - title: AR Past Due
    name: AR Past Due
    model: keboola_block_xero
    explore: invoice
    type: single_value
    fields: [invoice.total_amount]
    filters:
      invoice.is_paid: 'No'
      invoice.payment_status_group: "-Current, -Coming Up"
    sorts: [invoice.total_amount desc]
    limit: 500
    query_timezone: America/Los_Angeles
    row: 2
    col: 12
    width: 6
    height: 2
  - name: 'dashboard'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Accounts Receivable Detail</b></font>
    body_text: ''
    row: 0
    col: 7
    width: 11
    height: 2
  - name: 'scaffold'
    type: text
    title_text: ''
    subtitle_text: <font size="5px"><font color="#408ef7"><b>Finance - Xero</b></font>
    row: 0
    col: 0
    width: 7
    height: 2
  - title: AR Aging
    name: AR Aging
    model: keboola_block_xero
    explore: invoice
    type: looker_column
    fields: [invoice.payment_status_group, invoice.total_amount_open, invoice.open_invoice_count]
    filters:
      invoice.total_amount_open: ">0"
    sorts: [invoice.payment_status_group]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    y_axes: [{label: '', orientation: left, series: [{axisId: invoice.total_amount_open,
            id: invoice.total_amount_open, name: Open Amount}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: invoice.open_invoice_count,
            id: invoice.open_invoice_count, name: Open Invoice Count}], showLabels: false,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
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
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    series_types: {}
    point_style: none
    series_labels:
      invoice.payment_delay_average: Past Avg. Payment Delay
      invoice.total_amount_open: Open Amount
      contact.contact: Customer
      invoice.current_payment_delay_average: Current Payment Delay
      invoice.past_payment_delay_average: Past Payments Avg. Delay
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    column_spacing_ratio: 0.1
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    row: 4
    col: 0
    width: 15
    height: 10
  - title: Past Offenders
    name: Past Offenders
    model: keboola_block_xero
    explore: invoice
    type: table
    fields: [contact.contact, invoice.total_amount_open, invoice.past_payment_delay_average,
      invoice.current_payment_delay_average]
    filters:
      invoice.total_amount_open: ">0"
      invoice.past_payment_delay_average: ">13"
    sorts: [invoice.past_payment_delay_average desc]
    limit: 500
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    series_labels:
      invoice.payment_delay_average: Past Avg. Payment Delay
      invoice.total_amount_open: Open Amount
      contact.contact: Customer
      invoice.current_payment_delay_average: Current Delay
      invoice.past_payment_delay_average: Past Avg. Delay
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: true
    conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#62bad4",
        font_color: !!null '', color_application: {collection_id: legacy, palette_id: legacy_diverging1,
          options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: number,
                value: 0}, max: {type: maximum}}, mirror: true, reverse: true, stepped: false}},
        bold: false, italic: false, strikethrough: false, fields: [invoice.past_payment_delay_average,
          invoice.current_payment_delay_average]}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    listen: {}
    row: 4
    col: 15
    width: 9
    height: 10
  - title: 60+ days past due
    name: 60+ days past due
    model: keboola_block_xero
    explore: invoice
    type: single_value
    fields: [invoice.total_amount]
    filters:
      invoice.is_paid: 'No'
      invoice.payment_status_group: Past Due - 60+
    sorts: [invoice.total_amount desc]
    limit: 500
    query_timezone: America/Los_Angeles
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: true
    conditional_formatting: [{type: greater than, value: 0, background_color: "#ed6168",
        font_color: "#e7e7e7", color_application: {collection_id: legacy, palette_id: legacy_sequential3},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: equal
          to, value: 0, background_color: "#9fc190", font_color: "#e7e7e7", color_application: {
          collection_id: legacy, palette_id: legacy_sequential3}, bold: false, italic: false,
        strikethrough: false, fields: !!null ''}]
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    listen: {}
    row: 2
    col: 18
    width: 6
    height: 2
