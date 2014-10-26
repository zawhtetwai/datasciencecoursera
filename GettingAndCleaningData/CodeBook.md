##Data Dictionay for Course Project
This is the experimental project and working on Human Activity Recognition using smartphones. The data are collected from the various accelerometers with the Samsung Galaxy S smartphone. 

The assignment is to clean, reshape and merge the raw data and to produce a tidy data set from it. 

##Raw data
1. train/X_train.txt
 * Training data set 

2. train/subject_train.txt
 * The subjects pertaining to the training data
 * They are integer and there are 30 subjects (represented as 1 to 30)

3. train/y_train.txt
 * Training labels
 * They are recorded in machine format and not human readable
 * They need to be replaced with with descriptive activity names

4. test/X_test.txt
 * Test data set

5. test/subject_test.txt
 * The subjects pertaining to the test data
 * They are integer and there are 30 subjects (represented as 1 to 30)

6. test/y_test.txt
 * Test labels
 * They are recorded in machine format and not human readable
 * They need to be replaced with with descriptive activity names

7. features.txt
 * List of all features
 * There are 561 observations in original data set.
 * Once filtered for mean and std, there are only 79 observations left.
 * These 79 record will be transformed into column vector to serve as the variables in the tidy data set

8. activity_labels.txt
 * There are total 6 activities and they are
    1. WALKING
    2. WALKING_UPSTAIRS
    3. WALKING_DOWNSTAIRS
    4. SITTING
    5. STANDING
    6. LAYING

##Tidy Data (1<sup>st</sup> cut)

The findal tidy data shall be composed as below:
<table border = 1>
<tr>
<td>Activity</td>
<td>Subject</td>
<td>Features in mean and std (1:79)</td>
</tr>
<tr>
<td>WALKING</td>
<td>1</td>
<td>Training data (1:7352)</td>
</tr>
<tr>
<td>WALKING</td>
<td>1</td>
<td>Test data (1:2947)</td>
</tr>
</table>

