const E = {
    UPLOAD: ':nth-child(1) > .actions > .pbutton',
    EDIT: ':nth-child(2) > .actions > .pbutton',
    NEW: ':nth-child(3) > .actions > .pbutton',
    MAP: '.other > ul > li > a',
    MENU: '[title=Menu]',
}

describe('Customer landing page', () => {
    it('Has links', () => {
        cy.textualLogin('babyshop', '/d/babyshop')

        cy.contains('Upload file with product data')
        cy.get(E.UPLOAD)
            .should('be.visible')
            .should('contain', 'Upload')

        cy.contains('Edit existing products')
        cy.get(E.EDIT)
            .should('be.visible')
            .should('contain', 'Edit')

        cy.contains('Create new product')
        cy.get(E.NEW)
            .should('be.visible')
            .should('contain', 'Create')

        cy.contains('Other options')
        cy.get(E.MAP)
            .should('be.visible')
            .should('contain', 'Map existing data')

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
