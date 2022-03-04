library(rcompanion)
set.seed(1006274274);

# sampleSize = 10;
# nums<-rnorm(n=sampleSize, mean = 2,sd=5);
# #nums <- c(1,2,3,4,5)
#
#
# sampleMean = mean(nums);
#
# standardError = sd(nums) / sqrt(sampleSize);
#
# # Y_i = B0 + B1X_i + e_i
# linear_model <- lm( nums~ 1);
#
# summary(linear_model);
#
# # summary(linear_model);
# # cat("The sample mean is:",sampleMean,"\n");
# # cat("The standard error is:", standardError,"\n");
# #
# coef(linear_model)["(Intercept)"]
# coef(summary(linear_model))[, "Std. Error"]
# #
# #
# #
# meanList <- list();
# for(i in 1:10000){
#   randomSample <-rnorm(n=20, mean = 2,sd=5);
#   currSampleMean = mean(randomSample);
#   meanList <- append(meanList,currSampleMean);
# }
#
#
# # hist(unlist(meanList));
# # create data vector
#
#
# # draw plot
# plotNormalHistogram( unlist(meanList), prob = FALSE,
#                      main = "Question 1 part c",
#                      length = 1000)

myTable <- read.table("vote.txt", header = TRUE, sep = "", dec = ".")

growthArr <-myTable$growth;
voteArr <- myTable$vote;

# The growth is independent var, vote percentage is dependent var
plot(growthArr,voteArr,main="Question 6 part (a)", xlab="Growth", ylab="Vote")


lin_model <- lm(voteArr ~ growthArr);
intercept <- coef(lin_model)["(Intercept)"]
slope <- coef(lin_model)["growthArr"]

summary(lin_model)

cat("The intercept (B0) is:", intercept,"\n");

cat("The slope (B1) is:", slope,"\n");

abline(lin_model)
# That means that if there is no economic growth, the incumbent party can expect to have a vote percentage of $B_0$
# It also means that for every 1% of economic growth, the incumbent party can expect to gain 3% in votes.

#There's probably a better way of doing this, dunno
rowNumOfYear2008 <- match(2008,myTable$year);
growthInYear2008 <- growthArr[rowNumOfYear2008]

newDataFramePredictor <- data.frame(growthArr=growthInYear2008);

votePercentageOfIncumbent <- predict(lin_model,newDataFramePredictor);

incumbentOrOppositionStr <-if(votePercentageOfIncumbent >= 50) "Incumbent" else "Opposition";

cat("The vote % of incumbent party is predicted to be:", votePercentageOfIncumbent,",so the",
    incumbentOrOppositionStr, "party is expected to win. That party is led by: ",
if (incumbentOrOppositionStr == "Incumbent") myTable$inc_party_candidate[rowNumOfYear2008] else myTable$other_candidate[rowNumOfYear2008], "\n" );


#If we calculate this by hand, we can model it as $Y = B_0 + B_1 X$, and plugging in the numbers, we get
# $Y=46.55$, which is still less than 50%. So Obama (the opposition), is still expected to win.

cor(growthArr, voteArr,  method = "pearson");

#There is a pretty strong positive correlation between growth and vote share.
#e)
confint(lin_model, 'growthArr', level=0.95)

#f)
b1HatStdError <- summary(lin_model)$coefficients[, 2]["growthArr"];

degFreedom <- length(growthArr) - 2;

t_value <- 1/b1HatStdError;

probabilityRes <- (1- pt(t_value, df = degFreedom)) * 2;

cat("The probability calculation gives us:", probabilityRes,"\n");