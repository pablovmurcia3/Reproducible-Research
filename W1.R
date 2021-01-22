################################################################################
                                     # Week 1 #
################################################################################


### Cocepts and ideas 

# Replication: the ultimate standard for strengthening scientific evidence

# Problem: Challenging -- Big studies, no money, really unique study


# Solution: Reproducibility!!! is the minimun standard
# Make the DATA and the CODE available 
# Validation of the data analysis 


#Justification: new technologies, computing power


# What do we need?
        
# * Analytic data are available (Not the raw data)
# * Analitic code are available (the code that is applied to the analytic data)
# * Documentation od code and data
# * Standard means of distribution 


# Challenges ....

# Tool: Literate (Statistical) Programming
# Article is a steam of text and code 
# It can be weaved to produce human-readable documents and tangled to produce
# Machine-Readable documents

# 1. A documentation Language (Human readable)
# 2. A programming language (Machine-Readable)

# Sweave uses latex and r!
# but it have faults

# Knir! better tan Sweave. 
# It doesnt restrict to latex as the documentation language. It can use Markdown

### Scripting your Analysis#################################################

## Golden rule of reproducibility: Script everything
# The score of the data analysis

###### KNIR! better tan Sweave. ################################################

# It doesnt restrict to latex as the documentation language. It can use Markdown

### Scripting your Analysis ####################################################

########### Golden rule of reproducibility: Script everything ##################

# The score of the data analysis

################################################################################
###################### Structure of a Data Analysis ############################
################################################################################


# 1. Defining the question

# defining a question is the most powerful dimension reduction tool you can ever
# employ


# 2. Defining the ideal dataset

# 3. Determining what data you can access

# 4. Obtaining the data

# an example 
install.packages("kernlab")
library(kernlab)
data(spam)

str(spam)

# 5. Cleaning the data


# an example - in this case the data is already clean
# Perform the subsampling - one to train the model and another to test it
set.seed(3435)
trainIndicator <- rbinom(4601, size = 1, prob = 0.5)
table(trainIndicator)

trainSpam <- spam[trainIndicator == 1, ]
testSpam <- spam[trainIndicator == 0, ]


# 6. Exploratory data analysis

names(trainSpam)
head(trainSpam)

table(trainSpam$type)

boxplot(capitalAve ~ type, data = trainSpam)

boxplot(log10(capitalAve + 1) ~ type, data = trainSpam)

pairs(log10(trainSpam[, 1:4] + 1))

hCluster = hclust(dist((trainSpam[, 1:57])))
plot(hCluster)

hClusterUpdated = hclust(dist(t(log10(trainSpam[, 1:55] + 1))))
plot(hClusterUpdated)

# Statistical Modeling

trainSpam$numType <- as.numeric(trainSpam$type) - 1
costFunction <- function(x, y) sum(x != (y > 0.5))
cvError = rep(NA, 55)
library(boot)
for (i in 1:55) { 
        lmFormula = reformulate(names(trainSpam)[i], response= "numType") # creates a fomula type numType ~ address
        glmFit = glm(lmFormula, family = "binomial", data = trainSpam)
        cvError[i] = cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]  # Check later
}
## Which predictor has minimum cross-validated error?
names(trainSpam)[which.min(cvError)]


lmFormula = reformulate(names(trainSpam)[53], response= "numType")
glmFit = glm(lmFormula, family = "binomial", data = trainSpam)

cvErrorpr = cv.glm(trainSpam, glmFit, costFunction, 2)$delta[2]



## Use the best model from the group
predictionModel = glm(numType ~ charDollar, family = "binomial", data = trainSpam)
## Get predictions on the test set
predictionTest = predict(predictionModel, testSpam) 
predictedSpam = rep("nonspam", dim(testSpam)[1])
## Classify as `spam' for those with prob > 0.5
predictedSpam[predictionTest > 0.5] = "spam"

table(testSpam$type)
table(predictedSpam)
table(predictedSpam, testSpam$type)
## Error rate
(460 + 46)/(1361 + 460 + 46 + 447)

# Interpreting Results

# we might think of stating that the fraction of characters that
# are dollar signs can be used to predict if an email is spam


# Challenge Results

# Synthesizing Results

# Reproducible Code

############################################################################
      # Organizing a Data Analysis #
############################################################################

## FILES
# Data (Raw data and processed)
# Figures (Exploratory, Final figures)
# R code (raw, final. R markdown)
# Text (README files. Text-Report)

# 1. Raw Data

# should be stored
# PUt info (web, url, description) in the README
# you can add the data en github

# 2. Processed Data

# should be named so it is ease to see which scrip generated the data
# It should be tudy 

# 3. Exploratory Figures

# no pretty, useful

# 4. Final Figure

# 5. Raw scripts 

# not necessary with comments

# 6. Final Scripts

# With comments, details

# 7. R markdown files

# summarize part of the analysis (text, and R)

# 8. README

# Not necessary if you use R markdown
# should contain step-by-step of analysis

# Text of the document




