SELECT
  fulfillment_channel,
  COUNT(*) AS order_line_count,
  COUNT(DISTINCT order_id) AS unique_order_count,
  SUM(quantity) AS units_sold,
  SUM(sales_amount) AS revenue,
  SUM(profit) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales_amount), 0) * 100, 2) AS margin_percent
FROM melbourne_retail
GROUP BY fulfillment_channel
ORDER BY revenue DESC;
-- ---
-- 2. Category Profitability
SELECT
  category,
  COUNT(*) AS order_line_count,
  SUM(sales_amount) AS revenue,
  SUM(profit) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales_amount), 0) * 100, 2) AS margin_percentage
FROM melbourne_retail
GROUP BY category
ORDER BY profit DESC;

-- 3️. Store Leaderboard (Top 5)
SELECT
  store_name,
  suburb,
  SUM(sales_amount) AS revenue,
  SUM(profit) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales_amount), 0) * 100, 2) AS margin_percentage
FROM melbourne_retail
GROUP BY store_name, suburb
ORDER BY revenue DESC
LIMIT 5;
-- 4️. Customer Tier Behavior
SELECT
  customer_tier,
  COUNT(*) AS order_line_count,
  ROUND(AVG(sales_amount), 2) AS aov,
  ROUND(AVG(discount_rate) * 100, 2) AS avg_discount_percentage,
  ROUND(SUM(CASE WHEN "return" IN ('True', 'true', '1', 1) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM melbourne_retail
GROUP BY customer_tier
ORDER BY aov DESC;

