## @title Do we find object 'avocado_plot'?
## @score 1

library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension

plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                      NULL,
                                      "ag",
                                      "/grade/tests/ans.R")

expect_true(exists("avocado_plot"))
