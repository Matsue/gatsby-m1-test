describe("Root", () => {
  it("matches image snapshot", () => {
    cy.visit("/")

    cy.matchImageSnapshot()
  })
})
