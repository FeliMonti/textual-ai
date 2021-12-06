import {LoginPage} from "//Projects/cypress/integration/pages/loginPage.js"
var E = new LoginPage()
describe('Customer landing page after login', () => {
    it('Check login', function() {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
               
        E.enterUserName('babyshop-testing');
        E.enterPassword('d3f16a2faca642529cfa06502bbb9949');
        E.clickLogin();

    
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')

    })
})