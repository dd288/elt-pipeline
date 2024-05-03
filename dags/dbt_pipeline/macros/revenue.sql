{% macro revenue_amount(extended_price, discount_percentage, scale=2) %}
    (sum ({{extended_price}} * {{ discount_percentage }}))::decimal(16, {{ scale }})
{% endmacro %}
