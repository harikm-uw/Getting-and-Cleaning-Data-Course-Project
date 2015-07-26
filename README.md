# Getting-and-Cleaning-Data-Course-Project
####Point 1
The Files were read into the R using the read command into different variables. These variable were then combined together to form a single dataset containing the test data and the training data along with the subject id and the activity id. The column names were then added to this new dataset from the features.txt file

####Point 2
The dataset was subsetted to give a new dataset with columns names containing "mean" and "std" using grep function

####Point 3
The activity id corresponded to an activity label in the activity_labels.txt. Hence using this file the activity id in the new dataset was replced with the coressponding activity label

####Point 4
The names of the columns were slighlty modified (like the abbreviations were expanded)

###Point 5
A new dataset was subsetted from the previous one. The previous one contained many trials performed on the same subject doing the same activity. All these mutiple trials for a subject performing a specific activity were averaged. Hence the new dataset had 180 rows (30 subjects and 6 activities) and the same number of columns as the previous set.
