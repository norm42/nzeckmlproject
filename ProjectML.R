## Machine learning project
## Norm Zeck
## 

setwd("C:/Users/us00r24n/Desktop/WorkFolders/Work-2014/MLCourse/Project/")
library(caret)
library(AppliedPredictiveModeling)
library(Hmisc)
library(ggplot2)
## install.packages( "e1071" )  not needed now - missing in older version of R
library(e1071)
library(rattle)
library(rpart.plot)
library(pgmm)
library(ElemStatLearn)
library(randomForest)


##
##  read in the training set.  Only select
##  variables of interest
train <- read.csv("pml-training.csv")
baseHAR <- train[,c(8,9,10,11,37,38,39,40,41,42,43,44,45,46,47,48,49,60,61,62,63,64,65,66,67,68,84,85,86,102,113,114,115,116,117,118,119,120,121,122,123,124,140,151,152,153,154,155,156,157,158,159,160
)]

##  Split the training set into train/test 75%/25%
intrainHAR <- createDataPartition(y=baseHAR$classe, p=0.75, list=FALSE)
trainHAR <- baseHAR[intrainHAR,]
testHAR <- baseHAR[-intrainHAR,]


## set seed for consistency
set.seed(33833)

## set control to enable cross validation.  
tctl = trainControl(method = "cv", number = 13, allowParallel=TRUE)
##  I tried Recursive Partitioning and Regression Trees (rpart) but this did not give 
## good results.  Random forrest worked very well.
## mf2 = train(classe ~ ., method = "rpart", data = trainHAR, trControl = tctl)
mf2 = train(classe ~ ., method = "rf", data = trainHAR, trControl = tctl)
##
##  See how well we do on the training set
##
trainclasse <- predict(mf2, trainHAR)
train.rf.cm <- confusionMatrix(trainclasse, trainHAR$classe)

## use train predictor for test set
##testclasse <- predict(mf2, testHAR)
testclasse <- predict(mf2, newdata=testHAR)
test.rf.cm <- confusionMatrix(testclasse, testHAR$classe)

impvars <- varImp(mf2, surrogates = FALSE, competes = TRUE)

## read in the submission test set
## select only the variable we use
pmltest <- read.csv("pml-testing.csv")
pmlHAR <- pmltest[,c(8,9,10,11,37,38,39,40,41,42,43,44,45,46,47,48,49,60,61,62,63,64,65,66,67,68,84,85,86,102,113,114,115,116,117,118,119,120,121,122,123,124,140,151,152,153,154,155,156,157,158,159
)]
## use predictor on the submission test set
pmlproblem <- predict(mf2, pmlHAR)

## manually ran pml_write files to generate the solution
##  B A B A A E D B A A B C B A E E A B B B  this was 100% correct
##
                                        
                                        
