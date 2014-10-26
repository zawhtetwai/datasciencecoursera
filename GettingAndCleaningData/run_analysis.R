require(plyr)
 ## ----------- variables for files locations -------------
 ## features
 features_path <- "UCI HAR Dataset/features.txt"
 
 ## train and test data set
 x_train_path <- "UCI HAR Dataset/train/X_train.txt"
 x_test_path <- "UCI HAR Dataset/test/X_test.txt"
 
 ##subject names
 subj_train_path <- "UCI HAR Dataset/train/subject_train.txt"
 subj_test_path <- "UCI HAR Dataset/test/subject_test.txt"

 ## activity names
 act_desc_path <- "UCI HAR Dataset/activity_labels.txt"
 y_train_path <- "UCI HAR Dataset/train/y_train.txt"
 y_test_path <- "UCI HAR Dataset/test/y_test.txt"

 ## ---------------- end of variables -----------------------

 ## --------- locate the columns that have mean and std -----

 ## grep is used in conjunction with regular expression
 ## we do not take the angle features where mean is passed as an argument
 columns <- read.delim(features_path, sep=" ", header=FALSE, stringsAsFactors=FALSE)
 idx <- grep(pattern = "-(mean|std)", x = columns[,2])
 mean_std_columns = columns[idx,]
 
 ## create column vector to assign to the train and test data sets
 col_classes <- rep("NULL", nrow(columns))
 col_classes[mean_std_columns[, 1]] <- rep("numeric",nrow(mean_std_columns))

 ## --------- end of column vector ---------------------------

 ## --------- read train and test data sets  -----------------

 ## read X_train data set (only on the mean and std columns)
 x_train <- read.table(x_train_path, header =FALSE, stringsAsFactor=FALSE, colClasses = col_classes)
 colnames(x_train) <- mean_std_columns[, 2]
 
 ## read X_test data set (only on the mean and std columns)
 x_test = read.table(x_test_path, header =FALSE, stringsAsFactor=FALSE, colClasses = col_classes)
 colnames(x_test) <- mean_std_columns[, 2]

 ## -------- end of train and test data set reading ----------

 ## --------- read subject data sets  -----------------

 ## read subject names for train and test data sets
 subj_train <- read.delim(subj_train_path, sep=" ", header=FALSE, stringsAsFactors=FALSE)
 names(subj_train)[1] <- "Subject"

 subj_test <- read.delim(subj_test_path, sep=" ", header=FALSE, stringsAsFactors=FALSE)
 names(subj_test)[1] <- "Subject"

 ##-------- end of subject data set reading ----------
 
 ## --------- read activity data sets  ---------------

 ## read activity name
 activity_desc <- read.delim(act_desc_path, sep=" ", header=FALSE, stringsAsFactors=FALSE)
 
 ## apply descriptive names to activity names in train data set
 y_train <- read.delim(y_train_path, sep=" ", header=FALSE, stringsAsFactors=FALSE)
 names(y_train)[1] <- "Activity"
 y_train[1] = factor(y_train[[1]], levels = activity_desc[,1], labels = activity_desc[,2])

 ## apply descriptive names to activity names in test data set
 y_test <- read.delim(y_test_path, sep=" ", header=FALSE, stringsAsFactors=FALSE)
 names(y_test)[1] <- "Activity"
 y_test[1] = factor(y_test[[1]], levels = activity_desc[,1], labels = activity_desc[,2])

 ##-------- end of activity data set reading ----------

 ## --------------- merging data sets -----------------
 ## merge train data set, activities and subjects
 train = cbind(y_train, subj_train, x_train)

 ## merge test data set, activities and subjects
 test = cbind(y_test, subj_test, x_test)
 
 ## finally merge train and test data sets with their descriptive activity names
 merged_data <- rbind(train, test) 
 ## ------------end of merging data sets ---------------

 ## -- calculate mean for variables group by Activity and Subject --

 ## calculate mean on data set group by Activities and Subjects
 result <- ddply(merged_data, .(Activity, Subject), function(x) colMeans(x[, 3:ncol(merged_data)]))

  ## ------------end of calculating mean ---------------

 ## ------------ write the tidy data set out -----------

 write.table(result, "tidy_data.txt", row.name=FALSE)

 ## ---------- end of writing the tidy data set ---------