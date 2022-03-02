view: network_performance {
  # # You can specify the table name if it's different from the view name:
  sql_table_name: network_performance.clean_network_performance ;;

  filter: Date_time {
    type: date_time
  }

  dimension: Time {
    description: "Times Series - Datetime Column"
    type: date_time
    sql: ${TABLE}.Time ;;

   }

  dimension: Inbound_fi_cmg13u_MG1_PE_2 {
     description: "Inbound metric for fi_cmg13u_MG1_PE_2"
     type: number
     sql: ${TABLE}.Inbound_fi_cmg13u_MG1_PE_2 ;;
   }

  dimension: Inbound_fi_cmg13u_MG3_PE_2 {
    description: "Inbound metric for fi_cmg13u_MG3_PE_2"
    type: number
    sql: ${TABLE}.Inbound_fi_cmg13u_MG3_PE_2 ;;
  }

  dimension: Outbound_fi_cmg13u_MG1_PE_2 {
    description: "Outbound metric for fi_cmg13u_MG3_PE_2"
    type: number
    sql: ${TABLE}.Outbound_fi_cmg13u_MG1_PE_2 ;;
  }

  dimension: Outbound_fi_cmg13u_MG3_PE_2 {
    description: "Outbound metric for fi_cmg13u_MG3_PE_2"
    type: number
    sql: ${TABLE}.Outbound_fi_cmg13u_MG3_PE_2 ;;
  }

  measure: tot_average {
    description: ""
    type: average
    sql: ${Inbound_fi_cmg13u_MG1_PE_2}  ;;
    value_format: "#.00"
  }

  measure: 5_day_average {
    description: ""
    type: average
    sql: ${Inbound_fi_cmg13u_MG1_PE_2}  ;;
    value_format: "#.00"
    filters: [Time: "2022-02-02 12:00:00 to 2022-02-10 14:00:00"]
  }

  measure: trend_deviation {
    sql: ((${5_day_average} - ${tot_average}) / ${tot_average} ) ;;
    type: number
    value_format: "#.00%"
  }

}



# view: network_performance {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
