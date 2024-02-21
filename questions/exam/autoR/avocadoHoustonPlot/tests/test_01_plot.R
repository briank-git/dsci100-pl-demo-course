library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension

plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                      NULL,
                                      "ag",
                                      "/grade/tests/ans.R")

avocado_plot
