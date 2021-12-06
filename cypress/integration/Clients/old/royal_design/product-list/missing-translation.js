import { E } from '../../../pages/product-details'

const selectors = {
    createBtn: '[data-action="create-product"]',
    flag: '[data-text-status="missing-translation"]',
    textColumns: '[data-action="show-text-columns"]',
    JapLangSelect: '[data-testid="912_ja_JP"]',
    submitBtn: '[data-testid=submitButton]',
    requestWord: '.option-request-word',
    textareaEnglish: 'textarea[name=englishTranslation]',
    translationSubmitBtn: 'button[name=submit]',
  }

    function uuidv4() {
        return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function (c) {
            const r = (Math.random() * 16) | 0,
            v = c == "x" ? r : (r & 0x3) | 0x8;
            return v.toString(16);
        });
    }
    const SKU_VALUE = uuidv4()

describe('missing-translation', () => {

   /**
     *
     * @param selector Field to type in
     * @param value What to type
     */

    function setField(selector, value) {
        cy.get(selector).type(value)
    }

    it('login', () => {
        cy.textualLogin('royalDesign', '/d/royal-design')
        cy.contains('Edit existing products')

    })
    it('product list', () => {
        cy.get('a').filter(':contains("Edit")').click()
        cy.contains('Products')
        cy.get(selectors.createBtn).click()

    })

    it('create new product', () => {
        setField(E.SKU_FIELD, SKU_VALUE)
        cy.get(E.EDIT_TAB).click()
        cy.get(E.MAIN_CATEGORY_FIELD).vocabularySearch('klänning')
        cy.get(E.MATERIAL_FIELD).type('groda')
        cy.get(selectors.requestWord).click()
        cy.get(selectors.textareaEnglish).type('groda')
        cy.get(selectors.translationSubmitBtn).click().wait(1000)
        cy.go('back')
    })

    it('Adds another language', () => {
        cy.get(selectors.textColumns).click()
        cy.get(selectors.JapLangSelect).click()
        cy.get(selectors.submitBtn).click()
    })

    it('checks if missing translation-flag exist',() => {
        cy.get(selectors.flag).first()
        cy.contains(/groda_/i).first()
    })


})