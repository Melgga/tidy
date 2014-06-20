## The file dataset2.txt contains the following information

### Variables

There are 1620 observations of 4 variables.
The variables are:
* subject
* measurement
* activity
* average

### Variable Description

#### subject

A number from 1 to 30 that indicates the subject of the measurements

#### measurement

Takes one of the following values

 * accelerationx
 * accelerationy     
 * accelerationz     
 * gyroscopex        
 * gyroscopey 
 * gyroscopez   
 * totalaccelerationx
 * totalaccelerationy
 * totalaccelerationz

The string "totalaccelerationx" indicates measures of the total acceleration signal from the smartphone accelerometer x axis in standard gravity units. The next 2 are similar respect to the y and z axis, respectively.

The string "accelerationx" indicates measures of the body acceleration signal obtained by subtracting the gravity from the total acceleration. These measures are given in standard gravity unit. The next 2 are similar respect to the y and z axis, respectively.

The string "gyroscopex" indicates measures of angular velocity vector measured by the gyroscope. The units are radians/second. The next 2 are similar respect to the y and z axis, respectively.

#### activity
Takes one of the following values
* walking
* walkingupstairs
* walkingdownstairs
* sitting
* standing
* laying

Indicates the corresponding activity of the measurements.

#### average 

Provides the mean of the measurement for the subject and activity of the corresponding row.

### Source

Additional information can be found in the read.me file provided in

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

