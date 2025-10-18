# Air Quality SQL Project

## Overview
This project focuses on **analyzing air pollution data using SQL**.  
It aims to explore how different air pollutants — such as **CO**, **NO₂**, and **O₃** — vary with **temperature** and **humidity** over time.  
By using SQL queries, key patterns and trends in air quality were extracted efficiently from the dataset.

## Objectives
- Analyze air pollution levels using structured queries.  
- Identify correlations between pollutants and meteorological factors.  
- Summarize key trends in air quality over time.  
- Provide insights that can help in understanding environmental health impacts.

## Tools & Technologies Used
- **SQL** for querying and analyzing the dataset.  
- **Excel** for preliminary exploration and visualization (optional).  
- **Presentation tools** for communicating insights effectively.  

## Dataset Description
The dataset contains real-world air quality measurements with the following key columns:
| Column                   | Type       | Description                                                   |
|---------------------------|------------|---------------------------------------------------------------|
| `ID`                        | Integer    | Unique record ID (1–10000)                                   |
| `Age`                       | Integer    | Age of participant (18–80 years)                             |
| `Gender`                    | Categorical| Male, Female, Other                                          |
| `Country`                   | Categorical| Country of residence (20 countries)                          |
| `Coffee_Intake`             | Float      | Daily coffee consumption in cups (0–10)                      |
| `Caffeine_mg`               | Float      | Estimated daily caffeine intake in mg (1 cup ≈ 95 mg)        |
| `Sleep_Hours`               | Float      | Average hours of sleep per night (3–10 hours)                |
| `Sleep_Quality`             | Categorical| Poor, Fair, Good, Excellent (based on sleep hours)           |
| `BMI`                       | Float      | Body Mass Index (15–40)                                      |
| `Heart_Rate`                | Integer    | Resting heart rate (50–110 bpm)                              |
| `Stress_Level`              | Categorical| Low, Medium, High (based on sleep hours and lifestyle)       |
| `Physical_Activity_Hours`   | Float      | Weekly physical activity (0–15 hours)                        |
| `Health_Issues`             | Categorical| None, Mild, Moderate, Severe (based on age, BMI, and sleep)  |
| `Occupation`                | Categorical| Office, Healthcare, Student, Service, Other                  |
| `Smoking`                   | Boolean    | 0 = No, 1 = Yes                                              |
| `Alcohol_Consumption`       | Boolean    | 0 = No, 1 = Yes                                              |

## SQL Techniques Used
During the analysis, several SQL operations were used, including:
- **SELECT** for data extraction.  
- **WHERE** for filtering records.  
- **GROUP BY** and **HAVING** for summarizing results.  
- **ORDER BY** for sorting data.  
- **Aggregate functions** like `AVG()`, `MAX()`, and `MIN()` for statistical analysis.  
- **JOINs** to combine multiple data sources when needed.  

These queries helped generate meaningful insights about air quality trends and pollutant behavior.
