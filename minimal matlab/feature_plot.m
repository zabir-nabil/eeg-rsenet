cnt = 1;
for feature1 = 1:3
    for feature2 = 7:10

legx = [];
legy = [];
right_handx = [];
right_handy = [];
left_handx = [];
left_handy = [];

li = 0;
lhi = 0;
rhi = 0;


for i = 1:450
    if red_hb(i,feature2)<.01
        %continue;
    end
    if red_hb(i,11)==3
        li = li+1;
        legx(li) = red_hb(i,feature1);
        legy(li) = red_hb(i,feature2);
    end
    if red_hb(i,11)==1
        lhi = lhi+1;
        left_handx(lhi) = red_hb(i,feature1);
        left_handy(lhi) = red_hb(i,feature2);
    end
    if red_hb(i,11)==2
        rhi = rhi+1;
        right_handx(rhi) = red_hb(i,feature1);
        right_handy(rhi) = red_hb(i,feature2);
    end
end

figure(cnt)
cnt = cnt + 1;
%legy(35) = 45; % random


x = legx;
y = legy;
sz = 40;
scatter(x,y,sz,'MarkerEdgeColor',[0.7 0.2 0],...
              'MarkerFaceColor',[0.9 0.1 0],...
              'LineWidth',1.5)
          
hold on,

x = left_handx;
y = left_handy;
sz = 40;
scatter(x,y,sz,'MarkerEdgeColor',[0.2 0.7 0],...
              'MarkerFaceColor',[0.1 0.9 0],...
              'LineWidth',1.5)


x = right_handx;
y = right_handy;
sz = 40;
scatter(x,y,sz,'MarkerEdgeColor',[0 0.2 0.7],...
              'MarkerFaceColor',[0 0.1 0.9],...
              'LineWidth',1.5)          
          
          
title('Hybrid Dataset')
feature_1 = sprintf('Feature %d',feature1);
feature_2 = sprintf('Feature %d',feature2);
xlabel(feature_1)
ylabel(feature_2)
    end
end
        