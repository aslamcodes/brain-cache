---
tags:
type:
date: 2025-12-11
done: false
---
A Shift from Rule based Systems with input and output to be consistent towards ML systems. These systems doesn't require rules, as they are probabilistic, based on patterns, public datasets.

**AI** in general is whatever systems that's built to assist human effort, it even includes basic calculators, rule based systems to self driving cars and robotic automations

**Machine Learning** - Enable computers to learn from data patterns through various algorithms, decision trees, vector machine, clustering. Usage includes spam detection, fraud detections, predictive maintenance. Ideal for simple predictive analysis, such as "will this person buy this"

**Deep learning** - Learn representation of data across various level of abstractions. Suited for large scale system that requires precise predictions.

# Inferencing
The process of trained AI systems that is making predictions or classification based on the input

real time inferencing - chatbots, emails, autonomous driving systems. **AWS Sage Maker*** provides endpoints for deploying models, that performs real ṇime inferencing

batch inferencing - Sentiment analysing where real time analysis isn't required. **AWS Sage Maker** transforms jobs for applying models for datasets in S3

# Data Types in AI
## Numerical
AWS SageMaker provides us with various integrations for S3 and Redshift to integrate and process data. Numerical data - often integers, floating point numbers - represents mostly on machine learning models where regression analysis is performed to make a prediction
## Categorical
With techniques such as [[one hot encoding]], [[label encoding]] data can be transformed into numberical categories, as AI models are not gonna handle it itself
## unstructured (Text, Images)
Unstructured data often require a lot of complex pattern matching to convert as they have lack of predefined models.

High quality pre-processed data produces better performance

Things like book and conversations need to be pre-processed with techniques like tokenisation and [[stop word removal]] which prepares text data for model training. so it can get to NLP model and sentimental analysis.

As for image data, pre processing techinques such as normalisation, augmentation for preprocessing prepares the data for NLP models. **AWS Rekognition** the service for working with image data

As for audio data which is unlike text and image data which are monotonic, audio data has variying ambiguity. **AWS Transcribe** is the service that performs operations on audio data

# Data Preprocessing
A clean structured data means accurate and performant models. So raw data are to be processed with various processes such as encoding, scaling and cleaning. 

# Labelled vs Unlabelled
Supervised learning will use labelled data for training. Great for tasks like classification
Unsupervised learning will use unlableled data for training
# Time series data
> Data over time

Tools like **AWS Forecast** will use [forecasting algorithms](https://docs.aws.amazon.com/forecast/latest/dg/aws-forecast-recipe-prophet.html) on top of timeseries data to make predictions

