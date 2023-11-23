describe("Home Page", () => {
  it("successfully loads", () => {
    cy.visit("/");
  });
  it("There is products on the page", () => {
    cy.get(".products article").should("be.visible");
  });
  it("There is 2 products on the page", () => {
    cy.get(".products article").should("have.length", 2);
  });
  it("Click on the first product", () => {
    cy.get(".products article:first-child a").click();
  });
});
