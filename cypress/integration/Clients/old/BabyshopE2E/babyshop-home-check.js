/// <reference types="cypress"/>

describe('Customer landing page', () => {
    it('BabyShop-Home', () => {
        cy.viewport(1440, 860)
        cy.visit('https://dev.textual.ai/')
        cy.get('body').click()
        ///Login
        cy.get(':nth-child(2) > input').type('babyshop-testing')
        cy.get(':nth-child(3) > input').type('d3f16a2faca642529cfa06502bbb9949')
        cy.get('.pbutton').click()

        cy.contains('Upload file with product data')
        ///cy.get(E.UPLOAD)             .should('be.visible')            .should('contain', 'Upload')

        ///cy.contains('Edit existing products')        cy.get(E.EDIT)            .should('be.visible')            .should('contain', 'Edit')

        ///cy.contains('Create new product')        cy.get(E.NEW)            .should('be.visible')            .should('contain', 'Create')

        ///cy.contains('Other options')
        ///cy.get(E.MAP)            .should('be.visible')            .should('contain', 'Map existing data')

        // Menu
        cy.contains('Upload file')
        cy.contains('New product')
        cy.contains('Product list')
        cy.contains('Generate texts')
        cy.contains('Review texts')
        cy.contains('Vocabulary list')
        cy.contains('Template list')
        cy.contains('Mappings')
        cy.contains('Manage')
        cy.contains('Publish Logs')
    })
})
