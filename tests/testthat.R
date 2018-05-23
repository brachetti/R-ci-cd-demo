library(testthat)
library(rcicddemo)

# test_check("rcicddemo")
test_check("rcicddemo",
           reporter = JunitReporter$new(file = "result.xml"))
