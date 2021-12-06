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
    //it('check links', () => {        //basic links  Edit Products        cy.get(':nth-child(1) > .actions > .pbutton')            .should('be.visible')            .should('contain', 'Edit')
            //Create New products        cy.get(':nth-child(2) > .actions > .pbutton')             .should('be.visible')            .should('contain', 'Create')    
        
            // other options and links        cy.on('window')            cy.get('[title="Menu"] > .material-icons')                 .should('be.visible')
        //Menu        cy.contains('Upload file')        cy.contains('New product')        cy.contains('Product list')        cy.contains('Generate texts')
        //cy.contains('Review texts')        cy.contains('Vocabulary list')        cy.contains('Template list')        cy.contains('Mappings')       })
       
            it('can click on a hover enabled sub-menu item',()=>{

                cy.get('[title="Menu"]').invoke('show')
                // Upload file possible , link check
                cy.contains('Upload file').click({ force: true })
                cy.url().should('include', 'upload')
                cy.get('button > .material-icons').click()
                
                //Products list avialable, url checked
                cy.contains('Products list').click({ force: true })
                cy.url().should('include', 'products')

                // New product creation possible, url checked
                cy.contains('New product').click({ force: true })
                cy.url().should('include', 'product')

                //cy.contains('Logout').click({ force: true })
                    
                })
            
        })
