# Reading the data into R, exracting variables with mean or standard deviation in variable name, grouping by subject and activities, 
# and write to a txt file.

# TEST files data information
# Read data, row labels, and identifier(convert identifier col head for merge)
xtest <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/X_test.txt")  #Read TEST data
ytest <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/y_test.txt") # read TEST labels col for TEST
subjecttest <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/subject_test.txt") # read test unique identifier col for TEST
colnames(subjecttest) <- c("testortraingrp") # rename identifiier col for TEST


# Common files importninformation
# ReaD column headings, activity labels
features <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/features.txt") # Read col headings COMMON TO BOTH FILES
activities <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/activity_labels.txt") # Read row alpha category abels for acivities
                                                                                # these numbers/alpha names correspond to ytest numeric values)

# TRAIN files data import inforamtion
# Read data, row labels, and identifier(convert identifier col head for merge)
xtrain <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/X_train.txt")  #Read TRAIN data
ytrain <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/y_train.txt") # read TRAIN labels col
subjecttrain <- read.table("C:/Users/Mike/Desktop/Coursera/data/Courseproject/subject_train.txt") # read test unique identifier col for TRAIN
colnames(subjecttrain) <- c("testortraingrp") # rename identifiier col for TRAIM


# MERGE TEST and TRAIN files

   # TEST file MERGES
# TEST: add sequence to subjectTEST and move ID to 1st column
subjecttest$id <- (7353:10299); View(subjecttest)# Worked for adding sequenced ID col 7353:10299
colnames(subjecttest) # shows col names
subjecttest <- subjecttest[c(2,1)]; View(subjecttest) # Worked to changed order to ID 1st

# TEST files: add sequence to ytest and move ID to 1st column
ytest$id <- (7353:10299); View(ytest) # Worked for adding sequenced ID col
colnames(ytest) # shows col names
colnames(ytest)[which(colnames(ytest) == 'V1')] <- 'activities' # Worked to renam individual column
ytest <- ytest[c(2,1)]; View(ytest) # Worked to changed order to ID 1st

# TEST files: add sequence to xtest and move ID to 1st column
xtest$id <- (7353:10299); View(xtest) # Worked for adding sequenced ID col
colnames(xtest) # shows col names
xtest <- xtest[c(562,1:561)]; View(xtest) # Worked to changed order to ID 1st

# TEST files: merge all data frames for TEST
combinedlist <- list(subjecttest, ytest, xtest) # makes list for merging files
testcombined <- join_all(combinedlist); View(testcombined) # join/merges all files


  # TRAIN file MERGES
# TRAIN: add sequence to subjectTRAIN and move ID to 1st column
subjecttrain$id <- seq.int(nrow(subjecttrain)); View(subjecttrain)  # Worked for adding sequenced ID col
colnames(subjecttrain) # shows col names
subjecttrain <- subjecttrain[c(2,1)] # Worked to changed order to ID 1st

# TRAIN files: add sequence to yTRAIN and move ID to 1st column
ytrain$id <- seq.int(nrow(ytrain)); View(ytrain) # Worked for adding sequenced ID col
colnames(ytrain) # shows col names
colnames(ytrain)[which(colnames(ytrain) == 'V1')] <- 'activities' # Worked to rename individual column
ytrain <- ytrain[c(2,1)]; View(ytrain) # Worked to changed order to ID 1st

# TRAIN files: add sequence to xtrain and move ID to 1st column
xtrain$id <- seq.int(nrow(xtrain)); View(xtrain) # Worked for adding sequenced ID col
colnames(xtest) # shows col names
xtrain <- xtrain[c(562,1:561)]; View(xtrain) # Worked to changed order to ID 1st

# TRAIN fields: merge all data frames for TRAIN
combinedlist <- list(subjecttrain, ytrain, xtrain) # makes list for merging files
traincombined <- join_all(combinedlist); View(traincombined) # join/merges all files(needs library(plyr))


# Append both fully prepared TRAIN and TEST files
combinedtraintest <- rbind(traincombined, testcombined); View(combinedtraintest) # Worked to append files


# Make temp file to extract mean and standart deviation variables
tempfile <- combinedtraintest; View(tempfile)


# Select columns to extract for tidy dataset
newdata <- tempfile[c(1:9, 44:49, 84:89, 124:129, 164:169, 204:205, 217:218, 230:231, 243:244, 256:257, 269:274,
297:299, 348:353, 376:378, 427:432, 455:457, 506:507, 516, 519:520, 529, 532:533, 542, 545:546, 555, 558:564)]


  # RENAME EXRACTED COLUMNS

# Renamed 'subject' column
colnames(newdata)[which(colnames(newdata) == 'testortraingrp')] <- 'subject' # Worked to rename individual column
newdata$activities <- as.character(newdata$activities)

# Renamed activities columns 
newdata$activities[which(newdata$activities=="1")] <- "walking"
newdata$activities[which(newdata$activities=="2")] <- "walkingupstairs"
newdata$activities[which(newdata$activities=="3")] <- "walkingdownstairs"
newdata$activities[which(newdata$activities=="4")] <- "sitting"
newdata$activities[which(newdata$activities=="5")] <- "standing"
newdata$activities[which(newdata$activities=="6")] <- "laying"
namecol <- newdata

