set.seed(3523)
library(AppliedPredictiveModeling)
data(concrete)
inTrain = createDataPartition(concrete$CompressiveStrength, p = 3/4, list = FALSE)
training = concrete[ inTrain,]
testing = concrete[-inTrain, ]

set.seed(325)
library(e1071)
mod_svm <- svm(CompressiveStrength ~ ., data = training)
pred_svm <- predict(mod_svm, testing)
accuracy(pred_svm, as.factor(testing$CompressiveStrength))
