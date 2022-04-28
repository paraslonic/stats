data {
  int<lower=0> N;
  vector[N] y;
}

parameters {
  real mu[2];
  real<lower=0> sigma[2];
  real<lower=0, upper = 1> alpha;
}

model {
  alpha ~ normal(0.5,0.3);
  for (n in 1:N) {
   target += log_sum_exp(log(alpha) + normal_lpdf(y[n] | mu[1], sigma[1]),
                        log(1-alpha) + normal_lpdf(y[n] | mu[2], sigma[2]));
  }
}

