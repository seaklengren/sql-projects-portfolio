# 🏙️ Melbourne Retail Analysis  
**By:** Seakleng Ren  

## 📘 Executive Summary  
This project analyzes **1,991 order lines** for a **Melbourne-based, multi-channel retailer** using **SQL-first data analysis**.  
It uncovers how **sales channels, product categories, stores, and customer tiers** drive revenue and profitability — and where operations can improve.

### 🔍 Key Insights  
- **Online is the growth engine:** $2.77M revenue with a **34.0% margin** (highest among channels).  
- **Home & Living** leads in profitability (~$780K profit).  
- **Top stores:** Hawthorn ($521K), Sunshine ($485K), South Yarra ($453K), Preston ($451K), Camberwell (~$440K).  
- **Loyalty matters:** Platinum customers average **$4,160 average order value(AOV)** and only **4.7% return rate**.   

### 💡 Recommendations  
1. Reallocate **10–15% of marketing** budget toward Online — prioritize **Home & Living** and curated **Beauty/Electronics bundles**.  
2. **Replicate playbooks** Take the winning strategies from top-performing stores and apply them to the bottom-quartile stores, and use local promotions—special deals or ads tailored to a specific suburb or store—to attract nearby customers.
3. **Reward loyalty** with early access and express pick-up, instead of deeper discounts.  
4. **Set service-level targets:** 85% of Online orders shipped within 3 days; pilot faster-pick workflows.  
5. **Low Margin Products:** Get rid of or rethink the products that don't make much profit.  

---

## 🧭 Situation  
I joined a Melbourne-based, multi-channel retailer as a **Data Analyst**.  
The business operates across **Online Delivery**, **Click & Collect**, and **In-Store** channels.

### 🎯 Role & Responsibilities  
- Analyze and optimize **marketing strategy** and **budget allocation**.  
- Measure **product, store, and channel performance**.  
- Use data to enhance **customer experience** and **profitability**.  
- Provide **actionable insights** to improve operations.  

---

## 🧩 Objectives (SQL-Driven)
The goal is to answer **key business questions** through **SQL queries** and data storytelling.

| Area | Business Question |
|------|--------------------|
| Channel | Which channels drive the most revenue and profit? |
| Category | Which product categories deliver strong margins? |
| Store | Which locations perform best? |
| Customer | How do loyalty tiers behave? |
| Operations | Are we meeting shipping and service expectations? |

---

## 🗂️ Data Overview  

**Source:** Synthetic retail dataset (portfolio project).  
**Construction:** Randomized numerics + Excel lookups.  
**Scope:** 1,991 order lines (one product per order line).  
**Realism:** Simulates real-world multi-channel retail logic.  

| Field | Description |
|--------|-------------|
| `order_id`, `order_line_id` | Order identifiers |
| `order_date`, `ship_date` | Timeline for fulfillment |
| `customer_id`, `customer_tier` | Customer segmentation |
| `product_id`, `category`, `sub_category` | Product hierarchy |
| `store_name`, `suburb`, `state` | Store details |
| `fulfillment_channel` | Online / Pickup / In-Store |
| `quantity`, `unit_price`, `discount_rate` | Pricing and volume |
| `sales_amount`, `profit`, `margin_percent` | Performance metrics |
| `days_to_ship` | Operational efficiency |

---

## 📊 KPI Definitions  

```sql
merchandise_net = quantity × unit_price × (1 − discount_rate)
sales_amount = merchandise_net + shipping_cost
profit = sales_amount − COGS − shipping_overhead
margin_percent = profit / sales_amount × 100
days_to_ship = ship_date − order_date

Top 5 SQL Queries
1️⃣ Channel Performance
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
```
<figure>
      <img src="Project Images/Question1.jpg" alt="Risk Score Formula" width="600">
      <figcaption align="left">Figure 1: Channel Performance Output</figcaption>
  </figure>

```sql
2️⃣ Category Profitability
SELECT
  category,
  COUNT(*) AS order_line_count,
  SUM(sales_amount) AS revenue,
  SUM(profit) AS profit,
  ROUND(SUM(profit) / NULLIF(SUM(sales_amount), 0) * 100, 2) AS margin_percentage
FROM melbourne_retail
GROUP BY category
ORDER BY profit DESC;
```
<figure>
      <img src="Project Images/Question2.jpg" alt="Risk Score Formula" width="600">
      <figcaption align="left">Figure 2: Category Profitability Output</figcaption>
  </figure>

```sql 
3️⃣ Store Leaderboard (Top 5)
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
```
<figure>
      <img src="Project Images/Question3.jpg" alt="Risk Score Formula" width="600">
      <figcaption align="left">Figure 3: Store Leaderboard Output</figcaption>
</figure>

```sql
4️⃣ Customer Tier Behavior
SELECT
  customer_tier,
  COUNT(*) AS order_line_count,
  ROUND(AVG(sales_amount), 2) AS aov,
  ROUND(AVG(discount_rate) * 100, 2) AS avg_discount_percentage,
  ROUND(SUM(CASE WHEN "return" IN ('True', 'true', '1', 1) THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS return_rate_percentage
FROM melbourne_retail
GROUP BY customer_tier
ORDER BY aov DESC;
```
<figure>
      <img src="Project Images/Question4.jpg" alt="Risk Score Formula" width="600">
      <figcaption align="left">Figure 4: Customer Tier Behavior Output</figcaption>
</figure>

## ⚠️ Data & AI Assistance

- The dataset used in this project is **synthetic** and does not represent real customer or store data.  
- Product names, store locations, and order data were **generated with AI assistance** and randomized numerics to simulate realistic retail behavior.  
- Business logic (channels, shipping, returns, customer tiers, and profitability) has been designed to **closely reflect real-world multi-channel retail operations**.  
- This approach allows demonstration of **SQL analysis, KPI calculations, and actionable insights** without using sensitive real data.

### 📬 Contact  
**Seakleng Ren**  
💼 [LinkedIn](https://www.linkedin.com/in/seaklengren/)  
📧 seakleng.ren7@gmail.com  

