explore: account_balance_core {
  hidden: yes
  extension: required
  
  join: account {
    type: left_outer
    sql_on: ${account_balance.account_id} = ${account.account_id} ;;
    relationship: many_to_one
  }
}