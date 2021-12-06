import { E, R }  from '../../../pages/product-details'


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
        cy.textualLogin('babyshop', '/d/babyshop/product/new')
        cy.location().should(({ href, pathname }) => {
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

    it('Actions -> New', () => {
        cy.contains('Babyshop')
        // Set some field values
        setField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text', null);
        setField(E.SKU_FIELD, randomString(10))
        setField(E.NAME_FIELD, 'Some Name')
        setField(E.BRAND_FIELD_INPUT, 'Calvin Klein{enter}')

        cy.get(E.ACTION_NEW)
            .click({ force: true })

        // Product page
        cy.location('href').should('not.include', refProductUrl);
        cy.contains('Babyshop (174)')

        // Name field
        cy.contains('Name')
        cy.get(E.NAME_FIELD)
            .should('be.visible')
            .should('be.empty')
            .invoke('attr', 'placeholder')
            .should('contain', 'Enter a product name')

        // SKU field
        cy.contains('SKU')
        cy.get(E.SKU_FIELD)
            .should('be.visible')
            .should('be.empty')
            .invoke('attr', 'placeholder')
            .should('contain', 'Enter a product code')

        // Brand field
        cy.contains('SKU')
        cy.get(E.BRAND_FIELD_TEXT).contains('Choose brand')

        // Label field
        cy.contains('Label')
        cy.get(E.LABEL_FIELD).contains('Type to search')

        // Original headline
        cy.contains('Original headline')
        cy.get(E.ORIGINAL_HEADLINE_FIELD)
            .should('be.visible')
            .should('be.empty')

        // Original text
        cy.contains('Original text')
        cy.get(E.ORIGINAL_TEXT_FIELD)
            .should('be.visible')
            .should('be.empty')

        // Original text language
        cy.contains('Original text language')
        cy.get(E.ORIGINAL_TEXT_LANGUAGE_FIELD)
            .should('be.visible')
            .contains('English (US)')

        // Text patterns
        cy.get(E.TP_SELECTOR).contains('Lekmer')
        cy.get(E.TP_SELECTOR).contains('Babyshop')
        cy.get(E.TEXTS_GRID)
            .contains('Lekmer')
            .closest('.text-item')
            .contains('No tags.')
        cy.get(E.TEXTS_GRID)
            .contains('Babyshop')
            .closest('.text-item')
            .contains('No tags.')
    })

    it('Actions -> Duplicate', () => {
        // Set some field values
        setField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text', null);
        setField(E.SKU_FIELD, randomString(10))
        setField(E.NAME_FIELD, 'A Name')
        setField(E.BRAND_FIELD_INPUT, 'Condor{enter}')

        // Duplicate product and wait for a new
        cy.get(E.ACTION_DUPLICATE)
            .click({ force: true })
        cy.location('href').should('not.include', refProductUrl);

        // SKU should be empty
        cy.get(E.SKU_FIELD)
            .should('be.empty');

        // Name/Original Text should be preserved
        checkField(E.NAME_FIELD, 'A Name', 'value')
        checkField(E.BRAND_FIELD_TEXT, 'Condor')
        checkField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text')
    })

    it('Actions -> Copy To with name and brand', () => {
        // Set a random SKU on the current product and wait for it to be updated
        let sku = randomString(10)
        setField(E.SKU_FIELD, sku)

        // Create a new product and wait for it to be displayed
        cy.get(E.ACTION_NEW)
            .click({ force: true })
        cy.location('pathname')
            .should('not.include', refProductId)

        // Change a name/brand/original text
        setField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text', null);
        setField(E.NAME_FIELD, 'Some Name')
        setField(E.BRAND_FIELD_INPUT, 'Calvin Klein{enter}')
        setField(E.SKU_FIELD, randomString(10))

        // Add a main category tag
        cy.get(E.MAIN_CATEGORY_FIELD)
            .scrollIntoView()
            .type('dress')
            .closest('.vocabulary-lookup')
            .get('.suggestion-item')
            .get(E.MAIN_CATEGORY_FIELD)
            .type('{enter}')

        // Copy to
        cy.get(E.ACTION_COPY_TO)
            .click({ force: true })
        cy.get(E.COPY_MODAL.SKU_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.OVERWRITE_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.TEXT_FIELD)
            .should('be.visible')
            .should('be.empty')
            .type(sku)
        cy.get(E.COPY_MODAL.COPY_BUTTON)
            .should('be.visible')
            .click()

        cy.visit(refProductUrl);

        // SKU should be empty
        cy.get(E.SKU_FIELD)
            .should('be.empty');

        // Name/Original Text should be preserved
        checkField(E.NAME_FIELD, 'Some Name', 'value')
        checkField(E.BRAND_FIELD_TEXT, 'Calvin Klein')
    })

    it('Actions -> Copy To without name and brand', () => {
        // Set a random SKU on the current product and wait for it to be updated
        let sku = randomString(10)
        setField(E.SKU_FIELD, sku)
        setField(E.NAME_FIELD, 'Test Name')
        setField(E.BRAND_FIELD_INPUT, 'Ralph Lauren{enter}')

        // Create a new product and wait for it to be displayed
        cy.get(E.ACTION_NEW)
            .click({ force: true })
        cy.location('pathname')
            .should('not.include', refProductId)

        // Change a name/brand/original text
        setField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text', null);
        setField(E.NAME_FIELD, 'Some Name')
        setField(E.BRAND_FIELD_INPUT, 'Calvin Klein{enter}')
        setField(E.SKU_FIELD, randomString(10))

        // Add a main category tag
        cy.get(E.MAIN_CATEGORY_FIELD)
            .scrollIntoView()
            .type('dress')
            .closest('.vocabulary-lookup')
            .get('.suggestion-item')
            .get(E.MAIN_CATEGORY_FIELD)
            .type('{enter}')

        // Copy to
        cy.get(E.ACTION_COPY_TO)
            .click({ force: true })
        cy.get(E.COPY_MODAL.SKU_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.OVERWRITE_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.COPY_NAME).should('be.visible').click()
        cy.get(E.COPY_MODAL.COPY_BRAND).should('be.visible').click()
        cy.get(E.COPY_MODAL.TEXT_FIELD)
            .should('be.visible')
            .should('be.empty')
            .type(sku)
        cy.get(E.COPY_MODAL.COPY_BUTTON)
            .should('be.visible')
            .click()

        cy.visit(refProductUrl);

        // SKU should be empty
        cy.get(E.SKU_FIELD)
            .should('be.empty');

        // Name/Original Text should be preserved
        checkField(E.NAME_FIELD, 'Test Name', 'value')
        checkField(E.BRAND_FIELD_TEXT, 'Ralph Lauren')
    })

    it('Actions -> Copy From', () => {
        // Change a name/brand/original text
        setField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text', null);
        setField(E.NAME_FIELD, 'Some Name')
        setField(E.BRAND_FIELD_INPUT, 'Calvin Klein{enter}')
        // Set a random SKU on the current product and wait for it to be updated
        let sku = randomString(10)
        setField(E.SKU_FIELD, sku)
        // Add a main category tag
        cy.get(E.MAIN_CATEGORY_FIELD)
            .scrollIntoView()
            .type('dress')
            .closest('.vocabulary-lookup')
            .get('.suggestion-item')
            .get(E.MAIN_CATEGORY_FIELD)
            .type('{enter}')

        // New product
        cy.get(E.ACTION_NEW)
            .click({ force: true })
        cy.location('pathname')
            .should('not.include', refProductId)

        // Copy from
        cy.get(E.ACTION_MENU)
            .scrollIntoView()
            .invoke('show')
            .trigger('mouseover')
            .get(E.ACTION_COPY_FROM)
            .click({ force: true })
        cy.get(E.COPY_MODAL.SKU_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.OVERWRITE_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.TEXT_FIELD)
            .should('be.visible')
            .should('be.empty')
            .type(sku)
        cy.get(E.COPY_MODAL.COPY_BUTTON)
            .should('be.visible')
            .click()

        cy.visit(refProductUrl);

        // SKU should be empty
        cy.get(E.SKU_FIELD)
            .should('be.empty');

        // Name/Original Text should be preserved
        checkField(E.NAME_FIELD, 'Some Name', 'value')
        checkField(E.BRAND_FIELD_TEXT, 'Calvin Klein')
        checkField(E.ORIGINAL_TEXT_FIELD, 'Some Original Text')
    })

    it('Actions -> Copy From - merge', () => {
        // Change a name/brand
        setField(E.NAME_FIELD, 'First product Name')
        setField(E.BRAND_FIELD_INPUT, 'First product Brand{enter}')
        // Set a random SKU on the current product and wait for it to be updated
        let firstSKU = randomString(10)
        setField(E.SKU_FIELD, firstSKU)
        // Add a main category tag
        cy.get(E.MAIN_CATEGORY_FIELD)
            .scrollIntoView()
            .type('dress')
            .closest('.vocabulary-lookup')
            .get('.suggestion-item')
            .get(E.MAIN_CATEGORY_FIELD)
            .type('{enter}')

        // New product
        cy.get(E.ACTION_NEW)
            .click({ force: true })
        cy.location('pathname')
            .should('not.include', refProductId)
        let secondSKU = randomString(10)
        setField(E.SKU_FIELD, secondSKU)
        setField(E.NAME_FIELD, 'Second product Name')
        setField(E.BRAND_FIELD_INPUT, 'Second product Brand{enter}')

        // Copy from
        cy.get(E.ACTION_MENU)
            .scrollIntoView()
            .invoke('show')
            .trigger('mouseover')
            .get(E.ACTION_COPY_FROM)
            .click({ force: true })
        cy.get(E.COPY_MODAL.SKU_RADIO)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.MERGE_RADIO)
            .should('be.visible')
        cy.get(E.COPY_MODAL.MERGE_RADIO).click()
        cy.get(E.COPY_MODAL.MERGE_RADIO).should('be.checked')
        cy.get(E.COPY_MODAL.COPY_BRAND)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.COPY_NAME)
            .should('be.visible')
            .should('be.checked')
        cy.get(E.COPY_MODAL.TEXT_FIELD)
            .should('be.visible')
            .should('be.empty')
            .type(firstSKU)
        cy.get(E.COPY_MODAL.COPY_BUTTON)
            .should('be.visible')
            .click()

        checkField(E.SKU_FIELD, `${secondSKU} / ${firstSKU}`, 'value')
        checkField(E.NAME_FIELD, 'Second product Name / First product Name', 'value')
        checkField(E.BRAND_FIELD_TEXT, 'Second product Brand / First product Brand')

        cy.visit(refProductUrl);

        // SKU should be empty
        checkField(E.SKU_FIELD, firstSKU, 'value');

        // Name/Original Text should be preserved
        checkField(E.NAME_FIELD, 'First product Name', 'value')
        checkField(E.BRAND_FIELD_TEXT, 'First product Brand')

    })

    it('Text Generation: Trendy dress', () => {
        cy.get(E.MAIN_CATEGORY_FIELD)
            .vocabularySearch("dress");

        cy.get(E.PROPERTIES_FIELD)
            .vocabularySearch("trendy");

        cy.get(E.RELOAD)
            .click({ force: true })

        // Lekmer Title
        cy.get(':nth-child(2) > .channel > .text > .title > h1 > span')
            .contains('Dress')
        // Babyshop Title
        cy.get(':nth-child(3) > .channel > .text > .title > h1 > span')
            .contains('Dress')
        // Babyshop Description
        cy.get(':nth-child(3) > .channel > .text > .long_description')
            .contains('Trendy dress.')
    })

})
