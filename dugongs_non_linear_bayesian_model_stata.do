***load the data
cd "~/nonlinear_bayesian_model"
insheet using "Dugongs.csv" , clear

*****model1
bayesmh length ,dots(1000) ///
rseed(12345) saving(nl_growth_model1, replace) mcmcsize(25000) burnin(5000) thinning(9) ///
likelihood(normal({var})) ///
prior({length:_cons}, density({alpha}-{beta}*{gamma}^age)) ///
prior({alpha}, flat)  ///
prior({beta}, flat) ///
prior({gamma}, uniform(0.5,1.0)) ///
block({beta} {alpha} {gamma} ) blocksummary ///
prior({var},igamma(0.001, 0.001))

 

bayesstats ess _all
bayesgraph diagnostics _all
bayesgraph matrix _all

 
****model2 - with more ierations
bayesmh length ,dots(1000) ///
rseed(2468) saving(nl_growth_model2, replace) mcmcsize(100000) burnin(5000) thinning(9) ///
likelihood(normal({var})) ///
prior({length:_cons}, density({alpha}-{beta}*{gamma}^age)) ///
prior({alpha}, normal(0,1000))  ///
prior({beta},igamma(0.001,0.001)) ///
prior({gamma}, beta(0.5,1.0)) ///
block({beta} {alpha} {gamma} ) blocksummary ///
prior({var},igamma(0.001, 0.001))

 

bayesstats ess _all
bayesgraph diagnostics _all
bayesgraph matrix _all
