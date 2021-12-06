export class LoginPage{
    loginPage_username = ':nth-child(2) > input'
    loginPage_password =  ':nth-child(3) > input'
    
    navigate(url)   {
        cy.visit(url)
    }
    enterUserName(username) {
        cy.get(this.loginPage_username).type(username)
    }
    enterPassword(password) {
        cy.get(this.loginPage_password).type(password)  
    }
    clickLogin()    {
        cy.get('.pbutton').click()
    }
}