connection: "pl-del-ads"

# include all the views
include: "/views/**/*.view"

datagroup: cdp_demo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: cdp_demo_default_datagroup

explore: orders {}

explore: customers {}

explore: orders2 {
  join: orders2__product {
    view_label: "Orders2: Product"
    sql: LEFT JOIN UNNEST(${orders2.product}) as orders2__product ;;
    relationship: one_to_many
  }
}
