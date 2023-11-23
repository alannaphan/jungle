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
  it("Add to cart", () => {
    cy.get(".products article:first-child a");
    cy.get(':nth-child(1) > div > .button_to > .btn').click({force: true}); 
    cy.get('.end-0 > .nav-link').should('contain', '1');
  });
});
