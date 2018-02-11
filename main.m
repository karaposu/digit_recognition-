clear all
clc
close all
%% 
load('mnist_all.mat')
for i=1:4000
pic1set(i,:)=train1(i,:);
pic2set(i,:)=train2(i,:);
pic3set(i,:)=train3(i,:);
pic4set(i,:)=train4(i,:);
pic5set(i,:)=train5(i,:);
pic6set(i,:)=train6(i,:);
pic7set(i,:)=train7(i,:);
pic8set(i,:)=train8(i,:);
pic9set(i,:)=train9(i,:);
end




figure(1)
for i = 1:10      
   pics=pic1set(i,:);  
   pics= test_sample2pic(pics);
    subplot(5,2,i)      ;                        % plot them in 6 x 6 grid
    imshow(pics);
                           % show the image
                    % show the label
end

figure(2)
for i = 1:10      
   pics=pic2set(i,:);  
   pics= test_sample2pic(pics);
    subplot(5,2,i)                              % plot them in 6 x 6 grid
    imshow(pics)
                           % show the image
                    % show the label
end



pic1set=pic1set' ;
pic2set=pic2set' ;

pic3set=pic3set' ;
pic4set=pic4set' ;


pic5set=pic5set' ;
pic6set=pic6set' ;

pic7set=pic7set' ;
pic8set=pic8set' ;

pic9set=pic9set' ;

 
pic1set=binary_convertor(pic1set);

pic2set=binary_convertor(pic2set);

pic3set=binary_convertor(pic3set);

pic4set=binary_convertor(pic4set);

pic5set=binary_convertor(pic5set);

pic6set=binary_convertor(pic6set);

pic7set=binary_convertor(pic7set);

pic8set=binary_convertor(pic8set);
pic9set=binary_convertor(pic9set);

all_data_here=[pic1set pic2set  pic3set pic4set pic5set pic6set pic7set pic8set pic9set  ];
v=[ 1 1 1 1 1 1 1 1 1 ];
v=diag(v);


u1=repmat(v(:,1),1,4000);
u2=repmat(v(:,2),1,4000);
u3=repmat(v(:,3),1,4000);
u4=repmat(v(:,4),1,4000);
u5=repmat(v(:,5),1,4000);
u6=repmat(v(:,6),1,4000);
u7=repmat(v(:,7),1,4000);
u8=repmat(v(:,8),1,4000);
u9=repmat(v(:,9),1,4000);



train_target=[ u1 u2 u3 u4 u5 u6 u7 u8 u9]; 

% 
% train_target=[ zeros(1,4000)  ones(1,4000) 2*ones(1,4000) 3*ones(1,4000) 4*ones(1,4000) 5*ones(1,4000) 6*ones(1,4000) 7*ones(1,4000) 8*ones(1,4000)];
% 

%% 2

%trainFcn = 'trainscg';                          % use scaled conjugate gradient for training
trainFcn = 'trainbr';
% hiddenLayerSize = [80 20];  
 hiddenLayerSize = 10; 
net = patternnet(hiddenLayerSize);              % create Pattern Recognition Network
%net = feedforwardnet (hiddenLayerSize)
net.trainParam.max_fail = 6;
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
 %net.performFcn = 'crossentropy';
  net.performFcn = 'mse';
  % net.performFcn = 'traingd';

net.trainParam.min_grad= 1e-10 ;
[net,tr] = train(net,all_data_here,train_target);
 net.trainParam.lr = 0.1;

net.divideParam.trainRatio = 80/100;
net.divideParam.valRatio = 5/100;
net.divideParam.testRatio = 15/100;


% 'trainlm' is usually fastest.
% 'trainbr' takes longer but may be better for challenging problems.
% 'trainscg' uses less memory. NFTOOL falls back to this in low memory situations.
%trainFcn = 'trainbr';  % Bayesian Regularization
% net.divideParam.trainRatio = 70/100;
% net.divideParam.valRatio = 15/100;
% net.divideParam.testRatio = 15/100;
% %TRAINING PARAMETERS
% net.trainParam.show=50;  %# of ephocs in display
% net.trainParam.lr=0.05;  %learning rate
% net.trainParam.epochs=10000;  %max epochs
% net.trainParam.goal=0.05^2;  %training goal
%net = feedforwardnet (hiddenLayerSize,trainFcn);
% 
% 
% mlp=feedforwardnet([100  50] );
% 
% mlp.layers{1}.transferFcn='tansig';
% mlp.layers{2}.transferFcn='tansig';
% %mlp.layers{3}.transferFcn='tansig';
% 
% mlp.trainFcn='trainscg';
% mlp.performFcn='mse';
% mlp.trainParam.min_grad= 1e-10 ;
% mlp.trainParam.showWindow=true;
% mlp.trainParam.epochs=10000;
% mlp.trainParam.time=inf;
% mlp.trainParam.goal=0;
% 
% view(mlp)
%  mlp = train(mlp,all_data_here,train_target);








%% test here


% M = double(imread('number.png')); % import the image as double matrix; we don´t like uint8
% test_image = reshape(M(:,:,1),[784,1]); % greyscale image of size 784x1
% test_image = abs(test_nr-255)/255; % negative of this image


test_folder = 'C:\Users\enesk\Desktop\w-s\nn-matlab\50piksel\28piksel'; % folder with big images


files_t= dir(fullfile(test_folder));

test_images{1}=imread(char(join( (test_folder)+"\"+files_t(5).name ) ) );
test_images{2}=imread(char(join( (test_folder)+"\"+files_t(6).name ) ) );
test_images{3}=imread(char(join( (test_folder)+"\"+files_t(7).name ) ) );
test_images{4}=imread(char(join( (test_folder)+"\"+files_t(8).name ) ) );




test_images{1}=binary_convertor(test_images{1});
test_images{2}=binary_convertor(test_images{2});
test_images{3}=binary_convertor(test_images{3});
test_images{4}=binary_convertor(test_images{4});
figure('Name','Yatay Veri Seti')
for b=1:4
subplot(4,1,b)
    imshow(  test_images{b}  )
 
end

test_pic_data= row_and_col_values_of_img (test_images{1})  ;
test_pic_data2= row_and_col_values_of_img (test_images{2})  ;
test_pic_data3= row_and_col_values_of_img (test_images{3})  ;
test_pic_data4= row_and_col_values_of_img (test_images{4})  ;

s=row_and_col_values_of_img (test_images{1})  ;
s2=row_and_col_values_of_img (test_images{2})  ;
s3=row_and_col_values_of_img (test_images{3})  ;
s4=row_and_col_values_of_img (test_images{4})  ;

s=s';
s2=s2';
s3=s3';
s4=s4';

net(s)
net(s2)
net(s3)
net(s4)

 print_result_array_target( net(s) )
  print_result_array_target( net(s2) )
   print_result_array_target( net(s3) )
  print_result_array_target( net(s4) )






