function playerHandle = drawPlayer(diverX, diverY, clock)
  % Diver image filenames
  diverImage1 = "diver1.png";  % First diver image
  diverImage2 = "diver2.png";  % Second diver image

  % Load the appropriate image based on the clock (alternating every frame)
  if mod(clock, 2) == 0
    diverImage = imread(diverImage1);  % Use the first image
  else
    diverImage = imread(diverImage2);  % Use the second image
  endif

  % Place the diver at the correct (x, y) location on the figure
  playerHandle = image([diverX diverX+size(diverImage,2)], [diverY diverY+size(diverImage,1)], diverImage);
endfunction

