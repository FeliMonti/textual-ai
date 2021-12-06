import { E, R } from '../../../pages/product-details'
import { PL_E } from '../../../pages/product-list'


function randomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
        result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
}

describe('Product details', () => {
    let refProductUrl = null;
    let refProductId = null;

    beforeEach(() => {
        cy.textualLogin('babyshop', '/d/babyshop/product/new')
        cy.location().should(({ href, pathname }) => {
            refProductUrl = href;
            refProductId = pathname.split("/")[4];
            console.log(`Reference Product is ${refProductId}`)
        })
        cy.intercept(R.FORM).as('productFormUpdateRequest')
        cy.intercept(R.ORIGINAL_TEXT).as('productOriginalTextUpdateRequest')
    })

    it('Bulk actions -> Generate texts', () => {
        // create product with simple text
        const SKU = randomString(10);
        cy.contains('Babyshop')
        cy.get(E.SKU_FIELD).type(SKU)
        cy.wait('@productFormUpdateRequest')
        cy.get(E.MAIN_CATEGORY_FIELD).vocabularySearch("dress")

        // go to product list using SKU and select generated product
        cy.visit(`/d/babyshop/products?search=${SKU}`)
        cy.contains(SKU)
        cy.get(PL_E.LIST.SELECT_CHECKBOX).click({force: true})

        // check bulk actions and select "Generate texts"
        cy.get(PL_E.BULK_ACTION.FORM).should('be.visible')
        cy.get(PL_E.BULK_ACTION.SELECT_FIELD).click({force: true})

        // check action buttons
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIG.GENERATE_BTN).contains("Generate texts")
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIG.REVIEW_BTN).contains("Review texts")

        // check if Babyshop channel and EN_US language are selected and submit the form
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIG.CHANNELS).get('#channel_313').should('be.checked')
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIG.LANGUAGES).get('#language_244').should('be.checked')
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIG.GENERATE_BTN).click()

        // check action buttons and go to publish to connector
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIRM.DOWNLOAD_BTN).should('exist')
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIRM.PUBLISH_BTN).should('exist')
        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIRM.PUBLISH_BTN).click()

        // check product count -> select EN_US language -> submit form
        cy.get(PL_E.BULK_ACTION.PUBLISH_CONFIG.PRODUCT_COUNT).contains('1 products selected')
        cy.get(PL_E.BULK_ACTION.PUBLISH_CONFIG.LANGUAGES.SELECT_ALL).should('be.visible')
        cy.get(PL_E.BULK_ACTION.PUBLISH_CONFIG.LANGUAGES.DESELECT_ALL).should('be.visible')
        cy.get(PL_E.BULK_ACTION.PUBLISH_CONFIG.LANGUAGES.DESELECT_ALL).click()
        cy.get(PL_E.BULK_ACTION.PUBLISH_CONFIG.LANGUAGES.EN_US).check()
        cy.get(PL_E.BULK_ACTION.PUBLISH_CONFIG.NEXT_BTN).click()

        cy.get(PL_E.BULK_ACTION.GENERATE_TEXT_CONFIRM.CONFIRM_MSG).contains('Successfully published 1 products')

    })
})

