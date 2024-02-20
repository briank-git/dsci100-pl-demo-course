## @title Contains correct data?
## @score 1

library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension
library(digest)

## Get student's response
try(plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                          NULL,
                                          "ag",
                                          "/grade/tests/ans.R"))

int_round <- function(x, digits){
    x = x*10^digits
    xint = as.integer(x)
    xint1 = xint + 1L
    if (abs(xint - x) < abs(xint1 - x)){
        return(xint)
    }
    else {
        return(xint1)
    }
}

expect_equal(digest(int_round(unlist(select(cheapest, -region)), 2)), 'bd15e8575c605a44f323d2c67cbfd7f1')
