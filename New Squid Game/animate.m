function animate()

  image1 = "oldYharnam.png";
  image2 = "OceanImage.png";
  [imageHeight,imageWidth] = drawOcean(image1);


  %Default Variables
  color = [.2 .1 .6];
  width = 2;
  squidSize = 50;
  squidStep = 50;
  maxRadius = 40;
  radius = maxRadius*rand();
  xCenter = 500;
  yCenter = 1000;
  circleColor = [.1 .3 .9];
  circleLineWidth = 10;
  DyCircle = 60;
  Dx = 300;
  Dy = 200;


%Bubble Variables
  bubbleMaxRadius= 50;
  bubbleLineWidth = 3;
  bubbleLineColor = [.1 .4 .9];
  bubbleStep = 50;
  bubbleMinRadius = 5;
  numBubbles = 10;

%Bubble Loop
  for i = 1:  numBubbles
    bubbleRadius(i) = rand() * bubbleMaxRadius + bubbleMinRadius;
    bubbleX(i) = rand() * imageWidth;
    bubbleY(i) = imageHeight;

  endfor

%Squid Variables
    squidColor = [.5 .1 .4]
    squidWidth = 3;
    squidSize = 70;
    squidForwardMove = 75;
    squidDeltaTheta = pi/4;

    % squid location
    squidX = 300;
    squidY = 500;
    squidTheta = 0;


% ================== Animate Loop =====================

for( clock = 1:500 )

    if mod(clock, 2) == 0
      [imageHeight, imageWidth] = drawOcean(image1);
    else
      [imageHeight, imageWidth] = drawOcean(image2);
    endif


theta = squidTheta;

R = getRotate(squidTheta);
squid = getSquid (squidSize,clock)
squid = R*squid;


yCenter = yCenter - DyCircle;


%Squid Movement
  squidX = squidX + 75;
  %squidY = squidY + 100;
  squidY = squidY + squidForwardMove*cos(squidTheta);
   squidTheta = squidTheta + squidDeltaTheta;
   squidX = squidX + squidForwardMove*cos(squidTheta);
   squidY = squidY + squidForwardMove*cos(squidTheta);



%Draw Squid
   squidHandle = drawSquid(squidSize,squidColor,squidWidth,clock,squidX,squidY,squidTheta);
   [squidX,squidY] = checkBoundary(squidX,squidY,imageWidth,imageHeight,squidWidth/2);


%Lift Bubbles
    for i=1: numBubbles
    bubbleY(i) = bubbleY(i) - rand()*bubbleStep;
 endfor


 for i=1: numBubbles
   if(bubbleY(i)<3*bubbleMaxRadius)
   bubbleY(i) = imageHeight - 3*bubbleMaxRadius;
   bubbleX(i) = rand() * imageWidth;
   bubbleRadius(i) = rand()*bubbleMaxRadius + bubbleMinRadius;
   endif

endfor


[xCenter,yCenter] = checkBoundary (xCenter,yCenter,imageWidth,imageHeight,radius)

[Dx, Dy] = checkBoundary (Dx,Dy,imageWidth,imageHeight,2*squidSize)




  if (yCenter - 2*radius < 0)
    yCenter = imageHeight-2*radius
  endif



for i = 1:  numBubbles
    circleHandle(i) = drawCircle (bubbleRadius(i), bubbleX(i), bubbleY(i), bubbleLineColor, bubbleLineWidth)

  endfor


pause(.1)


 for i=1: numBubbles
   delete(circleHandle(i));
 endfor

  delete(squidHandle);



  endfor

endfunction
