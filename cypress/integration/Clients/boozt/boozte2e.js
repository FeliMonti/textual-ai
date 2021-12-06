/// <reference types="cypress"/>
import {LoginPage} from "//Projects/cypress/integration/pages/loginPage.js"
var E = new LoginPage()
describe('Customer landing page', () => {
    
    it('e2e boozt', () => {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        E.enterUserName('boozttest');
        E.enterPassword('boozttest');
        E.clickLogin();
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')
        
        cy.get(':nth-child(1) > .actions > .pbutton').should('contain','Edit')
        cy.get(':nth-child(1) > .actions > .pbutton').click()
        cy.contains('Products')    //check if page contains products
        cy.get('[data-action="create-product"]').click()
        cy.get('#id_name').type('test   name')
        cy.get('#id_original_headline').type('test This is a headline')
        cy.get('#id_original_text').type ('test     this is original test')
        
        cy.get('.brand-field').invoke('')
        
        cy.get('#a3448d1e30 > .search').click();
        cy.get('.menu > .active').click();
        cy.get('#a9ffed736e').click();




    })
})