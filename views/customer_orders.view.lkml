view: customer_orders {
  derived_table: {
    sql: SELECT c.id, c.first_name, c.last_name, c.country, c.email, STRING_AGG(o.f0_, ' ' ) as names
      FROM `pl-del-ads.del_ads_pl.customers` c LEFT JOIN
           `pl-del-ads.del_ads_pl.orders` o
           ON c.id = o.id
      GROUP BY c.id, c.first_name, c.last_name,c.country, c.email
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: id {
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: country {
    type: string
    sql: ${TABLE}.country ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: ordered_items {
    type: string
    sql: ${TABLE}.names ;;
  }

  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      country,
      email,
      ordered_items
    ]
  }
}