# Renamed all variable columns
setnames(namecol, old = c('V1','V2','V3','V4','V5','V6','V41','V42','V43','V44','V45','V46',
                          'V81','V82','V83','V84','V85','V86','V121','V122','V123','V124','V125','V126',
                          'V161','V162','V163','V164','V165','V166','V201','V202','V214','V215','V227','V228',
                          'V240','V241','V253','V254','V266','V267','V268','V269','V270','V271','V294','V295','V296',
                          'V345','V346','V347','V348','V349','V350','V373','V374','V375','V424','V425','V426',
                          'V427','V428','V429','V452','V453','V454','V503','V504','V513','V516','V517','V526',
                          'V529','V530','V539','V542','V543','V552','V555','V556','V557','V558','V559','V560',
                          'V561'),
        new = c('tbodyaccmeanx','tbodyaccmeany','tbodyaccmeanz','tbodyaccstdx','tbodyaccstdy','tbodyaccstdz',
        'tgravityaccmeanx','tgravityaccmeany','tgravityaccmeanz','tgravityaccstdx','tgravityaccstdy','tgravityaccstdz',
        'tbodyaccjerkmeanx','tbodyaccjerkmeany','tbodyaccjerkmeanz','tbodyaccjerkstdx','tbodyaccjerkstdy','tbodyaccjerkstdz',
        'tbodygyromeanx','tbodygyromeany','tbodygyromeanz','tbodygyrostdx','tbodygyrostdy','tbodygyrostdz',
        'tbodygyrojerkmeanx','tbodygyrojerkmeany','tbodygyrojerkmeanz','tbodygyrojerkstdx','tbodygyrojerkstdy','tbodygyrojerkstdz',
        'tbodyaccmagmean','tbodyaccmagstd','tgravityaccmagmean','tgravityaccmagstd','tbodyaccjerkmagmean','tbodyjerkmagstd',
        'tbodygyromagmean','tbodygyromagstd','tbodygyrojerkmagmean','tbodygyrojerkmagstd','fbodyaccmeanx','fbodyaccmeany',
        'fbodyaccmeanz','fbodyaccstdx','fbodyaccstdy','fbodyaccstdz','fbodyaccmeanfreqx','fbodyaccmeanfreqy','fbodyaccmeanfreqz',
        'fbodyaccjerkmeanx','fbodyaccjerkmeany','fbodyaccjerkmeanz','fbodyaccjerkstdx','fbodyaccjerkstdy','fbodyaccjerkstdz',
        'fbodyaccjerkmeanfreqx','fbodyaccjerkmeanfreqy','fbodyaccjerkmeanfreqz','fbodygyromeanx','fbodygyromeany','fbodygyromeanz',
        'fbodygyrostdx','fbodygyrostdy','fbodygyrostdz','fbodygyromeanfreqx','fbodygyromeanfreqy','fbodygyromeanfreqz',
        'fbodyaccmagmean','fbodyaccmagstd','fbodyaccmagmeanfreq','fbodyaccjerkmagmean','fbodyaccjerkmagstd','fbodyaccjerkmagmeanfreq',
        'fbodygyromagmean','fbodygyromagstd','fbodygyromagmeanfreq','fbodygyrojerkmagmean','fbodygyrojerkmagstd','fbodygyrojerkmagmeanfreq',
        'angletbodyaccmeangravity','angletbodyaccjerkmeangravitymean','angletbodygyromeangravitymean','angletbodygyrojerkmeangravitymean',
        'anglexgravitymean','angleygravitymean','anglezgravitymean'))

