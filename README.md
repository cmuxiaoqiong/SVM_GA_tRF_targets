# SVM_GA_tRF_targets
predicting the targets of tRNA-derived fragments (tRFs) by SVM and GA
## The introduction of the SVM-GA model 
This model was coded by Qiong Xiao and Peng Gao, and this SVM-GA was applied to predict the target of tRFs .
## The installation of the SVM-GA model 
We need to install 64bit MATLAB 2016a based on Windows systems and the model was built based on Libsvm Version 3.23 released on July 15, 2018 which is coded by Chih-Chung Chang and Chih-Jen Lin (http://www.csie.ntu.edu.tw/~cjlin/libsvm).
## The variables of the SVM-GA model 
The model requires following input file: 
SVMtest2.m:
----- the code for SVM training

input.mat:
----- trainX31 contains the information of 96 features for 2532 pairs to train in the SVM-GA model. 2532 pairs include 533 positive pairs and 2000 negative pairs. 2000 negative pairs are randomly selected from the pairs with the most 3P-seq tags.(The selecting process are implemented in R 3.5.3 with the seed 20190601)
predche1 contains the categories for these 2532 pairs
bestchrom contains the features selected by GA to train in the SVM model

The tRF-3 input files: 3test1.mat, 3test2.mat, 3test3.mat, 3test4.mat, 3test5.mat, 3test6.mat, 3test7.mat, 3test8.mat, 3test9.mat, 3test10.mat, 3test11.mat
The tRF-5 input files: 5test1.mat, 5test2.mat, 5test3.mat, 5test4.mat, 5test5.mat, 5test6.mat, 5test7.mat, 5test8.mat, 5test9.mat, 5test10.mat, 5test11.mat, 5test12.mat, 5test13.mat, 5test14.mat, 5test15.mat, 5test16.mat:
-----all the transcripts with seed matches to the tRFs in the 3’-UTR region. All these pairs are put into model to calculate the positive probability 
## The Results of the SVM-GA model 
The model will calculate a predictive score and positive probability for each site with seed matches to the tRF. The potential target with positive probability more than 0.5 is predicted as targets for tRF.
