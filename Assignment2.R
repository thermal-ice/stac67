set.seed(1006274274);
library(ggplot2)
library(MASS)
library(rcompanion)
library(lmtest)



# TODO Question 1 A:
# myTable <- read.table("vote.txt", header = TRUE, sep = "", dec = ".")
#
# growthArr <-myTable$growth;
# voteArr <- myTable$vote;
#
#
# error =rnorm(length(growthArr),0,3.9);
# fakeYData = vector()
#
# for (i in 1:length(growthArr)){
#   fakeYData = append(fakeYData, 46.3 + 4* growthArr[i] + error[i])
# }
#
# fakeDataModel = lm (fakeYData ~ growthArr)
#
# summary(fakeDataModel)
# df = data.frame(growthArr = 0.1)
#
# predict(fakeDataModel,newdata = df)
# #By default the prediction is 95%
# predict(fakeDataModel, newdata = df, interval = "confidence")
#
#
#
# #
# # # TODO Q1 part b
# #
# generateFakeDataModel <- function (xVector){
#
#   error =rnorm(length(xVector),0,3.9);
#   fakeYData = vector()
#
#   for (i in 1:length(xVector)){
#     fakeYData = append(fakeYData, 46.3 + 4* xVector[i] + error[i])
#   }
#
#   return ( lm (fakeYData ~ xVector))
# }
#
# interceptVector = vector()
# slopeVector = vector()
#
# for (i in 1:10000){
#   linModel <- generateFakeDataModel(growthArr);
#   interceptVector = append(interceptVector, coef(linModel)["(Intercept)"])
#   slopeVector = append (slopeVector, coef(linModel)["xVector"])
# }
#
# plotNormalHistogram( unlist(interceptVector), prob = FALSE,
#                      main = "Q1 part B: Intercept histogram",
#                      length = 1000)
#
# plotNormalHistogram( unlist(slopeVector), prob = FALSE,
#                      main = "Q1 part B: Slope histogram",
#                      length = 1000)
#
#
# data_frame = data.frame(growthArr = growthArr, fakeYData = fakeYData)
#
# cat ("The mean of the intercept vector is expected to be 4, and it is:", mean(interceptVector), "\n")
# cat ("The mean of the slope vector is expected to be 4, and it is:", mean(slopeVector), "\n")
#
# # Yes, the simulated results are consistent with theoretical results.
# sigmaHat = 3.9 #This is a given
#
# SXX <- sum((growthArr - mean(growthArr))^2)
#
# #Standard error of slope (beta 1 hat), should be the same as the sd of the slope vector
# stanErrorBeta1 <- sigmaHat / sqrt(SXX)
# stanErrorBeta1
# sd(slopeVector)
#
# #Standard error of intercept (beta 0 hat), should be the same as the sd of the slope intercept
#
# stanErrorBeta0 <- sqrt(1 / length(growthArr) + (mean(growthArr)^2)/SXX) * sigmaHat
# stanErrorBeta0
# sd(interceptVector)
#
#
# confidIntVector = vector()

# TODO Q1 part c
# df = data.frame(xVector = 0.1)
#
# total = 10000
# expectedVal = 46.3 + (4 * 0.1)
#
# valCountInConfInt = 0
# for (i in 1:total){
#
#
#   currPrediction = predict(generateFakeDataModel(growthArr), newdata = df, interval = "confidence")
#   # cat("curr prediction is ", currPrediction, "\n")
#   # cat(currPrediction[[1]], "\n")
#   if (currPrediction[[2]] <= expectedVal & expectedVal <= currPrediction[[3]]){
#     valCountInConfInt = valCountInConfInt + 1
#   }
#   # confidIntVector = append (confidIntVector,fakeConfInt)
# }
#
# cat ("Percentage of the expected val in the generated CIs:", valCountInConfInt / total, "\n")

# This is absolutely consistent with the predicted values.



# TODO Question 2
#


# x <- c(0:9)
# y <- c(98, 135, 162, 178, 221, 232, 283, 300, 374, 395)
# par(mar=c(1,1,1,1))
# fit <- lm (y~x)
# result <- boxcox(fit, lambda = seq(-2,2,0.1))
#
# mylambda <- result$x[which.max(result$y)]

# result = boxcox(y~x, lambda = seq(-2,2,0.1)) #Same thing as above.
# result$x[which.max(result$y)]




# myBoxCoxImpl(y,x)