The features (mean and std columns) in tidy data set are:<br/>
1. "tBodyAcc-<b>mean</b>()-X" <br/>
2. "tBodyAcc-<b>mean</b>()-Y" <br/>
3. "tBodyAcc-<b>mean</b>()-Z" <br/>
4. "tBodyAcc-<b>std</b>()-X" <br/>
5. "tBodyAcc-<b>std</b>()-Y" <br/>
6. "tBodyAcc-<b>std</b>()-Z" <br/>
7. "tGravityAcc-<b>mean</b>()-X" <br/>
8. "tGravityAcc-<b>mean</b>()-Y" <br/>
9. "tGravityAcc-<b>mean</b>()-Z" <br/>
10. "tGravityAcc-<b>std</b>()-X" <br/>
11. "tGravityAcc-<b>std</b>()-Y" <br/>
12. "tGravityAcc-<b>std</b>()-Z" <br/>
13. "tBodyAccJerk-<b>mean</b>()-X" <br/>
14. "tBodyAccJerk-<b>mean</b>()-Y" <br/>
15. "tBodyAccJerk-<b>mean</b>()-Z" <br/>
16. "tBodyAccJerk-<b>std</b>()-X" <br/>
17. "tBodyAccJerk-<b>std</b>()-Y" <br/>
18. "tBodyAccJerk-<b>std</b>()-Z" <br/>
19. "tBodyGyro-<b>mean</b>()-X" <br/>
20. "tBodyGyro-<b>mean</b>()-Y" <br/>
21. "tBodyGyro-<b>mean</b>()-Z" <br/>
22. "tBodyGyro-<b>std</b>()-X" <br/>
23. "tBodyGyro-<b>std</b>()-Y" <br/>
24. "tBodyGyro-<b>std</b>()-Z" <br/>
25. "tBodyGyroJerk-<b>mean</b>()-X" <br/>
26. "tBodyGyroJerk-<b>mean</b>()-Y" <br/>
27. "tBodyGyroJerk-<b>mean</b>()-Z" <br/>
28. "tBodyGyroJerk-<b>std</b>()-X" <br/>
29. "tBodyGyroJerk-<b>std</b>()-Y" <br/>
30. "tBodyGyroJerk-<b>std</b>()-Z" <br/>
31. "tBodyAccMag-<b>mean</b>()" <br/>
32. "tBodyAccMag-<b>std</b>()" <br/>
33. "tGravityAccMag-<b>mean</b>()" <br/>
34. "tGravityAccMag-<b>std</b>()" <br/>
35. "tBodyAccJerkMag-<b>mean</b>()" <br/>
36. "tBodyAccJerkMag-<b>std</b>()" <br/>
37. "tBodyGyroMag-<b>mean</b>()" <br/>
38. "tBodyGyroMag-<b>std</b>()" <br/>
39. "tBodyGyroJerkMag-<b>mean</b>()" <br/>
40. "tBodyGyroJerkMag-<b>std</b>()" <br/>
41. "fBodyAcc-<b>mean</b>()-X" <br/>
42. "fB odyAcc-<b>mean</b>()-Y" <br/>
43. "fBodyAcc-<b>mean</b>()-Z" <br/>
44. "fBodyAcc-<b>std</b>()-X" <br/>
45. "fBodyAcc-<b>std</b>()-Y" <br/>
46. "fBodyAcc-<b>std</b>()-Z" <br/>
47. "fBodyAcc-<b>mean</b>Freq()-X" <br/>
48. "fBodyAcc-<b>mean</b>Freq()-Y" <br/>
49. "fBodyAcc-<b>mean</b>Freq()-Z" <br/>
50. "fBodyAccJerk-<b>mean</b>()-X" <br/>
51. "fBodyAccJerk-<b>mean</b>()-Y" <br/>
52. "fBodyAccJerk-<b>mean</b>()-Z" <br/>
53. "fBodyAccJerk-<b>std</b>()-X" <br/>
54. "fBodyAccJerk-<b>std</b>()-Y" <br/>
55. "fBodyAccJerk-<b>std</b>()-Z" <br/>
56. "fBodyAccJerk-<b>mean</b>Freq()-X" <br/>
57. "fBodyAccJerk-<b>mean</b>Freq()-Y" <br/>
58. "fBodyAccJerk-<b>mean</b>Freq()-Z" <br/>
59. "fBodyGyro-<b>mean</b>()-X" <br/>
60. "fBodyGyro-<b>mean</b>()-Y" <br/>
61. "fBodyGyro-<b>mean</b>()-Z" <br/>
62. "fBodyGyro-<b>std</b>()-X" <br/>
63. "fBodyGyro-<b>std</b>()-Y" <br/>
64. "fBodyGyro-<b>std</b>()-Z" <br/>
65. "fBodyGyro-<b>mean</b>Freq()-X" <br/>
66. "fBodyGyro-<b>mean</b>Freq()-Y" <br/>
67. "fBodyGyro-<b>mean</b>Freq()-Z" <br/>
68. "fBodyAccMag-<b>mean</b>()" <br/>
69. "fBodyAccMag-<b>std</b>()" <br/>
70. "fBodyAccMag-<b>mean</b>Freq()" <br/>
71. "fBodyBodyAccJerkMag-<b>mean</b>()" <br/>
72. "fBodyBodyAccJerkMag-<b>std</b>()" <br/>
73. "fBodyBodyAccJerkMag-<b>mean</b>Freq()" <br/>
74. "fBodyBodyGyroMag-<b>mean</b>()" <br/>
75. "fBodyBodyGyroMag-<b>std</b>()" <br/>
76. "fBodyBodyGyroMag-<b>mean</b>Freq()" <br/>
77. "fBodyBodyGyroJerkMag-<b>mean</b>()" <br/>
78. "fBodyBodyGyroJerkMag-<b>std</b>()" <br/>
79. "fBodyBodyGyroJerkMag-<b>mean</b>Freq()"

##Tidy Data (Final cut)
The last step of the assignment is to create a second, independent tidy data set with the average of each variable for each activity and each subject:
This was achieved by using plyr package and the tidy data set is compacted into 181 observations with 79 variables.

<table border = 1>
<tr>
<td>Activity</td>
<td>Subject</td>
<td>Features in mean and std (1:79)</td>
</tr>
<tr>
<td>WALKING</td>
<td>1</td>
<td>Training and test data (1:181)</td>
</tr>
<tr>
</table>

The tidy data set can be viewed at https://github.com/zawhtetwai/datasciencecoursera/blob/master/GettingAndCleaningData/tidy_data.txt