%% This code is for SVM-GA model
%This model was coded by Qiong Xiao and Peng Gao to predict the targets of tRNA derived fragments with SVM-GA model. 

clear;
load input.mat;
 
load 3test1.mat;
load 3test2.mat;
load 3test3.mat;
load 3test4.mat;
load 3test5.mat;
load 3test6.mat;
load 3test7.mat;
load 3test8.mat;
load 3test9.mat;
load 3test10.mat;
load 3test11.mat;
load 3test12.mat;
load 5test1.mat;
load 5test2.mat;
load 5test3.mat;
load 5test4.mat;
load 5test5.mat;
load 5test6.mat;
load 5test7.mat;
load 5test8.mat;
load 5test9.mat;
load 5test10.mat;
load 5test11.mat;
load 5test12.mat;
load 5test13.mat;
load 5test14.mat;
load 5test15.mat;
load 5test16.mat;

C=[Test1;Test2;Test3;Test4;Test5;Test6;Test7;Test8;Test9;Test10;Test11;Test12]
C(isnan(C)) = 0

[m,n]=find(bestchrom==1);
for i=1:length(n)
    p_train(:,i)=trainX31(:,n(i));
    p_test(:,i)=testX2(:,n(i));
end
size(trainX31,1);
new=[p_train;p_test];
[inputtrain,inputps]=mapminmax(new');
input=inputtrain';
temp=size(trainX31)+1;
p_train=input(1:size(trainX31),:);
p_test=input(temp:end,:);
[outputtrain,outputps]=mapminmax(predche1');
y=outputtrain';
[outputtrain2,outputps2]=mapminmax(prechetest');
testpre=outputtrain2';


model = svmtrain(y(1:2026,:), p_train(1:2026,:),'-c 3 -g 0.3 -b 1');
 % [predict_label, accuracy,prob_estimates] = svmpredict(y(1:2026,:), p_train(1:2026,:), model,'-b 1' );
 % [predict_label, accuracy,prob_estimates] = svmpredict(y(2027:2532,:), p_train(2027:2532,:), model,'-b 1' );
  [predict_label, accuracy,prob_estimates] = svmpredict(testpre,p_test, model,'-b 1' );
         
%fortest=[trainX11(1:2026,[1 2]) predict_label prob_estimates];   
%fortest=[trainX11(2027:2532,[1 2]) predict_label prob_estimates];
fortest=[predict_label prob_estimates];
writetable(array2table(fortest),'positive_probablity_tRF-3.csv');
 


  cmd=['-c ',num2str(3),' -g ',num2str(0.3),'-b 1'];
        model = svmtrain(y(1:2026,:), p_train(1:2026,:), cmd);
        %[predict_label, accuracy, roc] = svmpredict(y(1:2026,:), p_train(1:2026,:), model);
        %[predict_label, accuracy, roc] = svmpredict(y(2027:2532,:), p_train(2027:2532,:), model);
        [predict_label, accuracy, roc] = svmpredict(testpre,p_test,model);
        [X,Y,THRE,AUC,OPTROCPT,SUBY,SUBYNAMES]=perfcurve(prechetest,roc,'1');

fortest=[predict_label roc]; 
writetable(array2table(fortest),'SVM_score_tRF-3.csv');



 

 
 