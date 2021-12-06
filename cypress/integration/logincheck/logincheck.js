import {LoginPage} from "../pages/loginPage"
var E = new LoginPage()
describe('Login Page Check', () => {
 //This test checks if the site login works with valid login  and valid password  and what happens when invalid credentials are user
 // we asssume that the user we test here is created before this test is run.
    
    it('Situation 1- Check if login fails  with invalid username and invalid password credentials', function() {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        E.enterUserName('invalidusername');
        E.enterPassword('invalidpassword');
        E.clickLogin();
        cy.contains('correct email').should('contain', 'correct email')
    })
    it('Situation 2 - Check if login fails  with invalid username and valid password credentials', function() {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        E.enterUserName('invalidusername');
        E.enterPassword('validpassword');
        E.clickLogin();
        cy.contains(' correct email').should('contain', 'correct email')
    })

    it('Situation 3 - Check if login fails  with invalid username and password credentials', function() {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        E.enterUserName('validusername');
        E.enterPassword('invalidpassword');
        E.clickLogin();
        cy.contains('password').should('contain', 'password')
    })
    it('Situation 4 - Check login passes with valid credentials', () => {
        cy.viewport(1440, 860)
        E.navigate('https://dev.textual.ai/')
        E.enterUserName('validusername');
        E.enterPassword('validpassword');
        E.clickLogin();
        cy.contains('What do you want to do today?').should('be.visible').should('contain', 'today')
    })

    it('logout',()=>{
        cy.contains('Logout').click({ force: true })
    })
})