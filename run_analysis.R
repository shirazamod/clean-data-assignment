library(dplyr)

## TODO Create Readme.md
## TODO Create Codebook.md


##get feature headings
f.header <- read.table("data/features.txt", stringsAsFactors = FALSE)

## get activity descriptions
a.header <- read.table("data/activity_labels.txt")

## get training data
train.features <- read.table("data/train/X_train.txt")
train.activities <- read.table("data/train/y_train.txt")
train.subjects <- read.table("data/train/subject_train.txt")

## get test data
test.features <- read.table("data/test/X_test.txt")
test.activities <- read.table("data/test/y_test.txt")
test.subjects <- read.table("data/test/subject_test.txt")

## merge activity numbers with each record
train.features$activity <- train.activities$V1
test.features$activity <- test.activities$V1

## merge subject numbers with each record
train.features$subject <- train.subjects$V1
test.features$subject <- test.subjects$V1

## merge test and training datasets
merged.features <- rbind(train.features, test.features)


## extract mean and standard deviation variables
## f.header[grepl("*-mean", f.header$V2) | grepl("*-std", f.header$V2),]
tidy <- merged.features[,grepl("*-mean", f.header$V2) | grepl("*-std", f.header$V2)]
tidy$activity <- merged.features$activity
tidy$subject.id <- merged.features$subject

## provide descriptive variable names
colnames(tidy) <- c(f.header[grepl("*-mean", f.header$V2) | grepl("*-std", f.header$V2), "V2"], "activity", "subject.id")

## rename activities with descriptive names (e.g. WALKING_UPSTAIRS instead of 2)
tidy$activity <- a.header[tidy$activity,"V2"]

## create averages per activity and subject
tidy.mean <- group_by(tidy, activity, subject) %>% summarise_each(funs(mean))


## create dataset txt file
write.table(tidy.mean, "tidy.txt", row.names = FALSE)
print("Data cleaning and transformation complete - see tidy.txt")
print("To read in the data use: data <- read.table('tidy.txt', header = TRUE)")