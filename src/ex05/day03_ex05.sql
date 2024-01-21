WITH andrey_visit AS (
    SELECT
        av.name AS pizzeria_name
    FROM (
        SELECT
            p.name,
            pv.person_id
        FROM
            person_visits pv

        JOIN
            pizzeria p ON
                pv.pizzeria_id = p.id
        ) AS av
    WHERE
        av.person_id = 2
    ),
    andrey_order AS (
        SELECT
            ao.name AS pizzeria_name
        FROM (
            SELECT
                p.name,
                po.person_id
            FROM
                person_order po

            JOIN
                menu m ON
                    po.menu_id = m.id
            JOIN
                pizzeria p ON
                    m.pizzeria_id = p.id) ao

            WHERE
                ao.person_id = 2
        )

SELECT *
FROM
    andrey_visit

EXCEPT

SELECT *
FROM
    andrey_order

ORDER BY
    pizzeria_name;