/// <reference types="cypress"/>


it('BABYSHOPTEST', function() {

    cy.viewport(1440, 860)
    cy.visit('https://dev.textual.ai/')
    cy.get('body').click()
    cy.get(':nth-child(2) > input').type('babyshop-testing')
    cy.get(':nth-child(3) > input').type('d3f16a2faca642529cfa06502bbb9949')
    cy.get('.pbutton').click()
    cy.get(':nth-child(2) > .actions > .pbutton').click()
    cy.get('[data-action="create-product"]').click()
    cy.get('#id_name').type('testing')
    cy.get('#id_original_headline').type('This is a test')
    ///cy.get('#id_external_id').type('test123')
    cy.get('#id_original_text').type('original text')
    cy.get('.single-input').type('dress (klänning)')
    cy.get('.global-search > .vocabulary-lookup > .input-container > .input-wrapper > .multi-input').type('gold (guld)')

    ///cy.get('.row-color > .vocabulary-lookup > .input-container > .input-wrapper > .multi-input').type('gold (guld)')
    ///cy.get('.row-color > .vocabulary-lookup > .input-container > .input-wrapper > .multi-input')

})
