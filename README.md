# Data Driven Auto - Portfolio Project

### Table of Contents
- [Project Background](#project-background)
- [Data Structure & Initial Checks](#data-structure--initial-checks)
- [Executive Summary](#executive-summary)
	- [Overview of Findings](#overview-of-findings)
- [Insights Deep Dive](#insights-deep-dive)
	- [Vehicle Profitability Factors](#vehicle-profitability-factors)
	- [Competitive Landscape](#competitive-landscape)
	- [Sales Trends](#sales-trends)
	- [Regional Comparisons](#regional-comparisons)
- [Recommendations](#recommendations)
- [Assumptions and Caveats](#assumptions-and-caveats)

# Project Background

Data Driven Auto (DDA), established in 2010, has become a leading US-based auto dealer, renowned for offering a wide variety of vehicles that cater to consumer needs nationwide.

Currently focused on expansion, DDA plans to harness its data on used car market sales and competitor activities to further growth in the coming years. This project aims to comprehensively analyze and synthesize the available data to uncover key insights that will support strategic decisions-making to realize growth goals.

Insights and recommendations are provided on the following key areas:

- **Vehicle Profitability Factors:** Analysis of auto sales transactions to identify factors—such as make, model, and condition—that influence profit margins.

- **Competitive Landscape:** Examination of competitor transactions and volumes to better understand market share dynamics.

- **Sales Trends:** Assessment of historical sales patterns to identify any seasonal trends.

- **Regional Comparisons:** Evaluation of regional market sizes and performance.


# Data Structure & Initial Checks

Data Driven Auto's database initially consisted of one sheet containing auto sales data from 2015-2018 with a total row count of 558,838. For better performance, flexibility, and future scalability, the dataset was divided into three tables: cars, sales, and geo_lookup.

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/ERD.png)

Before diving into the analysis, various checks were conducted for quality control and familiarization with the datasets. The SQL queries used to inspect and clean the data for this analysis, along with comments outlining the queries, can be found [here](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/CarSales_Queries.sql).

# Executive Summary

### Overview of Findings

Several factors significantly impact profitability. For instance, vehicle make and model are crucial, with Nissan leading the pack at an impressive average profit margin of 7.71% compared to the national average of 5.82%. Regionally, the Western states boast an above-average profit margin of 7.57%. Seasonal trends are similarly evident, with the highest transaction volumes occurring during summer and holiday months. The subsequent sections will delve deeper into these insights and explore additional factors driving profit and growth opportunities in the current market.

Below is an overview page from the Tableau dashboard and additional examples are included throughout the report. The entire interactive dashboard can be viewed [here](https://public.tableau.com/app/profile/emmanuel.cohen/viz/DataDrivenAuto/Dashboard-Make).

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/Dashboard.png)



# Insights Deep Dive
### Vehicle Profitability Factors

* **Nissan is the top-performing make nationwide with an average profit margin of 7.71%** and a substantial sales volume of 52,772 units from 2015-2018. Hyundai follows closely with a 7.31% profit margin, however this is paired with only 40% of the sales volume of Nissan at 21,098 units.
  
* With respect to specific models, **Nissan Altima & Maxima and Hyundai Elantra & Sonata lead the way with an average profit of 7.60% across these four models.** This profit margin is **37% higher than the national average** of 5.53% when excluding these brands.

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/Make_Header.png)
![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/Make_Chart.png)

* **Vehicle condition is highly correlated to profitability**, with ratings over 25 generally yielding favorable margins. This trend continues up to the best condition rating (50), though the effect plateaus at the highest levels, between 40-50.

<p align="center">
  <img src="https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/Condition.png" />
</p>

### Competitive Landscape

* **Nissan-Infiniti LT continues to be near the top end of sellers with a high profit margin of 10.65%** on their vehicles, paired with a high sales volume of 29,631 units.
  
* Hyundai Motor Finance, though slightly higher margins at 11.91% on average, has a lower sales volume at 6,657.

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/Seller.png)

### Sales Trends

* Despite month-over-month variability in sales, **summer and holiday months consistently have the highest transaction volume** and exhibit persistent trends in a year-over-year analysis. January, March and October tend to underperform.
* Recent years have shown **consistent growth in December**, with increases of 21% in 2017 and 34% in 2018.

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/Sales_Trends.png)


### Regional Comparisons

* The **Western region demonstrates the highest profitability** with an average profit margin of 7.57%, which is **30% higher than the national average** profit margin of 5.82%.
  
* Within the Western region, New Mexico and Washington exhibit the highest profit margins, with New Mexico achieving an impressive 15.8% and Washington attaining 11.5%. It’s noteworthy that these states have relatively low transaction volumes, with New Mexico recording only 179 transactions and Washington 7,117 transactions.
  
* California presents a robust performance with an average profit margin of 8% while also maintaining a substantial volume of sales, totaling 69,636 transactions.
  
* The **Northeast region is identified as the least profitable**, with an average profit margin of 3.49%.

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/West.png)


# Recommendations

Based on the insights and findings above, the following recommendations should be considered when evaluating growth opportunities: 

* **Emphasize High-Margin Brands:** Nissan and Hyundai consistently achieving robust profit margins across various regions at an average of 7.71% and 7.31% respectively compared to the national average of 5.82%.
  
* **Prioritize High-Condition Vehicles:** Concentrate on acquiring and selling vehicles in excellent condition, as these yield the highest profit margins.
  
* **Explore Western States:** Investigate opportunities in Western states, especially California, which boasts a large market and strong profit margins.
  
* **Strategic Acquisitions:** Consider two potential directions depending on the desired scale of the acquisition:
	* For larger acquisitions prioritizing high sales volume and robust profit margins, Nissan stands out as a prime candidate.
	* For smaller strategic mergers, Hyundai Motor Finance presents an attractive option with the highest profit margins nationwide and a manageable scale. Hyundai ranks #1 in profitability nationwide and #2 in the Western states, including California.
   
* **Optimal Launch Timings:** Aim to launch new locations in April or early November to capitalize on the seasonal surge in demand during summer and holiday months.
  


# Assumptions and Caveats

Throughout the analysis, multiple assumptions were made to address data challenges. The key assumptions and caveats are outlined below:

* This dataset does not encompass the entire United States and is therefore incomplete. Some states were entirely missing, while others had low recorded sales volumes.
  
* Profit Margin %, a key metric in this analysis, was calculated by comparing the selling price to the estimated market value. This approach helped normalize profit margins across different makes, models, and sellers. However, it did not account for other factors that could impact net profits, such as transaction costs, state taxes, etc.
  
* During the data cleaning phase, approximately 2% of the data contained missing or nonsensical values and were removed. Although this represents a small portion of the overall dataset, it is possible that these omissions could have impacted some of the values presented above.
