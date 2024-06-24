# Signup-Flow-Optimization

To interact with tableau dashboard please use the below link:
https://public.tableau.com/app/profile/shrajan.kumar/viz/shared/N7XFWK5Z8

Complete Documentation of the project is available in pdf attached in this repo else you can also read it here https://medium.com/@shrajankumar45/signup-flow-optimization-49dc3fe34320.

Sql querry for retrieving data required for analysis are availbale in 3 different sql file attached in this repo.

## What is a signup flow?
A signup flow, also known as a registration flow, is the series of steps a user goes
through when creating an account on a website or app. It typically includes
components such as a registration form, captcha or security measures, email
verification, and welcome screens or an onboarding process.

## Why and how to optimize registration process in e-business.
Registration is the last step a potential customer takes before starting to interact with the content of your web page. First, you allow them to browse without signing up to attract them and let them get to know your website. It is virtually the entry to your product. Having a robust signup flow gives you the chance to make a good impression and acquire users. Now, coming to the optimization part, a good signup process will involve a simple, fast, intuitive, and straightforward process that allows visitors to convert into registered users with minimal time and effort. Flows like these give people the chance to engage with the product right away without spending too much time providing personal information. Now how do you optimize the signup flow? One option is to ensure visitors complete as few steps as possible to register. For instance, instead of asking for a phone number, only ask for an email and password. Provide options like social media or Google for registration, in addition to phone number. Automate as many steps as possible, such as auto filling the pin code based on location.

## Get to know about website and current registration process.
In this case study, we will explore Learner-Point’s current signup and login situation and identify possible areas for improvement.
Before diving in, let’s take a brief tour of the webpage. Learner-Point is an online learning platform providing technical education courses. Its functionality includes lessons, quizzes, exercises, exams, CourseNotes, gamified features, and news feeds. 
The registration process is free and requires no debit card or payment method, but to have complete access to all features, one needs a paid account.

### Web page provides following ways to sign up
1. Email ID with name and password
2. Social accounts such as Google, Facebook, LinkedIn

## Case Study
In this case study, we mainly focus on the following topics:
1. Visitors to registered conversion rate
2. Device and OS used
3. Preferred sign up and login methods
4. Error messages (Errors preventing users from logging in and signing up) and many other details.

Now to understand the whole process one should know the people involved in platform.
We have mainly three groups
1. Visitor
2. User
3. Customer
When one first visits website he/she referred as visitor (The person has engaged with content but not signed up yet) after Sign up completion visitor becomes user.

Now User is of two types Free and Paid. When users subscribe to paid content, they become customers and gain access to premium content.
The universal goal is to convert website visitors into paid customers. A key aspect of achieving this is improving the signup flow because the entire cycle begins with sign-up. Otherwise, we risk losing potential customers.
Major KPI used in the analysis are signup success rate and visitor to registered
conversion rate.
Signup Success Rate = Successful outcomes / Total number of attempts
Visitor to Registered Conversion Rate = Successful sign-up attempts / Total number of visitors
Now how do you evaluate this metric? well you can compare it with industrybenchmarks. However, it is not that easy to compare because a few factors may affect the results. For example, the amount of personal information required can vary; some websites require debit card details for account creation.
In our case for online course platform average conversion rate is 2%.

What Does Conversion Rate Tell Us?

The conversion rate tells us how effective a page is in convincing visitors to take
a specific action. If the rate is lower than industry standards, look for issues in
the sign up process or user interface.


## Getting to know the Data Base
![5](https://github.com/ShrajanKumar/Signup-Flow-Optimization/assets/138092818/d4e0fb2d-a51d-4fd2-beb7-1f13cf055e23)

Visitors
 1. visitors id : id given to visitor
 2. user id : id given to visitor when they signup (it can be null if visitor has never signed up)
 3. first visit date : date when user/visitor visited our website for the first time

Students
1. date registered : Date when user has signed up to our website

Actions
1. error id : id of error message appeared while performing specific action
2. action date : date when action performed
3. action name : name of action performed (sign in, sign up)

Error Messages
1. error id : id of error message appeared while performing specific action
2. error text : error appeared

Student Purchases
1. purchase date : date when user purchased paid course or paid service

Sessions
1. session id : id given of session
2. session os : OS used in session
3. session date : date of session recorded

## Analysis Report
1. Sign-up failed attempts are significantly higher on mobile devices (3.24%) compared to desktop devices (1.16%).
2. Sign-up failed attempts by OS show that the most failed attempts occurred on Android (2,309), while Android also had the most successful retries (4,077).
3. Google is the most favored sign-up choice with the lowest fail rate (3.2%).
4. The email sign-up demonstrates a significant fail rate (6.2%).
5. Facebook is a less popular sign-up choice with a significant fail rate (7.6%).
6. LinkedIn has a comparable number of sign-up attempts as Facebook but a lower fail rate.
7. Frequent email sign-up issues on mobile devices include a total of 1,508 fails, with 1,273 of these occurring on mobile devices.
8. Visitors struggle to input the required data on their mobile screens. 85% of the email errors are related to entering email information.
9. 778 users close the Google pop-up window prematurely (external factor).
10. 349 Facebook errors are unknown.
11. Sign-up success rates: Google at 91%, LinkedIn at 87%, Facebook at 69%, and email at 65%. Additionally, the email login fail rate is 25%
12. Login errors include 40,454 instances of invalid email or password, making it the most received error. Out of 13,135 Google errors, 11,598 occurred on Windows or Android. Additionally, 11,460 of the error messages from Windows or Android indicate that the popup was closed by the user, suggesting a potential external issue.


## Actionable Insights
Previous signup / login window
![2](https://github.com/ShrajanKumar/Signup-Flow-Optimization/assets/138092818/48a2bef2-9355-4106-b173-ca5fc2db3a90)

Below is the suggested design image emphasizing social media sign-up options.
![suggestion](https://github.com/ShrajanKumar/Signup-Flow-Optimization/assets/138092818/9ef316c1-4515-4dff-867d-5a990c736a6b)
1. Simplify the email sign-up option.
2. Minimize the password requirements for email registration.
3. Simplify the password restoration process.
4. Investigate the ‘unknown’ error for Facebook sign-up.

