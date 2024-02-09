## @title Contains correct data?
## @score 1

library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension
library(digest)

## Get student's response
plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                      NULL,
                                      "ag",
                                      "/grade/tests/ans.R")

expect_equal(digest(int_round(unlist(select(cheapest, -region)), 2)), 'bd15e8575c605a44f323d2c67cbfd7f1')