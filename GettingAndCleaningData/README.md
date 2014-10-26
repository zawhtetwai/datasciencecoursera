#Human Activity Recognition Using Smartphones 
This assignment is to work on the data collected from the accelerometers from the Samsung Galaxy S smartphone.

##Deliverables for the assignment
* CodeBook.md
* UCI HAR Dataset (unzipped data set)
* README.MD
* run_analysis.R
* tidy_data.txt

##Prerequisites for the script (run_analysis.R)
* R 3.1.1 <br/>
 -download link for Mac: http://cran.r-project.org/bin/macosx/ <br/> 
 -download link for Windows: http://cran.r-project.org/bin/windows/base/ <br/> 
* RTools 3.1
* plyr package

##How to run the script
1. Launch the RGUI
2. Set the working directroy using setwd("your current working directory")
3. Download the UCI HAR Dataset and run_analysis.R to your working directory
4. type 'source("run_analysis.R")' without single quote.
5. After seeing the "Loading required package: plyr" and cursour is ready again in the RGUI console:
  -look out for the tidy_data.txt in your working directory

##Processing Steps
Two data sets are mainly involved in this process. Descriptive activity and subject names are required to map to these to data set accordingly.

1. Load the plyr package <br/>
 - This package is required to apply mean to all feature columns by grouping Activities and Subjects

2. Declaring the variables <br/>
 - All file paths are set into the respective variables to be used later in the script

3. Load the features file, locate the mean and std variables in it using regular expression

4. Create the column vector using the mean and std variables created in Step 3

5. Load the train and test data sets, map them with the mean and std variables created in Step 4

6. Load the Subjects for train and test data sets

7. Load and Activity and set its descriptive names to train and test data sets

8. Bind Activity and Subject to train and test data sets

9. Merge the train and test data sets

10. Apply mean to merged data sets by grouping Activities and Subjects

11. Write out the tidy data set created in Step 10 to working directory