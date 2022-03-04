#
# # Lecture 2, week 1
# #Timestamp: 20:00
# library(mvtnorm)
#
# sigma.1 = matrix(c(1,0,0,1),ncol = 2) #when ρ (roe) equals 0
#
# sigma.2 = matrix(c(1,0.9,0.9,1),ncol = 2) #when ρ (roe) equals 0.9
#
# X = rmvnorm(100, mean=c(0,0),sigma.1)
# plot(X,pch = 20,cex = 2, col = "blue")
#
# X2 = rmvnorm(100,mean = c(0,0),sigma.2)
# plot(X2,pch = 20,cex = 2,col = "green")
#
# x = X2[,1] #After generating bivariate normal with sample n=100, and correlation of ρ=0.9
# y = X2[,2]
#
# cor.test(x,y)
#
# r = cor(x,y)
# t = r * sqrt(98)/ sqrt(1-r^2)
#
# print(t)

#
# growth <- c(2.4, 2.89, .85, 4.21, 3.02, 3.62,  1.08,  -.39, 3.86,  2.27,  .38,  1.04,  2.36,  1.72,  .1 , .95)
# vote <- c(44.6, 57.76, 49.91, 61.34, 49.60, 61.79, 48.95, 44.70, 59.17, 53.94,  46.55,  54.74, 50.27, 51.24, 46.32,  52.00)
#
# linModel = lm(vote~growth)
#
# newData = data.frame(growth= 0.2)
# summary(linModel)
#
# predict(linModel,newData,interval = "confidence",level=0.99)

ChildBMI <- c(17.10, 17.15, 17.20, 17.24, 17.25, 17.30, 17.32, 17.40, 17.60, 17.80)

ParentBMI <- c(24.62, 24.70, 25.70, 25.80, 26.20, 26.30, 26.60, 26.80, 27.20, 27.35)
