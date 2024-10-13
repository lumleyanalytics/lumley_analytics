{% macro generate_schema_name(custom_schema_name, node) -%}

    {%- set default_schema = target.schema -%}

    {%- if target.name == 'prod' -%}
        {% if node.fqn[1:-1]|length == 0 %}
            {{ default_schema }}    
        {% else %}
            {# Concat the subfolder(s) name #}
            {% set prefix = node.fqn[1:-1]|join('_') %}
            {{ prefix | trim }}
        {% endif %}
    
    {%- elif custom_schema_name is none -%}
        {# In non-prod environments, if no custom_schema_name is provided, use default_schema #}
        {{ default_schema }}

    {%- else -%}
        {# In non-prod environments, if custom_schema_name is provided, append it to default_schema #}
        {{ default_schema }}_{{ custom_schema_name | trim }}

    {%- endif -%}

{%- endmacro %}