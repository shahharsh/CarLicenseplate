clc;clear all;close all;
pp=input('Enter the image number =');
while(pp>0)
tic
s=num2str(pp);s1=[s '.jpg'];
f=imread(s1);
f=imresize(f,[480 640]);
f=rgb2gray(f);
T=graythresh(f);
T=0.2;
[gv t]=edge(f,'sobel','vertical');
%figure,imshow(gv);
se=strel('rectangle',[10 40]);
MF1=imclose(gv,se);
%figure,imshow(MF1);
se=strel('rectangle',[10 40]);
MF2=imopen(MF1,se);
%figure,imshow(MF2);
se=strel('line',50,90);
MF3=imopen(MF2,se);
%figure,imshow(MF3);
MF4=imsubtract(MF2,MF3);
%figure,imshow(MF4);
se=strel('rectangle',[10 60]);
MF5=imopen(MF4,se);
%figure,imshow(MF5);
[L Ne]=bwlabel(MF5);
%% Measure properties of image regions
propied=regionprops(L,'BoundingBox');
hold on
%% Plot Bounding Box
for n=1:size(propied,1)
    rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',2)
end
hold off
%% Objects extraction
%figure
for kl=1:12
      [r,c] = find(L==kl);
      m=length(r);n=length(c);
      cnt1=0;cnt2=0;
for j=1:480
    for i=1:m
        if(r(i)==j)
            cnt1=cnt1+1;
            break;
        end
    end
end
for j=1:640
    for i=1:n
        if(c(i)==j)
            cnt2=cnt2+1;
            break;
        end
    end
end
if(cnt1<10 || cnt2<80)
    continue;
elseif(cnt1>60 || cnt2>300)
    continue;
% elseif((cnt1/cnt2)<0.2)
%     continue;
elseif((cnt2-cnt1)<20)
    continue;
else
    n1=f(min(r):max(r),min(c):max(c));
    subplot(6,2,kl);
    imshow(n1);
    title(['lp candidate no. ',num2str(kl)]);
end
if(kl==1)
    aa=n1;
elseif(kl==2)
    ab=n1;
elseif(kl==3)
    ac=n1;
elseif(kl==4)
    ad=n1;
elseif(kl==5)
    ae=n1;
elseif(kl==6)
    af=n1;
elseif(kl==7)
    ag=n1;
elseif(kl==8)
    ah=n1;
elseif(kl==9)
    ai=n1;
elseif(kl==10)
    aj=n1;
elseif(kl==11)
    ak=n1;
elseif(kl==12)
    al=n1;
end
end
kk=input('Enter the lp candidate no.');
if(kk==1)
    figure,imshow(aa);
elseif(kk==2)
    figure,imshow(ab);
elseif(kk==3)
    figure,imshow(ac);
elseif(kk==4)
    figure,imshow(ad);
elseif(kk==5)
    figure,imshow(ae);
elseif(kk==6)
    figure,imshow(af);
elseif(kk==7)
    figure,imshow(ag);
elseif(kk==8)
    figure,imshow(ah);
elseif(kk==9)
    figure,imshow(ai);
elseif(kk==10)
    figure,imshow(aj);
elseif(kk==11)
    figure,imshow(ak);
elseif(kk==12)
    figure,imshow(al);
end
toc
clear all;
pp=input('Enter the image no=>');
close all
end