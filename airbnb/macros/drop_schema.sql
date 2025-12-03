{% macro drop_schema(relation) %}
-- Supprime le schéma temporaire
{% set sql %}
  drop schema if exists {{ relation }} cascade
{% endset %}

{% do run_query(sql) %}
{% endmacro %}
