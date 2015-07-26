##Codebook

####Point 1
The necessary files are read into variables (vectors or matrices). First, the train data is put together i.e, the subject ids and the activity ids along with the X_train datas are binded
together using the columns.Similarly a dataset is created for test using 'cbind'.These 2 are now joined together to form 1 dataset using 'rbind', which bindes the rows together.This new dataset is provided with column names from the features.txt file. Names 'SubjectID' and 'ActivityID' are fed manually

####Point 2
A new dataset is to be created with only the columns names containing mean & std present in it. This is achieved by finding the indices of those words in the col_names vector using the grep command. Once that has been found, that is used to subset the new dataset from the previous one (data_new=data[,new]).

####Point 3
The activity_labels.txt file gives us the activity names corresponding to their numbers in the Y_test/train.txt. Now we have to replace these numbers from the new dataset to the corresponding names. For this we use the replace command within a for loop. Since only 6 activities are present the for loop runs six times replacing each number from 1 to 6 with its corresponding activity from the activity_label.txt.

####Point 4
The colnames used from the features.txt files are not the most comprehensive. Hence in order to make the user understand it better we need to modify this. In order to do that we need to first extract the names into a new vector. Then the words that need to be replaced is done so using the 'gsub' command. This is run through a for loop which runs for the length of the colnames vector.

####Point 5
The values in the dataset are from mutiple trails of a subject doing a particular activity. As in the real scenario, we need to average these values to receive one values per subject performing each activity. To do this, we must look at each subject (so a for loop running from 1 to 30), each activity (for loop from 1 to 6) and each of the various measurement variables (for loop from the colnames excluding the subjectID and the activity ID). In these for loops wesubset the datasets appropriately and take the mean of the each column variable. These values are then arranged in a new dataset along with the corresponding subjectID and activityID using the concatenate function and the rbind function. Then to this new dataset we add the colnames from the previous *Point* and we write this into a .txt file using ht ewrite.table command.
