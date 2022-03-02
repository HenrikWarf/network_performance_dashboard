# Define the database connection to be used for this model.
connection: "crazy-hippo"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

#datagroup: crazy_forecasting_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
#  max_cache_age: "1 hour"

#}

#persist_with: crazy-forecasting_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Crazy-income-model"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require tha you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key


explore: network_performance {
  view_name: network_performance
}
explore: forecast_performance {
  view_name: forecast_performance
}
explore: multiple_forecast {
  view_name: multiple_forecast
}
