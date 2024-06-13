#big data K-neighbor stuff
#june 12 2024

library(class)
view(iris)
sample(1:10,5)

trainIndex = sample(1:150,100)
trainFeatures = iris[trainIndex,1:4]
trainLabels = iris[trainIndex,5]

testIndex = setdiff(1:150,trainIndex)
testFeatures = iris[testIndex,1:4]
testLabels = iris[testIndex,5]

prediction = knn(train=trainFeatures, cl=trainLabels, test=testFeatures, k=1)
data.frame(testLabels, prediction) %>% view()
table(testLabels,prediction)

###

diabetes=read_csv("C:/Users/ahmir/OneDrive/Desktop/375/code/pima-indians-diabetes-resampled.csv")
#use preg and pedigree class will be hasdiabetes, feature will be preg and pedigree
#use the first 500 for training, and the rest for the test


diab_trainFeatures = diabetes[1:500,c("Preg","Pedigree")]
diab_trainLabels = diabetes[1:500,"HasDiabetes"]


diab_testFeatures = diabetes[501:768,c("Preg","Pedigree")]
diab_testLabels = diabetes[501:768,"HasDiabetes"]

diab_prediction = knn(train=diab_trainFeatures, cl=diab_trainLabels$HasDiabetes, test=diab_testFeatures, k=1)
#must specify the content of hasDiabetes as a vector rather than a tibble with the $ operator
diab_prediction

data.frame(diab_testLabels,diab_prediction) %>% view()
table(diab_testLabels$HasDiabetes,diab_prediction)
#must specify the content of hasDiabetes as a vector rather than a tibble with the $ operator (same as above)


#normalization
age = c(10,20,39,45,12,16,21)
normalize <- function(x) {(age-min(age))/max(age)-min(age)}
normalize(age)

view(iris)

##check
iris %>% mutate(Sepal.Length.norm=normalize(Sepal.Length)) %>% view(iris)