#Restarting the whole thing
#
# valOf_n = length(x)
#
# k2 = (prod(y))^(1/valOf_n)
#
# optimal_lambda = -42
# minSSE = .Machine$integer.max
# for (lambda in seq(-2,2,0.1)){
#   W = vector()
#
#   for (i in 1:length(y)){
#
#     if(lambda != 0){
#       k1 = 1/(lambda * k2^(lambda-1) )
#       w_i = k1 * ((y[i]^lambda) - 1)
#     }else{
#       w_i = k2 * (log(y[i]))
#     }
#     W = append(W,w_i)
#   }
#
#   tempModel = lm(W~x)
#   cf <- coef(tempModel)
#   intercept <- cf["(Intercept)"]
#   slope <- cf["x"]
#   # cat("The intercept is: ", intercept, " the slope is: ", slope, "\n")
#   SSE = 0
#   for(i in 1:length(x)){
#     w_i_hat = intercept + slope * x[i]
#     SSE = SSE + (W[i] - w_i_hat)^2
#   }
#
#   if(SSE < minSSE){
#     minSSE = SSE
#     optimal_lambda = lambda
#   }
#
#   W = vector()
#
#
# }
#
# optimal_lambda


#TODO Question 3
#
kidiqTable = read.table("kidiq.csv",header = TRUE,sep = ",", dec = ".")

xAxis = kidiqTable$mom.iq
yAxis = kidiqTable$kid.score
modelForIQandScore = lm (yAxis ~ xAxis)


#Small p-value means reject null, so variance is constant
#
#  predict(modelForIQandScore, newdata = data.frame(xAxis = 110), interval = "confidence")
# # Mom.work is probably how much money mom makes. 4= the most, 1=the least
# n = length(kidiqTable[[1]])
#
# t_val = qt(p=0.025, df=432, lower.tail = FALSE)
# # summary(modelForIQandScore)
# sumOfSquareDev =   sum( (xAxis - mean(xAxis) )^2 )
# MSE = mean(modelForIQandScore$residuals^2)
# stanError = sqrt(MSE * (1/n + ((110 - mean(xAxis))^2 / sumOfSquareDev)))
#
# upperIntVal = 92.79 + t_val * stanError
#
# lowerIntVal = 92.79 - t_val * stanError
# Both values match the R values generated by predict.

# # Q3 part b
#
#
# # t-Val same as in part a of Q3, when set alpha= 0.05
#
t_val_partB = qt(p=0.995, df=432, lower.tail = TRUE)

stanError_partB = sqrt(MSE * (1 + 1/n + ((110-mean(xAxis))^2 / sumOfSquareDev)))

upperIntVal_partB = 92.79 + t_val_partB * stanError_partB

lowerIntVal_partB = 92.79 - t_val_partB * stanError_partB

print("For partB")
predict(modelForIQandScore, newdata = data.frame(xAxis = 110), interval = "confidence", level = 0.99)
#
#TODO Part b has the wrong manually calculated value :shrug:
#
# # part C
#
# plot(modelForIQandScore)
#
# # The plot is definitely skewed towards the 0 on the x-axis.
# # Ask partner what this is supposed to mean?
#
# stanResiduals = rstandard(modelForIQandScore)
#
#
# qqnorm(stanResiduals,
#        ylab="Standardized Residuals", xlab="Normal Scores", main="QQ plot of residuals")
# qqline(stanResiduals)
#
# # This looks pretty accurate to what we would expect.
#
# part d)
# shapiro.test(modelForIQandScore$residuals)
#
# # The p-value is 0.00217, which is < 0.05 (our alpha level), therefore we reject the null hypothesis that the data is normally distributed.
#
# bptest(modelForIQandScore)
#
# # For the breusch-pagan test, we test the errors in the regression.
# # Null hypothesis is that all the error variances are the same
# # Alternate hypothesis is that they're not the same.
#
# # p value < 0.05, therefore null hypothesis is false. Thus the errors don't have the same underlying variance.
#
# # So since the errors are not normally distributed, we must repeat step (d) and (e) with a boxcox transformation.
#
# #find optimal lambda for Box-Cox transformation
# bc <- boxcox(yAxis ~ xAxis)
#
# lambda = bc$x[which.max(bc$y)]
#
# #fit new linear regression model using the Box-Cox transformation
# new_model <- lm((yAxis^lambda) ~ xAxis)
#
# print("The shapiro-wilk test on the boxcox transformed model")
# shapiro.test(new_model$residuals)
#
# bptest(new_model)
#
# # Huh, the new p-value for the new_model is 0.3859, which is more than the alpha level, which means we fail to reject null hypothesis.
#
#
#
# stanResidualsPartF = rstandard(new_model)
#
#
# qqnorm(stanResidualsPartF,
#        ylab="Standardized Residuals", xlab="Normal Scores", main="QQ plot of residuals for Part F")
# qqline(stanResidualsPartF)