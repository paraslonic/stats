
data {
  int N; // samples
  int D; // predictors
  int K; // categories
  int rassa[N];
  matrix[N, D] x;
} 


parameters {
  matrix[D, K-1] beta_raw;
}

transformed parameters {
  matrix[D,K] beta;
  matrix[N, K] x_beta;
  beta = append_col(beta_raw, rep_vector(0, D));  
  x_beta = x * beta; 
}

model {
 to_vector(beta_raw) ~ normal(0, 3);
 
 for(i in 1:N){
  rassa[i] ~ categorical(softmax(x_beta[i]'));
  }
}
