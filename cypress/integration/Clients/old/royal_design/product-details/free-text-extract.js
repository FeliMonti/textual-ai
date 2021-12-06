import { E, R }  from '../../../pages/product-details'

describe('Product details', () => {
    let refProductUrl = null;
    let refProductId = null;

    function setField(field, value, request) {
        if (request === undefined) {
            request = '@productFormUpdateRequest'
        }
        cy.get(field)
            .scrollIntoView()
            .type(value)
        if (request !== null) {
            cy.wait(request)
        }
    }

    function checkField(field, value, attr) {
        if (attr !== undefined) {
            cy.get(field)
                .should('have.attr', attr, value)
        } else {
            cy.get(field)
                .should('contain', value)
        }
    }

    beforeEach(() => {
        cy.textualLogin('royalDesign', '/d/royal-design/product/new')
        cy.location().should(({href, pathname}) => {
            refProductUrl = href;
            refProductId = pathname.split("/")[4];
            console.log(`Reference Product is ${refProductId}`)
        })
        cy.intercept(R.FORM).as('productFormUpdateRequest')
        cy.intercept(R.ORIGINAL_TEXT).as('productOriginalTextUpdateRequest')

        // Before loading each test, we will clear out the previous content of these fields
        cy.get(E.NAME_FIELD).clear()
        cy.get(E.SKU_FIELD).clear()
        cy.get(E.ORIGINAL_TEXT_FIELD).clear()
        cy.get(E.BRAND_FIELD_INPUT).clear()
    })


    it('Free text tag extract -> Add', () => {

        // Change to edit tab
        cy.get(E.EDIT_TAB).click()

        // Set field value and analyze it
        setField(E.FREE_TEXT_TAG_EXTRACT.SEARCH_FIELD, 'beautiful table with four legs in wood', null);
        cy.get(E.FREE_TEXT_TAG_EXTRACT.ANALYZE_BUTTON).click()

        // Check extracted tags properties and values
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.BEAUTIFUL, 'prop', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.BEAUTIFUL, 'beautiful')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.TABLE, 'type', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.TABLE, 'table')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.LEGS_IN_WOOD, 'att', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.LEGS_IN_WOOD, 'legs in wood')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.LEGS, 'type', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.LEGS, 'legs')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.WOOD, 'mat', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.WOOD, 'wood')

        // Add extracted tags
        checkField(E.FREE_TEXT_TAG_EXTRACT.ADD_BUTTON, 'Add')
        cy.get(E.FREE_TEXT_TAG_EXTRACT.ADD_BUTTON).click()

        // Check added values
        checkField(E.MAIN_CATEGORY_FIELD, 'table (bord)')
        checkField(E.PROPERTIES_FIELD, 'beautiful (vacker)')
        cy.get(E.GRAMMATICAL_FIELD).find(':selected')
            .should('have.text', 'Singular')

        // Change to new subpart
        checkField(E.SUBPART.LEG, 'leg (ben)')
        cy.get(E.SUBPART.LEG).click()

        // Check subpart values
        checkField(E.MAIN_CATEGORY_FIELD, 'leg (ben)')
        checkField(E.MATERIAL_FIELD, 'wood (trä)')
        checkField(E.QUANTITY_FIELD, '4', 'value')

        // Set field value and analyze it
        setField(E.FREE_TEXT_TAG_EXTRACT.SEARCH_FIELD, 'red surface', null);
        cy.get(E.FREE_TEXT_TAG_EXTRACT.ANALYZE_BUTTON)
            .click()

        // Check extracted tags properties and values
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.RED, 'prop', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.RED, 'red')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.SURFACE, 'type', 'data-entity')
        checkField(E.FREE_TEXT_TAG_EXTRACT.TAGS.SURFACE, 'surface')

        // Check buttons
        checkField(E.FREE_TEXT_TAG_EXTRACT.ADD_BUTTON, 'Add as attribute')
        checkField(E.FREE_TEXT_TAG_EXTRACT.REPLACE_BUTTON, 'Replace [leg (ben)')

        cy.get(E.FREE_TEXT_TAG_EXTRACT.ADD_BUTTON).click()

        // Change to new subpart
        checkField(E.SUBPART.SURFACE, 'surface (yta)')
        cy.get(E.SUBPART.SURFACE).click()

        // Check subpart values
        checkField(E.MAIN_CATEGORY_FIELD, 'surface (yta)')
        cy.get(E.GRAMMATICAL_FIELD).find(':selected')
            .should('have.text', 'Singular')
        checkField(E.COLOR_FIELD, 'red (röd)')
    })

    it('Free text tag extract -> Replace', () => {

        // Change to edit tab
        cy.get(E.EDIT_TAB).click()

        // Set field value and analyze it
        setField(E.FREE_TEXT_TAG_EXTRACT.SEARCH_FIELD, 'beautiful table with four legs in wood', null);
        cy.get(E.FREE_TEXT_TAG_EXTRACT.ANALYZE_BUTTON).click()

        // Add extracted tags
        checkField(E.FREE_TEXT_TAG_EXTRACT.ADD_BUTTON, 'Add')
        cy.get(E.FREE_TEXT_TAG_EXTRACT.ADD_BUTTON).click()

        // Set field value and analyze it
        cy.get(E.FREE_TEXT_TAG_EXTRACT.SEARCH_FIELD).clear()
        setField(E.FREE_TEXT_TAG_EXTRACT.SEARCH_FIELD, 'red surface', null);
        cy.get(E.FREE_TEXT_TAG_EXTRACT.ANALYZE_BUTTON).click()

        // Replace
        cy.get(E.FREE_TEXT_TAG_EXTRACT.REPLACE_BUTTON).click()

        // Check subpart values
        checkField(E.MAIN_CATEGORY_FIELD, 'surface (yta)')
        cy.get(E.GRAMMATICAL_FIELD).find(':selected')
            .should('have.text', 'Singular')
        checkField(E.COLOR_FIELD, 'red (röd)')
        checkField(E.PROPERTIES_FIELD, 'beautiful (vacker)')

        // Check if subpart still exist
        checkField(E.SUBPART.LEG, 'leg (ben)')
    })
})
