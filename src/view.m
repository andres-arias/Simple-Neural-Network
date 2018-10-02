function view(tW1,tW2,size)

Xs=zeros(size^2,2);
  for i= 1:size
    for j= 1:size
      Xs(j+size*(i-1),1)=(i-1);
      Xs(j+size*(i-1),2)=(j-1);
    endfor;
  endfor; 

m=2/(size-1);
Xm=m*Xs -1;
Xm=[ones(rows(Xm),1),Xm];

#calculo predict 
ys=predict(tW1,tW2,Xm);

  for i=1:size
    for j= 1:size
      for k= 1:3
         plt(j,i,k)=ys(j+size*(i-1),k);
      endfor;
    endfor;
   endfor;
   
  figure;     
  imshow(plt);

endfunction;
