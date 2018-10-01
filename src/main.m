pkg load optim;


#change distribution
distribution="radial";
#distribution="pie";
#distribution="horizontal";
#distribution="vertical";

#chancce class and samples
size=100;
class=4;


#crear datos
[X,Y]=create_data(size^2,class,distribution);

#X with ones
X1=[ones(rows(X),1),X];

#Create initial weights
NumNeuron=4;
W1=weight(NumNeuron,columns(X1));
W2=weight(columns(Y),rows(W1)+1)

#Calculo de target
y=target(W1,W2,X1,Y);

#Calculo de gradtarget
[gW1,gW2]=gradtarget(W1,W2,X1,Y)


#training

[tW1,tW2]=training(W1,W2,Xtrain,Ytrain,lambda);

#calculo predict 
Y=predict(tW1,tW2,X1);


#Visualizacion de datos
view(Y,size);
