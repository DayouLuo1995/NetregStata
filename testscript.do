/*place the netreg.ado file in your work directory*/
/*click the netreg.ado to open a new stata interface so that stata can find this netreg.ado data*/
/*************/
/*load data, data used here is the wolf data used in the R version*/
/*the path should be changed*/
use "C:\Users\win\Desktop\UW STAT\STATA_data\wolf.dta", clear
/*simple regression*/
/*n1 n2 is the subscript for node, here we assume there is no missing data in the dataset*/
 netreg Y x1 x2 n1 n2,withnode
 /*Or*/
 /*this version is available when there is no missing data in the dataset*/
 netreg Y x1 x2,n_total(16)
 /**************/
 /*with missing data£¬node coordinate is required*/
 netreg Y x1 x2 n1 n2 if Y>2,n_total(16) withnode
 /*if there are too many missing data, generate error message*/
 netreg Y x1 x2 n1 n2 if Y>20,n_total(16) withnode
/****************************/
 /*GEE regression(reweighted),using default parameters*/
 netreg Y x1 x2 n1 n2 ,n_total(16) withnode reweight
 /*GEE with missing data*/
 netreg Y x1 x2 n1 n2 if Y>2 ,n_total(16) withnode reweight
 /*restriction on iteration*/
 netreg Y x1 x2 n1 n2 if Y>2 ,n_total(16) withnode reweight maxit(1)
 /*or*/
 netreg Y x1 x2 n1 n2 if Y>2 ,n_total(16) withnode reweight tol(0.1)
 /*note that the tolerance criterion here is different from the R version*/
 /* a scale-free criterion is adapted*/
 /*******************/
 /*indirected case*/
 /*Data here is a home made data associating with a 4-elements relational data*/
 /*Assume there is no missing data in the data set*/
 /*Since it is undirected, there are only 6 unique rows of data in the data set*/
 use "C:\Users\win\Desktop\UW STAT\STATA_data\undirected.dta", clear
 netreg Y X,undirected n_total(4)
 /****************************/
 /*The following analysis will be the same as the regress command built in stata*/
