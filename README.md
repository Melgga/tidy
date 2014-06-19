
## The file run_analysis.R performs the following tasks:

* Sets the working directory where the data is stored.
* Opens necessary libraries.
* Reads the files with the names of activities and subject numbers for both groups (training and test).
* There are 9 measurements, a "for" loop processes the following steps for each of them:

  - merge the measurements with the corresponding subject number and activity name 
  
  - melt to long format 
  
  - merge training and test files
  
* Note: the commands assign() and get() are crucial for the loops.
* The mean and the standard deviation is computed for each measurement and stored in the data frame "dataset1".
* Each measurement gets a descriptive name. 
* Reads the file with the activities labels.
* Assigns a descriptive name to each activity.
* A "for" loop computes for each measurement the mean for each combination of activity and subject and stores it in a data frame.
* These 9 data frames are combined in one, using rbind.
* The data frame is melted to long format and assigned to the data frame "dataset2".
* The data frames are saved in the files "dataset1.txt" and "dataset2.txt" in the subdirectory "dataset".








