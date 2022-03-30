data {
  int<lower=0> N;
  int hired[N];
  int sex[N];
  real looks_good[N];
}


parameters {
  real a;
  real b;
  real c[2];
}

model {
  a ~ normal(0,1);
  b ~ normal(0,1);
  c[1] ~ normal(0,1);
  c[2] ~ normal(0,1);
  for(i in 1:N){
      hired[i] ~ bernoulli(inv_logit(a+b*sex[i]+c[1+sex[i]]*looks_good[i]));
  }
}

