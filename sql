# a sql express for trans data from two table to one table
INSERT INTO ex_user_partner_bind SELECT
	id,user_id, 1 partner_id,
id partner_user_id,
 now() create_time,
 now() update_time,
 '2018-01-01' expire_time,
 nickname
FROM
	(
		SELECT
			t2.id id,
			t1.id user_id,
			t1.nickname
		FROM
			(
				SELECT
					username,
					nickname,
					id
				FROM
					ex_user
				WHERE
					username >= 14400000000
				AND username < 14400001000
			) t1
		INNER JOIN (
			SELECT
				username,
				id
			FROM
				db_jjb.jjb_basic_user
			WHERE
				username >= 14400000000
			AND username < 14400001000
		) t2 ON t2.username = t1.username
	) t