# Group and average the extracted measurement variables by average of each variable for each activity
testgrp <- namecol
library(dplyr)
subjectgrp <- group_by(testgrp, subject, activities); View(subjectgrp)
subgrp1 <- summarise(subjectgrp, tbodyaccmeanx = mean(tbodyaccmeanx),tbodyaccmeany = mean(tbodyaccmeany),tbodyaccmeanz = mean(tbodyaccmeanz),tbodyaccstdx = mean(tbodyaccstdx),tbodyaccstdy = mean(tbodyaccstdy),tbodyaccstdz = mean(tbodyaccstdz),
                     tgravityaccmeanx = mean(tgravityaccmeanx),tgravityaccmeany = mean(tgravityaccmeany),tgravityaccmeanz = mean(tgravityaccmeanz),tgravityaccstdx = mean(tgravityaccstdx),tgravityaccstdy = mean(tgravityaccstdy),tgravityaccstdz = mean(tgravityaccstdz),
                     tbodyaccjerkmeanx = mean(tbodyaccjerkmeanx),tbodyaccjerkmeany = mean(tbodyaccjerkmeany),tbodyaccjerkmeanz = mean(tbodyaccjerkmeanz),tbodyaccjerkstdx = mean(tbodyaccjerkstdx),tbodyaccjerkstdy = mean(tbodyaccjerkstdy),tbodyaccjerkstdz = mean(tbodyaccjerkstdz),
                     tbodygyromeanx = mean(tbodygyromeanx),tbodygyromeany = mean(tbodygyromeany),tbodygyromeanz = mean(tbodygyromeanz),tbodygyrostdx = mean(tbodygyrostdx),tbodygyrostdy = mean(tbodygyrostdy),tbodygyrostdz = mean(tbodygyrostdz),
                     tbodygyrojerkmeanx = mean(tbodygyrojerkmeanx),tbodygyrojerkmeany = mean(tbodygyrojerkmeany),tbodygyrojerkmeanz = mean(tbodygyrojerkmeanz),tbodygyrojerkstdx = mean(tbodygyrojerkstdx),tbodygyrojerkstdy = mean(tbodygyrojerkstdy),tbodygyrojerkstdz = mean(tbodygyrojerkstdz),
                     tbodyaccmagmean = mean(tbodyaccmagmean),tbodyaccmagstd = mean(tbodyaccmagstd),tgravityaccmagmean = mean(tgravityaccmagmean),tgravityaccmagstd = mean(tgravityaccmagstd),tbodyaccjerkmagmean = mean(tbodyaccjerkmagmean),tbodyjerkmagstd = mean(tbodyjerkmagstd),
                     tbodygyromagmean = mean(tbodygyromagmean),tbodygyromagstd = mean(tbodygyromagstd),tbodygyrojerkmagmean = mean(tbodygyrojerkmagmean),tbodygyrojerkmagstd = mean(tbodygyrojerkmagstd),fbodyaccmeanx = mean(fbodyaccmeanx),fbodyaccmeany = mean(fbodyaccmeany),
                     fbodyaccmeanz = mean(fbodyaccmeanz),fbodyaccstdx = mean(fbodyaccstdx),fbodyaccstdy = mean(fbodyaccstdy),fbodyaccstdz = mean(fbodyaccstdz),fbodyaccmeanfreqx = mean(fbodyaccmeanfreqx),fbodyaccmeanfreqy = mean(fbodyaccmeanfreqy),fbodyaccmeanfreqz = mean(fbodyaccmeanfreqz),
                     fbodyaccjerkmeanx = mean(fbodyaccjerkmeanx),fbodyaccjerkmeany = mean(fbodyaccjerkmeany),fbodyaccjerkmeanz = mean(fbodyaccjerkmeanz),fbodyaccjerkstdx = mean(fbodyaccjerkstdx),fbodyaccjerkstdy = mean(fbodyaccjerkstdy),fbodyaccjerkstdz = mean(fbodyaccjerkstdz),
                     fbodyaccjerkmeanfreqx = mean(fbodyaccjerkmeanfreqx),fbodyaccjerkmeanfreqy = mean(fbodyaccjerkmeanfreqy),fbodyaccjerkmeanfreqz = mean(fbodyaccjerkmeanfreqz),fbodygyromeanx = mean(fbodygyromeanx),fbodygyromeany = mean(fbodygyromeany),fbodygyromeanz = mean(fbodygyromeanz),
                     fbodygyrostdx = mean(fbodygyrostdx),fbodygyrostdy = mean(fbodygyrostdy),fbodygyrostdz = mean(fbodygyrostdz),fbodygyromeanfreqx = mean(fbodygyromeanfreqx),fbodygyromeanfreqy = mean(fbodygyromeanfreqy),fbodygyromeanfreqz = mean(fbodygyromeanfreqz),
                     fbodyaccmagmean = mean(fbodyaccmagmean),fbodyaccmagstd = mean(fbodyaccmagstd),fbodyaccmagmeanfreq = mean(fbodyaccmagmeanfreq),fbodyaccjerkmagmean = mean(fbodyaccjerkmagmean),fbodyaccjerkmagstd = mean(fbodyaccjerkmagstd),fbodyaccjerkmagmeanfreq = mean(fbodyaccjerkmagmeanfreq),
                     fbodygyromagmean = mean(fbodygyromagmean),fbodygyromagstd = mean(fbodygyromagstd),fbodygyromagmeanfreq = mean(fbodygyromagmeanfreq),fbodygyrojerkmagmean = mean(fbodygyrojerkmagmean),fbodygyrojerkmagstd = mean(fbodygyrojerkmagstd),fbodygyrojerkmagmeanfreq = mean(fbodygyrojerkmagmeanfreq),
                     angletbodyaccmeangravity = mean(angletbodyaccmeangravity),angletbodyaccjerkmeangravitymean = mean(angletbodyaccjerkmeangravitymean),angletbodygyromeangravitymean = mean(angletbodygyromeangravitymean),angletbodygyrojerkmeangravitymean = mean(angletbodygyrojerkmeangravitymean),
                     anglexgravitymean = mean(anglexgravitymean),angleygravitymean = mean(angleygravitymean),anglezgravitymean = mean(anglezgravitymean))

# Write a txt file of tidy data with average of each variable for each activity
write.table(subgrp1, "C:/A MIKE DESKTOP/Coursera/Getting and Cleaning Data/Course Projects/The Course Project/tidygetcleandata.txt", row.names=F, quote=FALSE)