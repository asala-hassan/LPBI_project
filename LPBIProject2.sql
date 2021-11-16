
SELECT CONCAT('{',
                 CONCAT('"@type":', '"BlogPosting"', ','),
                 CONCAT('"name":"', post_name, '"', ','),
                 CONCAT('"author":"', display_name, '"', ','),
                 CONCAT('"datePublished":"', post_date, '"', ','),
                 CONCAT('"datemodified":"', post_modified, '"', ','),
                 ('"keywords":'),
                 ('['),
                 group_concat('"', name, '"'),
                 (']'),
                 (','),
                 ('"url":'),
                 CONCAT(
                           '"',
                           'https://pharmaceuticalintelligence.com',
                           date_format(post_date, '/%c/%e/%Y/'),
                           post_name,
                           '"'
                       ),
                 '}'
             )
FROM wp_term_relationships
    INNER JOIN wp_term_taxonomy
        ON (
               wp_term_taxonomy.term_taxonomy_id = wp_term_relationships.term_taxonomy_id
               AND wp_term_taxonomy.taxonomy = 'category'
           )
    INNER JOIN wp_terms
        ON (wp_terms.term_id = wp_term_taxonomy.term_id)
    INNER JOIN wp_posts
        ON (wp_posts.ID = wp_term_relationships.object_id)
    INNER JOIN wp_users
        ON (wp_posts.post_author = wp_users.ID)
WHERE object_id IN ( 4103, 65986 )
GROUP BY post_name;