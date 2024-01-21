INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT
    (SELECT MAX(id) FROM person_order) + 1,
    p.id AS person_id,
    m.id AS menu_id,
    '2022-02-25'
FROM
    person p
CROSS JOIN
    menu m
WHERE
    m.pizza_name = 'greek pizza';