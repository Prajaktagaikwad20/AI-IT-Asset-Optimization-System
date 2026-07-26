# AI-Based IT Asset Optimization and Predictive Maintenance System

## 1. Project Overview

The AI-Based IT Asset Optimization and Predictive Maintenance System is an end-to-end data-driven solution developed to improve IT asset management and maintenance decision-making.

The system uses a relational SQL database to manage organizational IT assets, Python-based analytics for visualization, and a machine learning model to predict asset risk levels based on maintenance history and asset characteristics.

The objective is to help organizations identify high-risk assets, optimize maintenance activities, and make data-driven replacement decisions.

---

## 2. Problem Statement

Organizations manage a large number of IT assets including laptops, desktops, servers, and software licenses. Manual tracking of asset allocation, maintenance records, repair costs, and replacement requirements can lead to inefficient resource utilization.

This project addresses the challenge by developing a centralized system that:

- Maintains structured IT asset records
- Tracks asset assignments and maintenance history
- Analyzes repair trends and costs
- Predicts asset risk for proactive maintenance planning

---

## 3. Proposed Solution

The project is divided into three major components:

### 3.1 Database Management System

A relational database is designed using SQL to store and manage:

- Employee information
- Department details
- IT asset inventory
- Asset assignment records
- Maintenance history
- Software license information
- Support ticket details

SQL queries are used to generate analytical insights related to asset utilization, maintenance cost, and operational efficiency.

---

### 3.2 Data Analytics Dashboard

A Python-based visualization dashboard is developed to represent important business insights, including:

- Asset status distribution
- Maintenance cost analysis
- Support ticket analysis
- Software license utilization

The dashboard helps users understand asset performance and maintenance requirements through visual reports.

---

### 3.3 Predictive Maintenance Model

A machine learning model is developed to classify IT assets based on their maintenance risk.

The model uses the following input parameters:

- Asset age
- Number of repairs
- Maintenance cost
- Asset value

The output predicts:

- Low Risk
- Medium Risk
- High Risk

Algorithm Used:

- Decision Tree Classifier

---

## 4. System Architecture
SQL Database
|
|
Data Extraction
|
|
Python Analytics
|
|
Machine Learning Model
|
|
Risk Prediction & Dashboard

---

## 5. Technologies Used

### Database
- MySQL
- SQL

### Programming Language
- Python

### Data Analysis and Visualization
- Pandas
- Matplotlib

### Machine Learning
- Scikit-learn
- Decision Tree Classifier

### Development Environment
- Google Colab
- GitHub

---

## 6. Database Design

The database contains the following tables:

- Departments
- Employees
- IT Assets
- Asset Assignments
- Maintenance Records
- Software Licenses
- Support Tickets

The database follows relational database principles with proper relationships between entities.

---

## 7. Machine Learning Workflow

The ML pipeline consists of:

1. Data Collection
2. Feature Selection
3. Data Preprocessing
4. Model Training
5. Risk Prediction

Input Features:
Asset Age
Repair Count
Maintenance Cost
Asset Value


Output:


Asset Risk Category


---

## 8. Project Features

- Relational database design for IT asset management
- Advanced SQL queries for data analysis
- Maintenance cost evaluation
- Asset utilization tracking
- Interactive data visualization
- Predictive maintenance risk classification

---

## 9. Project Structure


AI_IT_Asset_Optimization_System

│
├── IT_Asset_Optimization.sql
│
├── Dashboard
│ ├── IT_Asset_Dashboard.ipynb
│ └── IT_Asset_Dashboard.png
│
├── AI_Model
│ ├── Asset_Risk_Prediction_AI.ipynb
│ └── asset_risk_model.pkl
│
└── README.md


---

## 10. Future Enhancements

- Development of a web-based monitoring application
- Real-time asset tracking
- Automated maintenance notifications
- Integration with cloud databases
- Advanced machine learning models for improved prediction accuracy

---

## 11. Conclusion

This project demonstrates the integration of database management, data analytics, visualization, and machine learning to solve a real-world IT asset management problem.

The system enables organizations to move from reactive maintenance to proactive decision-making using data-driven insights.

---

## Author

AI & Data Science Undergraduate