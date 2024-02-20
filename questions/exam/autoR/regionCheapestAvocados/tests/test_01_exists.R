## @title Do we find object 'cheapest'?
## @score 1

library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension

try(plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                          NULL,
                                          "ag",
                                          "/grade/tests/ans.R"))

expect_true(exists("cheapest"))
