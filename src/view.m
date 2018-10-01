function view(y,size)
  
  plt=zeros(size,size,3);


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
