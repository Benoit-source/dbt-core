{% macro create_schema(schema_name) %}
-- Crée un schéma temporaire
{% set sql %}
  create schema if not exists {{ schema_name }}
{% endset %}

{% do run_query(sql) %}
{% endmacro %}
