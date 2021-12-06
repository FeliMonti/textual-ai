import { E, R }  from '../../../pages/product-details'


describe('Product details materials tab', () => {
    let refProductUrl = null;
    let refProductId = null;

    beforeEach(() => {
        cy.textualLogin('nakd', '/d/na-kd/product/new')
        cy.location().should(({ href, pathname }) => {
            refProductUrl = href;
            refProductId = pathname.split("/")[4];
            console.log(`Reference Product is ${refProductId}`)
        })
        cy.intercept(R.FORM).as('productFormUpdateRequest')
        cy.intercept(R.MATERIALS).as('materialsTabRequest')
        cy.intercept(R.FIELDS).as('editTabFieldsRequest')

        // Before loading each test, we will clear out the previous content of these fields
        cy.get(E.NAME_FIELD).clear()
        cy.get(E.SKU_FIELD).clear()
        cy.get(E.ORIGINAL_TEXT_FIELD).clear()
    })

    it('Save material', () => {
        cy.contains('NA-KD')
        // Set some field values
        cy.get(E.NAME_FIELD).type('Some Name').wait('@productFormUpdateRequest')
        // Change tab
        cy.get(E.MATERIALS.TAB).click().wait('@materialsTabRequest')
        cy.get(E.MATERIALS.TAB).should("have.class", "active")
        // Add materials
        cy.get(E.MATERIALS.FORM.CONTAINER).as('form');
        cy.get('@form').find(E.MATERIALS.FORM.MATERIAL_1).vocabularySearch("cork").wait('@materialsTabRequest')
        cy.get('@form').find(E.MATERIALS.FORM.PERCENTAGE_1).type("10%{enter}").wait('@materialsTabRequest')
        // Change tab to edit and once again to materials
        cy.get(E.EDIT_TAB).click().wait('@editTabFieldsRequest')
        cy.get(E.MATERIALS.TAB).click().wait('@materialsTabRequest')
        // Check fields values
        cy.get('@form').find(E.MATERIALS.FORM.MATERIAL_1).should('contain', "cork")
        cy.get('@form').find(E.MATERIALS.FORM.PERCENTAGE_1).should('have.value', "10%")
    })
})
