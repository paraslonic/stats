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
  real pretty_thresh;
}


model {
  a ~ normal(0,1);
  b ~ normal(0,1);
  c[1] ~ normal(0,1);
  c[2] ~ normal(0,1);
  
  pretty_thresh ~ normal(0, 1);
  for(i in 1:N){
    
    if(looks_good[i] > pretty_thresh) {
      hired[i] ~ bernoulli_logit(a+b*sex[i]+c[1+sex[i]]);  
    } else {
      hired[i] ~ bernoulli_logit(a+b*sex[i]);
    }
    
  }
}

