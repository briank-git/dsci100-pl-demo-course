## @title Is the plot equal to the reference plot?
## @score 1

library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension

plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                      NULL,
                                      "ag",
                                      "/grade/tests/ans.R")
                                      
avocado_plot_student <- avocado_plot

source("/grade/tests/ans.R")

expect_equal_with_diff(avocado_plot_student, avocado_plot)