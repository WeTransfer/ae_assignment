Welcome to your Analytics Engineering assignment!

Once you're done with the assignment, compress the results and send it back to HR. Don't forget to commit your changes,
so we can follow the steps you took to arrive at the solution.

**IMPORTANT:** Do **not** publish your results to a public git repository!

# Using the this project

0. Install [dbt](https://docs.getdbt.com/dbt-cli/installation)
1. Create a [dbt profile](https://docs.getdbt.com/dbt-cli/configure-your-profile) to connect to a database.
2. Move the provided CSV file into the `data/` folder.
3. Load the data, build the models and run the tests:

```
dbt seed
dbt run
dbt test
```

# Task one: merge the feature branch

We got you started with providing some data quality in the `feature/add_test`. Merge it to master and check if the tests
work.

# Task two: data modeling

At Wetransfer we like to A/B test our marketing campaigns. Create models to
serve a dashboard that reports on the email marketing campaign A/B test
performance for our ‘Ideas report campaign’ from the sample data.
We pick our winning campaigns using the click through rate which is expressed
as a percentage and is calculated as total unique clicks/ total unique opens.
The report should include the total delivered emails, total bounced emails,
total opens, total clicks, total unsubscribes, the delivery rate and the open
rate for each marketing campaign per country (or rest of world). Exclude all
emails which were not part of the A/B test, that is where the field
marketing_campaign_split_id is null.

# Task three: Data modelling

Write a short paragraph comparing and contrasting the star schema approach to data modelling versus the wide format.
Which would you advise WeTransfer to use and why?