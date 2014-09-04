clc;clear
nPeformance=1000;
lambda_opt=2
Etest=zeros(nPeformance,1);
parfor i=1:nPeformance
  Etest(i,1)=order8_digit(lambda_opt);
end
Etest_final=mean(Etest,1)