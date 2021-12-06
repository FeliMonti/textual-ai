import { E } from '../../../pages/product-details'

const selectors = {
    createBtn: '[data-action="create-product"]',
    saveBtn: '[data-connector-type="Save"]',
    hamburger: '[title="Menu"]',
    review: '[data-text-status="needs-reviewed"]',
    approved: '[data-text-status="approved"]',
    done: '[data-text-status="published"]',
    manualEditTextarea: '[data-action="edit-product-text"]',
    manualEditSaveBtn: '.positive',
    headerText: '[data-textual-section="header"] > h1 > span',
    editedHeaderText: '.is-edited > h1',
    manualEdit: 'i.edit',
    comment: 'i.comment',
    approve: 'button.mini > i.check',
    publish: 'i.plane',
    revert: 'i.undo',
    tableCell: '[data-table-cell="1-5"]'
   }




    function uuidv4() {
        return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, function (c) {
            const r = (Math.random() * 16) | 0,
            v = c == "x" ? r : (r & 0x3) | 0x8;
            return v.toString(16);
        });
    }
    const SKU_VALUE = uuidv4()

describe('text-statuses', () => {
    /**
     *
     * @param selector Field to type in
     * @param value What to type
     */
    function setField(selector, value) {
        cy.get(selector).type(value)
    }
   function getTodayDate() {
        let today = new Date()
        let day = String(today.getDate()).padStart(2, '0')
        let month =  String(today.getMonth() + 1).padStart(2, '0')
        let year = today.getFullYear()
        today = `${year}-${month}-${day}`
        return today
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
        cy.get(E.MAIN_CATEGORY_FIELD).vocabularySearch('känning')
        cy.get(E.PROPERTIES_FIELD).vocabularySearch('sport')
        cy.go('back')
    })

   it('Add comments', () => {
        cy.get(selectors.tableCell).find(selectors.comment).click()
        setField('textarea','This is a comment')
        cy.get(selectors.saveBtn).click()
        cy.get(selectors.tableCell).contains('This is a comment')
    })

   it('Manual edit', () => {
        cy.get(selectors.tableCell).find(selectors.manualEdit).click()
        cy.get(selectors.manualEditTextarea).clear().type('<h1>Byxor</h1>')
        cy.get(selectors.manualEditTextarea).should('contain.text', '<h1>Byxor</h1>')
        cy.get(selectors.manualEditSaveBtn).click()
        cy.get(selectors.tableCell).find(selectors.editedHeaderText).should('contain.text', 'Byxor')

    })

   it ('Revert', () => {
        cy.get(selectors.tableCell).find(selectors.revert).click()
        cy.get(selectors.tableCell).find(selectors.headerText).should('contain.text', 'Klänning')
    })

   it ('Approves', () => {
        cy.get(selectors.tableCell).find(selectors.review)
        cy.get(selectors.tableCell).find(selectors.approve).click()
        cy.get(selectors.tableCell).find(selectors.approved)
    })

   it('Changes API call and Publish', () => {
        cy.textualLogin('royalDesign', '/d/royal-design/manage')
        cy.contains('API settings').click()
        cy.get('#id_api_v2_callback_url').clear()

             cy.request('POST',`https://webhook.site/token`).then((res) => {
                    let apiToken = res.body.uuid
                    let apiUrl = `https://webhook.site/${apiToken}`
                    let apiRequestUrl =`https://webhook.site/token/${apiToken}/request/latest`

                    setField('#id_api_v2_callback_url', apiUrl)

                    cy.get('#id_api_v2_callback_url').should('contain.value',apiUrl)
                    cy.get('.pbutton-primary').click()
                    cy.get('div').invoke('show')
                    cy.contains('Product list').click()

                   cy.get(selectors.tableCell).find(selectors.publish).click()
                   cy.get(selectors.tableCell).find(selectors.done).wait(2000)
                    cy.request( apiRequestUrl)
                        .its('body')
                        .its('content')
                        .should("contain", SKU_VALUE)
                    cy.get(selectors.tableCell).contains('Latest publication date: ' + getTodayDate())
                   })
    })
})