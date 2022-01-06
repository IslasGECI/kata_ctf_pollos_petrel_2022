describe("nothing", {
  it("return 1", {
    expected <- 1
    obtained <- return_one()
    expect_equal(expected, obtained)
  })
})

describe("split id", {
  it("return splitted id from data", {
    set.seed(20220106)
    long_tarso <- data.frame(id = 1:10)

    expected <- c(5,4,8,2,7,9,10,3)
    obtained <- split_id(long_tarso)
    expect_equal(expected, obtained)
  })
})
