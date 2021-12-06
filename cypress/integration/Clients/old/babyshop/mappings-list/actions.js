import { E }  from '../../../pages/mappings-list'

describe('Mappings list', () => {

    beforeEach(() => {
        cy.textualLogin('babyshop', '/d/babyshop/mappings')
    })

    it('Actions -> Edit -> WordRequest popup visibility', () => {
        cy.contains('Babyshop');
        cy.get(E.LIST.FIRST_ITEM).find(E.LIST.ITEM.EDIT_BUTTON).click();
        cy.get(E.EDIT_MODAL.WINDOW).as('modal');
        cy.get('@modal').find(E.EDIT_MODAL.VOCABULARY_INPUT).type("T");
        cy.get('@modal').find(E.EDIT_MODAL.REQUEST_POPUP).should('not.exist');
        cy.get('@modal').find(E.EDIT_MODAL.VOCABULARY_INPUT).type("TE");
        cy.get('@modal').find(E.EDIT_MODAL.REQUEST_POPUP).should('be.visible');
        cy.get('@modal').find(E.EDIT_MODAL.VOCABULARY_INPUT).type("TES");
        cy.get('@modal').find(E.EDIT_MODAL.REQUEST_POPUP).should('be.visible');
        cy.get('@modal').find(E.EDIT_MODAL.VOCABULARY_INPUT).type("TEST");
        cy.get('@modal').find(E.EDIT_MODAL.REQUEST_POPUP).should('be.visible');
    })
})
