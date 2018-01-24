vid=videoinput('winvideo',1,'YUY2_640x480')
preview(vid);
vid.ReturnedColorSpace='rgb';

while 1>0
f1=getsnapshot(vid);
pause(1);
vid.ReturnedColorSpace='rgb';
f2=getsnapshot(vid);
f1b=rgb2gray(f1);
f2b=rgb2gray(f2);
g=f2b-f1b;
f=f1b-f2b;

%imtool(f1);imtool(f2);%imtool(f1b);
%imtool(f2b);
imtool(f);
ff=im2bw(f,0.3);
gg=im2bw(g,0.3);
%imtool(ff);
[x,y]=size(ff);

lw=0;rw=0;cw=0;glw=0;grw=0;gcw=0;

for i=1:x
for j=1:213
if gg(i,j)==1
glw=glw+1;
end
end
end

for i=1:x
for j=213:426
if gg(i,j)==1
gcw=gcw+1;
end
end
end

for i=1:x
for j=426:640
if gg(i,j)==1
grw=grw+1;
end
end

end

for i=1:x
for j=1:213
if ff(i,j)==1
lw=lw+1;
end
end
end
for i=1:x
for j=213:426
if ff(i,j)==1
cw=cw+1;
end
end
end

for i=1:x
for j=426:640
if ff(i,j)==1
rw=rw+1;
end
end
end

if (cw-lw)>50&&(glw>gcw)
trans='d'
else if (cw-rw)>50&&(grw>gcw)
trans='a'
else if (rw-cw)>50
trans='d'
else if (lw-cw)>50
trans='a'
else
trans='w'
end
end
end
end
% s=serial('COM9','BaudRate',9600,'Parity','none');
% fopen(s);
% fprintf(s,trans);
% fclose(s);
end
stop(vid),delete(vid),clear vid;
