data {
  int<lower=1> N;
  int<lower=1> K;
  vector[N] y;
}

parameters {
  real mu[K];
  simplex[K] theta;
  real<lower=0> sigma[K];
}

model {
  vector[K] log_theta = log(theta);
  sigma ~ exponential(1);
  mu ~ normal(0, 2);
  for (n in 1:N) {
    vector[K] lps = log_theta;
    for(k in 1:K) {
      lps += normal_lpdf(y[n]| mu[k], sigma[k]);
    }
    target += log_sum_exp(lps);
  }
}

generated quantities {
  vector[N] log_lik;
  for (n in 1:N) {
    vector[K] lps = log(theta);
    for(k in 1:K) {
      lps += normal_lpdf(y[n]| mu[k], sigma[k]);
    }
    log_lik[n] = log_sum_exp(lps);
  }
}
