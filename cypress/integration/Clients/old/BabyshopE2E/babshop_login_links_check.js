/// <reference types="cypress"/>

describe('Customer landing page', () => {
    it('Check login and links ', function() {
        cy.viewport(1440, 860)
        cy.visit('https://dev.textual.ai/')
        cy.get('body').click()
        ///Login
        cy.get(':nth-child(2) > input').type('babyshop-testing')
        cy.get(':nth-child(3) > input').type('d3f16a2faca642529cfa06502bbb9949')
        cy.get('.pbutton').click()
         //Check logged in 
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')
       
        /// Check other options
        cy.get('h3')
            .should('be.visible')             
            .should('contain', 'Other')
        
        /// Check present links
        cy.contains('Upload file with product data')
            .should('not.be.hidden')
        
        cy.contains('Edit existing products')
            .should('not.be.false')
        
        cy.contains('Create new product')    
        .should('not.be.null')
        .should('contain', 'new')

        cy.contains('Map existing data')
        .should('not.be.disabled')
        
        cy.get('[title="Menu"] > .material-icons')
        .should('not.be.disabled')

          })

})
