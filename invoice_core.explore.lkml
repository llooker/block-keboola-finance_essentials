explore: invoice_core {
  hidden: yes
  extension: required
  
  join: contact {
    type: left_outer
    sql_on: ${invoice.contact_id} = ${contact.contact_id} ;;
    relationship: many_to_one
  }
}