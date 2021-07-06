SELECT p.`ID`, 
       p.`post_title`   AS coupon_code, 
       p.`post_excerpt` AS coupon_description, 
       p.`post_date` AS post_date,
       Max(CASE WHEN pm.meta_key = 'discount_type'      AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS discount_type,			-- Discount type 
       Max(CASE WHEN pm.meta_key = 'coupon_amount'      AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS coupon_amount,			-- Coupon amount 
       Max(CASE WHEN pm.meta_key = 'free_shipping'      AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS free_shipping,			-- Allow free shipping 
       Max(CASE WHEN pm.meta_key = 'expiry_date'        AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS expiry_date,				-- Coupon expiry date 
       Max(CASE WHEN pm.meta_key = 'minimum_amount'     AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS minimum_amount,			-- Minimum spend 
       Max(CASE WHEN pm.meta_key = 'maximum_amount'     AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS maximum_amount,			-- Maximum spend 
       Max(CASE WHEN pm.meta_key = 'individual_use'     AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS individual_use,			-- Individual use only 
       Max(CASE WHEN pm.meta_key = 'exclude_sale_items' AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS exclude_sale_items,			-- Exclude sale items 
       Max(CASE WHEN pm.meta_key = 'product_ids' 	AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS product_ids,				-- Products 
       Max(CASE WHEN pm.meta_key = 'exclude_product_ids'AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS exclude_product_ids, 		-- Exclude products 
       Max(CASE WHEN pm.meta_key = 'product_categories' AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS product_categories, 			-- Product categories 
       Max(CASE WHEN pm.meta_key = 'exclude_product_categories' AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS exclude_product_categories,-- Exclude Product categories 
       Max(CASE WHEN pm.meta_key = 'customer_email'     AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS customer_email,			-- Email restrictions 
       Max(CASE WHEN pm.meta_key = 'usage_limit' 	AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS usage_limit,				-- Usage limit per coupon 
       Max(CASE WHEN pm.meta_key = 'usage_limit_per_user' 	AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS usage_limit_per_user,	-- Usage limit per user 
       Max(CASE WHEN pm.meta_key = 'usage_count' 	AND  p.`ID` = pm.`post_id` THEN pm.`meta_value` END) AS total_usaged 			       -- Usage count 
FROM   `wp_posts` AS p 
       INNER JOIN `wp_postmeta` AS pm ON  p.`ID` = pm.`post_id` 
WHERE  p.`post_type` = 'shop_coupon' 
       AND p.`post_status` = 'publish' 
GROUP  BY p.`ID` 
ORDER  BY p.`ID` DESC;