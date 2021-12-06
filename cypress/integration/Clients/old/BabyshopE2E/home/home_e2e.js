/// <reference types="cypress"/>
import {LoginPage} from "//Projects/cypress/integration/pages/loginPage.js"
var E = new LoginPage()
describe('Customer landing page', () => {
    it('Check login', function() {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        //Login
        
        E.enterUserName('babyshop-testing');
        E.enterPassword('d3f16a2faca642529cfa06502bbb9949');
        E.clickLogin();

    
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')
    })
    it('check links', () =>{
        //basic links 
        cy.get(':nth-child(1) > .actions > .pbutton')
            .should('be.visible')
            .should('contain', 'Upload')
        cy.get(':nth-child(2) > .actions > .pbutton') 
            .should('be.visible')
            .should('contain', 'Edit')
        cy.get(':nth-child(3) > .actions > .pbutton') 
            .should('be.visible')
            .should('contain', 'Create')
        
        // other options and links
        cy.get('.other > ul > li > a')
            .should('be.visible')
            .should('contain', 'Map')
        
        cy.get('[title="Menu"] > .material-icons')     
            .should('be.visible')
    
    })
    it('check dropdown menu', () => {
        cy.get('[title="Menu"] > .material-icons').should('be.visible')
        cy.contains('Upload file').should('be.visible') .should('contain', 'File')
        cy.contains('New product')
        cy.contains('Product list')
        cy.contains('Generate texts')
        cy.contains('Review texts')
        cy.contains('Vocabulary list')
        cy.contains('Template list')
        cy.contains('Mappings')
    })
})
