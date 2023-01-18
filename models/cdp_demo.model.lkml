connection: "pl-del-ads"

# include all the views
include: "/views/**/*.view"

datagroup: cdp_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cdp_demo_default_datagroup

explore: orders {}

explore: customers {
  join: orders {
    type: left_outer
    sql_on:  ${orders.id} = ${customers.id}  ;;
    relationship: many_to_one
  }
}
