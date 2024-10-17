function [imageWidth, imageHeight] = drawBackground(imageName)


  clf;


  figure(1);


  image = imread(imageName);
  [imageWidth,imageHeight] = size(image);

  axis image;
  axis off;

  imshow(imageName);


 endfunction
