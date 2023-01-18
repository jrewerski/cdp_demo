view: orders2 {
  sql_table_name: `del_ads_pl.orders2`
    ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: product {
    hidden: yes
    sql: ${TABLE}.product ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}

view: orders2__product {
  dimension: orders2__product {
    type: string
    sql: orders2__product ;;
  }
}
