describe("nothing", {
  it("return 1", {
    expected <- 1
    obtained <- return_one()
    expect_equal(expected, obtained)
  })
})