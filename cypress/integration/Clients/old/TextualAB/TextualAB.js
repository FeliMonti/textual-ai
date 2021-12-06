/// <reference types="cypress"/>

describe('Customer landing page', () => {
    it('Check login', function() {
        cy.viewport(1440, 860)
        cy.visit('https://dev.textual.ai/')
        cy.get('body').click()
        //Login
        cy.get(':nth-child(2) > input').type('testuser')
        cy.get(':nth-child(3) > input').type('testuser')
        cy.get('.pbutton').click()
         //Check logged in 
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')
    })
    it('check links', () =>{
        //basic links 
        //Edit Products
        cy.get(':nth-child(1) > .actions > .pbutton')
            .should('be.visible')
            .should('contain', 'Edit')
        //Create New products
        cy.get(':nth-child(2) > .actions > .pbutton')
             .should('be.visible')
            .should('contain', 'Create')    
        
        // other options and links
        cy.get('[title="Menu"] > .material-icons')     
            .should('be.visible')
        //Menu
        cy.contains('Upload file')
        cy.contains('New product')
        cy.contains('Product list')
        cy.contains('Generate texts')
        cy.contains('Review texts')
        cy.contains('Vocabulary list')
        cy.contains('Template list')
        cy.contains('Mappings')
        
           
    })
   
})
