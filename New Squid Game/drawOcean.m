function [imageHeight, imageWidth] = drawOcean (imageName)


  clf;


  figure(1);1



  image = imread(imageName);
  [imageHeight,imageWidth,~] = size(image);

  imshow(imageName);


 endfunction
