WITH
    who_visit AS (
        SELECT
            pv.pizzeria_id,
            pi.name AS pizzeria_name,
            p.gender
        FROM
            person_visits pv

        JOIN
            person p ON
                pv.person_id = p.id
        JOIN pizzeria pi
            ON pv.pizzeria_id = pi.id
        ),

    visit_women AS (
        SELECT *
        FROM
            who_visit wv
        WHERE
            wv.gender = 'female'
        ),

    visit_men AS (
        SELECT *
        FROM
            who_visit wv
        WHERE
            wv.gender = 'male'
        ),

    commom_visit AS (
        SELECT
            vw.pizzeria_id,
            vw.pizzeria_name
        FROM visit_women vw

        INTERSECT ALL

        SELECT vm.pizzeria_id,
               vm.pizzeria_name
        FROM
            visit_men vm
        ),

    more_women AS (
        SELECT
            vw.pizzeria_name
        FROM
            visit_women vw

        EXCEPT ALL

        SELECT
            cv.pizzeria_name
        FROM
            commom_visit cv
        ),

    more_men AS (
        SELECT
            vm.pizzeria_name
        FROM visit_men vm

        EXCEPT ALL

        SELECT
            cv.pizzeria_name
        FROM
            commom_visit cv
        )

SELECT * 
FROM
    more_women

UNION ALL

SELECT *

FROM
    more_men

ORDER BY pizzeria_name;