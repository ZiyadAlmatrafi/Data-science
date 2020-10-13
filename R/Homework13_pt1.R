f.obj <- c(13,23,30)

f.con <- matrix(c(5,15,10,  #corn
                  4,4,4,    #hops
                  35,20,15, #malt
                  5,10,20), #hours of labor
                nrow = 4, byrow = TRUE)

f.dir <- c("<=",
           "<=",
           "<=",
           "<=")

f.rhs <- c(4800, #total corns
           160,  #total hops
           1190, #total malt
           1200) #total hours

sol<-lp("max", f.obj, f.con, f.dir, f.rhs, compute.sens = TRUE)
sol$objval
sol$solution
sol$duals
