# Data Driven Auto - Portfolio Project



# Project Background

Data Driven Auto (DDA), established in 2010, has become a leading US-based auto dealer, renowned for offering a wide variety of vehicles to cater to divers consumer needs nationwide.

Currently focused on expansion, DDA plans to harness its vast data on used car market sales and competitor activities to further growth in the coming years. This project aims to comprehensively analyze and synthesize the available data to uncover key insights that will support strategic decisions-making to realize growth goals.

Insights and recommendations are provided on the following key areas:

- **Vehicle Profitability Factors:** Analysis of auto sales transactions to identify factors—such as make, model, and condition—that influence profit margins.

- **Competitive Landscape:** Examination of competitor transactions and volumes to better understand market share dynamics.

- **Sales Trends:** Assessment of historical sales patterns to spot any seasonal trends.

- **Regional Comparisons:** Evaluation of regional market sizes and performance.


# Data Structure & Initial Checks

Data Driven Auto's database initially consisted of one sheet containing auto sales data from 2015-2018 with a total row count of 558,838. For better performance, flexibility, and future scalability, the dataset was divided into three tables: cars, sales, and geo_lookup.

![](https://github.com/CohenEmmanuel/Data-Driven-Auto-Portfolio-Project/blob/main/assets/img/ERD.png)

Before diving into the analysis, various checks were conducted for quality control and familiarization with the datasets. The SQL queries used to inspect and clean the data for this analysis can be found here [link].

# Executive Summary

### Overview of Findings

Several factors significantly impact profitability. For instance, vehicle make and model are crucial, with Nissan leading the pack at an impressive average profit margin of 7.71%, compared to the national average of 5.82%. Regionally, the Western states boast an above-average profit margin of 7.57%. Seasonal trends are similarly evident, with the highest transaction volumes occurring during summer and holiday months. The subsequent sections will delve deeper into these insights and explore additional factors driving profit and growth opportunities in the current market.

Below is an overview page from the Tableau dashboard and additional examples are included throughout the report. The entire interactive dashboard can be viewed here [https://public.tableau.com/app/profile/emmanuel.cohen/viz/DataDrivenAuto/Dashboard-Make].

[Visualization, including a graph of overall trends or snapshot of a dashboard]



# Insights Deep Dive
### Category 1:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 1]


### Category 2:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 2]


### Category 3:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 3]


### Category 4:

* **Main insight 1.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 2.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 3.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.
  
* **Main insight 4.** More detail about the supporting analysis about this insight, including time frames, quantitative values, and observations about trends.

[Visualization specific to category 4]



# Recommendations:

Based on the insights and findings above, we would recommend the [stakeholder team] to consider the following: 

* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  
* Specific observation that is related to a recommended action. **Recommendation or general guidance based on this observation.**
  


# Assumptions and Caveats:

Throughout the analysis, multiple assumptions were made to manage challenges with the data. These assumptions and caveats are noted below:

* Assumption 1 (ex: missing country records were for customers based in the US, and were re-coded to be US citizens)
  
* Assumption 1 (ex: data for December 2021 was missing - this was imputed using a combination of historical trends and December 2020 data)
  
* Assumption 1 (ex: because 3% of the refund date column contained non-sensical dates, these were excluded from the analysis)
