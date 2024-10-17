function [newX,newY] = checkBoundary (X,Y,oceanWidth,oceanHeight,objectRadius)


newX = X;
newY = Y;


  if (X > oceanWidth - objectRadius)
    newX = objectRadius;
  elseif (X < objectRadius)
    newX = oceanWidth - objectRadius;
  endif

  if (Y < objectRadius)
    newY = oceanHeight - objectRadius;
  elseif (Y > oceanHeight - objectRadius)
    newY =  objectRadius;
  endif

  endfunction
