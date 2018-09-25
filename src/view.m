function view(y,size,dis="radial")
  
  plt=zeros(size,size,3);
  X=zeros(size^2,2);

  
  for i= 1:size
    for j= 1:size
      X(j+size*(i-1),1)=(i-1);
      X(j+size*(i-1),2)=(j-1);
    endfor;
  endfor; 

  
  for i=1:size
    for j= 1:size
      for k= 1:3
         plt(j,i,k)=y(j+size*(i-1),k);
      endfor;
    endfor;
   endfor;
   
  figure;     
  imshow(plt);

endfunction;