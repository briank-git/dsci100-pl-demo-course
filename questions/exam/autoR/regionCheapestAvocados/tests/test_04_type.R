## @title Contains correct type?
## @score 1

library(tinytest)                       # load testrunner
using(ttdo)                             # enable its 'diffobj' extension
library(digest)

## Get student's response
try(plr::source_and_eval_safe_with_hiding("/grade/student/student.R",
                                          NULL,
                                          "ag",
                                          "/grade/tests/ans.R"))

expect_equal(digest(cheapest$region[0]), "5152ac13bdd09110d9ee9c169a3d9237")
