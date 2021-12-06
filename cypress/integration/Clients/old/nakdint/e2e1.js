///{refrence types="cypress"}
describe('nakde2e', () => {
  
  it('connectsandbox and login', () => {
      cy.visit('https://partner.inriver.productmarketingcloud.com/')
      cy.get('#Email').type('henrik@textual.ai')
      cy.get('.login__submit-button').click()
      cy.get('#Password').type('7L!K3kX8wDr6n3k')
      cy.get('#loginSubmitButton').click().wait(2000)
      cy.contains('Welcome')
      ///cy.url()
      cy.get('[href="/app/enrich#entity/11/details"] > .item-card__content > .item-card__text-wrapper > .item-card__name').click()
      cy.wait(5000)
      cy.get('#tools-show > .header-icon__link > .c-svg-icon').click()
      cy.get('#Product').click()
      cy.get('#c130_Fields_3_Value').type('12121212')
      cy.get('#c130_Fields_4_Value').type('mango')
      ///cy.get('#c130_Fields_5_Value > .multiple-select > .multiple-select__toggle-button > .placeholder').select(1)
      cy.get('#c130_Fields_5_Value > .multiple-select > .multiple-select__toggle-button > .multiple-select__toggle-button-icon')
        .click()
      cy.contains('dress')
        .click()
      cy.get('#c130_Fields_6_Value > .multiple-select > .multiple-select__toggle-button > .multiple-select__toggle-button-icon').click()
      cy.contains('cold').click()
      cy.get('#c130_Fields_6_Value > .multiple-select > .multiple-select__toggle-button > .multiple-select__toggle-button-icon').click()

      cy.get('#c130_Fields_7_Value > .multiple-select > .multiple-select__toggle-button > .multiple-select__toggle-button-icon').click()
      cy.contains('Fitted').click()
      cy.get('#c130_Fields_7_Value > .multiple-select > .multiple-select__toggle-button > .multiple-select__toggle-button-icon').click()


      
      
 
  })
})