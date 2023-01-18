view: orders {
  sql_table_name: `del_ads_pl.orders`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}.f0_ ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
