pkg load optim;

#change distribution
%distribution="radial";
%distribution="pie";
%distribution="horizontal";
distribution="vertical";

#chancce class, samples and lambda
dSize=100;
DClass=3;
lambda=5;


batchSize=1;

#crear datos
[X,Y]=create_data(10000,DClass,distribution);

#X with ones
X1=[ones(rows(X),1),X];


#Create initial weights
NumNeuron=4;
W1=weight(NumNeuron,columns(X1));
W2=weight(columns(Y),rows(W1)+1);

#target
%y=target(W1,W2,X1,Y);

#gradtarget
%[gW1,gW2]=gradtarget(W1,W2,X1,Y);


#training
[tW1,tW2]=training(W1,W2,X,Y,lambda,batchSize);

#calculo predict 
  %ys=predict(tW1,tW2,X1);


#Visualizacion de datos
plot_data(X,Y);
view(tW1,tW2,dSize);
