
data {
  int N; // samples
  int D; // predictors
  int K; // categories
  int rassa[N];
  matrix[N, D] x;
} 

parameters {
  matrix[D, K] beta;
}


model {
 matrix[N, K] x_beta = x * beta; 
 to_vector(beta) ~ normal(0, 3);
 
 for(i in 1:N){
  rassa[i] ~ categorical(softmax(x_beta[i]'));
  }
}
