SELECT
    FARM_FINGERPRINT(
        CONCAT(
            COALESCE(CAST(id AS STRING),''),
            COALESCE(CAST(creation_date AS STRING),''),
            COALESCE(CAST(owner_user_id AS STRING),'')
        )
    ) as post_question_pk,
    CAST(id AS INTEGER) AS post_question_id,
    CAST(title AS STRING) AS post_question_title,
    CAST(body AS STRING) AS post_question_body,
    CAST(accepted_answer_id AS INTEGER) AS accepted_answer_id,
    CAST(answer_count AS INTEGER) AS answer_count,
    CAST(comment_count AS INTEGER) AS comment_count,
    CAST(community_owned_date AS TIMESTAMP) AS community_owned_date,
    CAST(favorite_count AS INTEGER) AS favorite_count,
    CAST(last_editor_display_name AS STRING) AS last_editor_display_name,
    CAST(last_editor_user_id AS INTEGER) AS last_editor_user_id,
    CAST(owner_display_name AS STRING) AS owner_display_name,
    CAST(owner_user_id AS INTEGER) AS owner_user_id,
    CAST(parent_id AS STRING) AS parent_id,
    CAST(post_type_id AS INTEGER) AS post_type_id,
    CAST(score AS INTEGER) AS score,
    CAST(tags AS STRING) AS tags,
    SPLIT(tags,"|") AS tags_array,
    CAST(view_count AS INTEGER) AS view_count,
    CAST(last_activity_date AS TIMESTAMP) AS last_activity_at,
    CAST(last_edit_date AS TIMESTAMP) AS last_edited_at,
    CAST(creation_date AS TIMESTAMP) AS created_at,
    CAST(CURRENT_TIMESTAMP() AS TIMESTAMP) AS source_partition_timestamp

FROM {{ source('0_stackoverflow','posts_questions') }}