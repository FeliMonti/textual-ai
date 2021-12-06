/// <reference types="cypress"/>
import {LoginPage} from "//Projects/cypress/integration/pages/loginPage.js"
var E = new LoginPage()
describe('Customer landing page', () => {
    
    it('Check login with valid credentials', () => {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        E.enterUserName('afoundtest');
        E.enterPassword('afoundtest');
        E.clickLogin();
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')
    })
    it('can click on a hover enabled sub-menu item',()=>{

                cy.get('[title="Menu"]').invoke('show')
                // Upload file possible , link check
                cy.contains('Upload file').click({ force: true })
                cy.url().should('include', 'upload')
                cy.get('button > .material-icons').click()
                
                //Products list avialable, URL tobe checked .
                //This will only work for a test Superuser and not for test moderator
                //cy.contains('Products list').click({ force: true })
                //cy.url().should('include', 'products')

                

               //cy.get(':nth-child(1) > .actions > .pbutton').click()
               
                
                //.click({ force: true })
                    
    })
    
    it('check Edit existing product', () => {

    })
    
    //it('check add new  product enabled', () => {
        // New product creation possible, url checked
                //cy.contains('New product')   //.click({ force: true })    //cy.url().should('include', 'product')

    //})
    
    //it('check logout', () => {
    //last step to be performed to logout
            //cy.get('[title="Menu"]').invoke('show')
            //cy.contains('Logout')

    //})
})
