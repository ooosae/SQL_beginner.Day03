WITH set1 AS (
    SELECT
        m.pizza_name,
        p.name,
        m.price,
        p.id
    FROM
        menu m

    JOIN
        pizzeria p ON
            m.pizzeria_id = p.id
    )

SELECT
    set2.pizza_name,
    set2.name AS pizzeria_name_1,
    set1.name AS pizzeria_name_2,
    set2.price

FROM (
    SELECT *
    FROM
        set1
    ) set2

    JOIN
        set1 ON
            set2.price = set1.price AND
            set2.pizza_name = set1.pizza_name AND
            set2.id > set1.id
