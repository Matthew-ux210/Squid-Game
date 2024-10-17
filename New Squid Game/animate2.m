function animate2()
  % Image file names for background
  image1 = "oldYharnam.png";
  image2 = "OceanImage.png";

  % Diver initial position
  diverX = 200;  % X position of the diver
  diverY = 400;  % Y position of the diver

  % Squid and bubble variables
  squidColor = [.5 .1 .4];
  squidWidth = 5;
  squidSize = 70;
  squidForwardMove = 75;
  squidDeltaTheta = pi/4;
  squidX = 300;
  squidY = 500;
  squidTheta = 0;

  bubbleMaxRadius = 50;
  bubbleLineWidth = 3;
  bubbleLineColor = [.9 .4 .1];
  bubbleStep = 50;
  bubbleMinRadius = 5;
  numBubbles = 10;

  % Variables for background changing
  backgroundChangeInterval = randi([30, 100]);
  frameCounter = 0;
  imageHeight = 0;
  imageWidth = 0;

  % ================== Animation Loop =====================
  for clock = 1:500
    % Change background at random intervals
    if frameCounter >= backgroundChangeInterval
      if mod(clock, 2) == 0
        [imageHeight, imageWidth] = drawOcean(image1);  % Draw first background
      else
        [imageHeight, imageWidth] = drawOcean(image2);  % Draw second background
      endif
      frameCounter = 0;
      backgroundChangeInterval = randi([30, 100]); % New random interval
    endif

    % Ensure image dimensions are valid before proceeding
    if imageHeight == 0 || imageWidth == 0
      continue; % Skip the current iteration if dimensions are not set
    endif

    % Draw and animate the diver
    playerHandle = drawPlayer(diverX, diverY, clock); % Add diver to screen
    [diverX, diverY] = checkBoundary(diverX, diverY, imageWidth, imageHeight, 50); % Ensure diver stays within bounds

    % Squid movement logic
    squidX = squidX + squidForwardMove * cos(squidTheta);
    squidY = squidY + squidForwardMove * cos(squidTheta);
    squidTheta = squidTheta + squidDeltaTheta;

    % Draw squid
    squidHandle = drawSquid(squidSize, squidColor, squidWidth, clock, squidX, squidY, squidTheta);
    [squidX, squidY] = checkBoundary(squidX, squidY, imageWidth, imageHeight, squidWidth / 2);

    % Bubble animation logic
    for i = 1:numBubbles
      bubbleY(i) = bubbleY(i) - rand() * bubbleStep;
    endfor
    for i = 1:numBubbles
      if bubbleY(i) < 3 * bubbleMaxRadius
        bubbleY(i) = imageHeight - 3 * bubbleMaxRadius;
        bubbleX(i) = rand() * imageWidth;
        bubbleRadius(i) = rand() * bubbleMaxRadius + bubbleMinRadius;
      endif
    endfor

    % Drawing bubbles
    for i = 1:numBubbles
      circleHandle(i) = drawCircle(bubbleRadius(i), bubbleX(i), bubbleY(i), bubbleLineColor, bubbleLineWidth);
    endfor

    % Animation frame rate
    pause(0.1);

    % Delete previous objects before drawing the next frame
    if ishandle(squidHandle)
      delete(squidHandle);
    endif
    if ishandle(playerHandle)
      delete(playerHandle);
    endif
    for i = 1:numBubbles
      if ishandle(circleHandle(i))
        delete(circleHandle(i));
      endif
    endfor

    % Increment frame counter
    frameCounter++;

  endfor
endfunction

