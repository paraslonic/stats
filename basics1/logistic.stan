data {
  int<lower=0> N;
  int hired[N];
  int sex[N];
  real looks_good[N];
}


parameters {
  real a;
  real b;
//  real c;
}

model {
  // a ~ normal(0,1);
  // b ~ normal(0,1);
  // c ~ normal(0,1);
  for(i in 1:N){
      hired[i] ~ bernoulli(inv_logit(a+b*sex[i]));
  }
}

