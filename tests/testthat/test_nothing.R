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
    data <- read_csv("pollos_petrel/train.csv")
    long_tarso <- data %>%
    drop_na(Longitud_tarso)

    expected <- 1
    obtained <- split_id(long_tarso)
    expect_equal(expected, obtained)
  })
})
