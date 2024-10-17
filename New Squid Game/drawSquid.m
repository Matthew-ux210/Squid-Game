function squidHandle = drawSquid (squidSize, color, width, clock, Dx, Dy, squidTheta)



    squid = getSquid(squidSize,clock);



    R = getRotate(squidTheta);
    squid = R*squid;

    % get the squid
    T = getTranslate(Dx,Dy);
    squid = T*squid;


  % draw squid body
  p1 = squid(:,1);
  p2 = squid(:,2);
  p3 = squid(:,3);

  % draw squid left leg
  p4 = squid(:,4);
  p5 = squid(:,5);
  p6 = squid(:,6);

  %draw squid right leg
  p7 = squid(:,7);
  p8 = squid(:,8);
  p9 = squid(:,9);

   squidHandle(1) = drawLine(p1,p2,color,width);
   squidHandle(2) = drawLine(p2,p3,color,width);
   squidHandle(3) = drawLine(p3,p1,color,width);
   squidHandle(4) = drawLine(p4,p5,color,width);
   squidHandle(5) = drawLine(p5,p6,color,width);
   squidHandle(6) = drawLine(p7,p8,color,width);
   squidHandle(7) = drawLine(p8,p9,color,width);




endfunction

