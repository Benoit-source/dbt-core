{% macro create_db(db_name) %}
  {% set sql %}
    CREATE TRANSIENT DATABASE {{ db_name }};
  {% endset %}

  {{ return(run_query(sql)) }}
{% endmacro %}

{% macro drop_db(db_name) %}
  {% set sql %}
    DROP DATABASE IF EXISTS {{ db_name }};
  {% endset %}

  {{ return(run_query(sql)) }}
{% endmacro %}
