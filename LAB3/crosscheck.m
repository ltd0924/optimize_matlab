function ans=crosscheck(l1,l2)
ax=l1(1);bx=l1(2);cx=l2(1);dx=l2(2);
ay=l1(3);by=l1(4);cy=l2(3);dy=l2(4);
u=(cx-ax)*(by-ay)-(bx-ax)*(cy-ay);
v=(dx-ax)*(by-ay)-(bx-ax)*(dy-ay);
w=(ax-cx)*(dy-cy)-(dx-cx)*(ay-cy);
z=(bx-cx)*(dy-cy)-(dx-cx)*(by-cy);
ans=(u*v<0)&&(w*z<0);
end