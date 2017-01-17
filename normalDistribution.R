setwd("C:/Sam/Second Year/BME 213/R Code")

library(tidyr)
library(dplyr)
library(ggplot2)

n.samples <- 3
n <- 3

#Normal distribution for Poisson distribution
lambda <- 5
pois.df = data.frame(sample = 1:n.samples, n=n)
pois.f <- function(n) mean(rpois(n, lambda))

pois.d <- pois.df %>%
  group_by(sample) %>%
  mutate(average = pois.f(n))

plot(density(pois.d$average))

#Normal distribution for uniform distribution
uni.df = data.frame(sample = 1:n.samples, n=n)
uni.f <- function(n) mean(runif(n, 0, 1))

uni.d <- uni.df %>%
  group_by(sample) %>%
  mutate(average = uni.f(n))

plot(density(uni.d$average))

#Normal distribution for binomial distribution
bin.df = data.frame(sample = 1:n.samples, n=n)
bin.f <- function(n) mean(rbinom(n, n.samples, 0.65))

bin.d <- bin.df %>%
  group_by(sample) %>%
  mutate(average = bin.f(n))

plot(density(bin.d$average))

#Normal distribution for negative binomial distribution
neg.df = data.frame(sample = 1:n.samples, n=n)
neg.f <- function(n) mean(rnbinom(n, n.samples, 0.65))

neg.d <- neg.df %>%
  group_by(sample) %>%
  mutate(average = neg.f(n))

plot(density(neg.d$average))

#Normal distribution for hypergeometric distribution
hyp.df = data.frame(sample = 1:n.samples, n=n)
hyp.f <- function(n) mean(rhyper(n, 94, 46, 20))

hyp.d <- hyp.df %>%
  group_by(sample) %>%
  mutate(average = hyp.f(n))

plot(density(hyp.d$average))

#Normal distribution for beta distribution
beta.df = data.frame(sample = 1:n.samples, n=n)
beta.f <- function(n) mean(rbeta(n, 5, 8))

beta.d <- beta.df %>%
  group_by(sample) %>%
  mutate(average = beta.f(n))

plot(density(beta.d$average))