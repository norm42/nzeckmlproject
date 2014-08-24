---
title: "CourseraMLProject"
author: "Norm Zeck"
date: "Sunday, August 24, 2014"
output: html_document
---

This is the markdown file for the Coursera Machine Learning project.

###Project Steps
Steps I did in the process:

- Examined the variable in the data file, removed the variables that had NA, missing data or catagorical.
- read in the data selecting off only the variables needed
- divided into a training set 75%, and test set 25%
- tried several MLapproaches, using the confusion matrix as a benchmark
- I found that the random forrest gave almost perfect results.
- Ran random forrest aginst the problem test set and submissted the 20 files, all were correct
- this is the problem set key: B A B A A E D B A A B C B A E E A B B B
- For out of sample error I experimented with the trainConrol cross validation and also reduced the test set size to see how the random forrest would perform using a smaller training set.  Hence a larger "unknown" test sample size.

###Variable Selection
The variables I selected are from the critera in the overview:

```
 [1] "roll_belt"            "pitch_belt"           "yaw_belt"             "total_accel_belt"     "gyros_belt_x"        
 [6] "gyros_belt_y"         "gyros_belt_z"         "accel_belt_x"         "accel_belt_y"         "accel_belt_z"        
[11] "magnet_belt_x"        "magnet_belt_y"        "magnet_belt_z"        "roll_arm"             "pitch_arm"           
[16] "yaw_arm"              "total_accel_arm"      "gyros_arm_x"          "gyros_arm_y"          "gyros_arm_z"         
[21] "accel_arm_x"          "accel_arm_y"          "accel_arm_z"          "magnet_arm_x"         "magnet_arm_y"        
[26] "magnet_arm_z"         "roll_dumbbell"        "pitch_dumbbell"       "yaw_dumbbell"         "total_accel_dumbbell"
[31] "gyros_dumbbell_x"     "gyros_dumbbell_y"     "gyros_dumbbell_z"     "accel_dumbbell_x"     "accel_dumbbell_y"    
[36] "accel_dumbbell_z"     "magnet_dumbbell_x"    "magnet_dumbbell_y"    "magnet_dumbbell_z"    "roll_forearm"        
[41] "pitch_forearm"        "yaw_forearm"          "total_accel_forearm"  "gyros_forearm_x"      "gyros_forearm_y"     
[46] "gyros_forearm_z"      "accel_forearm_x"      "accel_forearm_y"      "accel_forearm_z"      "magnet_forearm_x"    
[51] "magnet_forearm_y"     "magnet_forearm_z"     "classe"     
```

###Confusion Matrix Results
The confusion matrix for the test set - 75% of the samples, resulting in 100% accuracy, is here:
```
          Reference
Prediction    A    B    C    D    E
         A 4185    0    0    0    0
         B    0 2848    0    0    0
         C    0    0 2567    0    0
         D    0    0    0 2412    0
         E    0    0    0    0 2706

```
The confusion matrix for the test set - 25% of the samples, resulting in a 99.39% accuracy, is here:

```
          Reference
Prediction    A    B    C    D    E
         A 1394    8    0    0    0
         B    1  941    8    0    0
         C    0    0  847    9    0
         D    0    0    0  792    1
         E    0    0    0    3  900
```

It is worth notes that in the data set the samples are biased toward the "A" catagory.

###Variable Importance
The top 20 variable in order of importance are listed here:

```
                  Overall
roll_belt          100.00
yaw_belt            79.89
magnet_dumbbell_z   66.61
pitch_belt          62.82
pitch_forearm       62.23
magnet_dumbbell_y   59.70
magnet_dumbbell_x   51.59
roll_forearm        49.97
magnet_belt_z       45.71
accel_belt_z        44.44
accel_dumbbell_y    44.28
roll_dumbbell       43.97
magnet_belt_y       38.80
accel_dumbbell_z    36.41
roll_arm            34.83
accel_forearm_x     33.05
accel_dumbbell_x    31.61
gyros_belt_z        31.58
yaw_dumbbell        30.51
gyros_dumbbell_y    29.07
```
Future work would be to understand how to reduce the variable set from 53 to a smaller number to optmize the data that would need to be taken and processed.

###Out of Sample Error
One test I tried was to reduce the size of the training set to see how the predictor would respond to a larger test set of unseen samples.  The results for the confusion matrix were similar introducing only a small number of differences, accuracy went from 99.39% to 99.11%.  In both cases I was running a cross validation with the trainControl set to cv, iterations were 13 which will likely help the prediction.

Confusion Matrix with 50% train, 50% test sets:
```
          Reference
Prediction    A    B    C    D    E
         A 2788   15    0    0    0
         B    1 1876   17    2    1
         C    0    6 1686   16    3
         D    0    1    8 1588   14
         E    1    0    0    2 1785
```

This did cause one failure in the problem test set with the 8th sample:
```
B A B A A E D D A A B C B A E E A B B B 75/25
B A B A A E D B A A B C B A E E A B B B 50/50
```
         

