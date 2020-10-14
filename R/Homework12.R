
p <- matrix(c(.02,.04,.01,.06,.15,.15,.02,.20,.14,.10,.10,.01),ncol=4) 
p

px <- apply(p,1,sum)
px
py <- apply(p,2,sum)
py

# Exercise: Display P(Y=0) and P(Y=15)
p[,1] #P(Y=0)

p[,4] #P(Y=15)

# Computing conditional probabilities
# For example, to compute:
# P(X=5|Y=5) = 0.150/0.36 = 0.4166667
p_x5_y5 <- p[2,2]/py[2]  ## computes conditional probability P(X=5|Y=5)
p_x5_y5                  ## to display this conditional probability

# Compute P(X=0|Y=5) and P(X=10|Y=5)
p_x0_y5<- p[1,2]/py[2]  ## computes P(X=0|Y=5)
p_x0_y5 

p_x10_y5 <- p[3,2]/py[2]  ## computes conditional probability P(X=10|Y=5)
p_x10_y5

p_x_y5 <- c(p_x0_y5,p_x5_y5,p_x10_y5)
p_x_y5



# Decision Tree Demo with Titantic Data
# Packages needed
library(tidyverse)
library(readr)
library(dplyr)
library(party)
library(rpart)
library(rpart.plot)
library(ROCR)
set.seed(100)

titanic3 <- "https://goo.gl/At238b" %>%
  read_csv %>% # read in the data
  select(survived, embarked, sex, 
         sibsp, parch, fare) %>%
  mutate(embarked = factor(embarked),
         sex = factor(sex))

.data <- c("training", "test") %>%
  sample(nrow(titanic3), replace = TRUE) %>%
  split(titanic3, .)
rtree_fit <- rpart(survived ~ ., 
                   .data$training)

rpart.plot(rtree_fit) 

tree_fit <- ctree(survived ~ ., 
                  data = .data$training)
plot(tree_fit)

tree_roc <- tree_fit %>%
  predict(newdata = .data$test) %>%
  prediction(.data$test$survived) %>%
  performance("tpr", "fpr")

plot(tree_roc)
