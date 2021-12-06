import {E, R} from '../../../pages/product-details'

describe('Translation Modal', () => {
    let refProductUrl = null;
    let refProductId = null;

    beforeEach(() => {
        cy.textualLogin('royalDesign', '/d/royal-design/product/new')
        cy.location().should(({href, pathname}) => {
            refProductUrl = href;
            refProductId = pathname.split("/")[4];
            console.log(`Reference Product is ${refProductId}`);
        })
        // Intercept requests
        cy.intercept(R.PREVIEW).as('productTextPreview');
        cy.intercept(R.TRANSLATIONS).as('productTranslationsModal');
        // Change debounce time
        cy.get(E.DEBOUNCE).invoke('text', '1000');
    })

    it('Select button disabled -> Brand change', () => {
        // Check if translation modal is working correctly
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('exist');
        cy.get(E.TRANSLATIONS_MODAL.HIDE_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('not.exist');
        // Update product
        cy.get(E.BRAND_FIELD_INPUT).type('Calvin Klein{enter}');
        // Check if the button is disabled
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click();
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('not.exist');
        cy.wait(200);
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click();
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('not.exist');
        cy.wait('@productTextPreview');
        // Check if translation modal is working correctly after product update
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('exist');
    })

    it('Select button disabled -> Main category change', () => {
        cy.get(E.EDIT_TAB).click();
        // Check if translation modal is working correctly
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('exist');
        cy.get(E.TRANSLATIONS_MODAL.HIDE_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('not.exist');
        // Update product
        cy.get(E.MAIN_CATEGORY_FIELD).vocabularySearch("dress");
        // Check if the button is disabled
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click();
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('not.exist');
        cy.wait('@productTextPreview');
        // Check if translation modal is working correctly after product update
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('exist');
    })

    it('Will only generate selected channels', () => {
        cy.get(E.EDIT_TAB).click();
        cy.get(E.MAIN_CATEGORY_FIELD).vocabularySearch("dress").wait('@productTextPreview');
        cy.get(E.TRANSLATIONS_MODAL.SHOW_BUTTON).click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.CONTAINER).should('exist');

        cy.get(E.TRANSLATIONS_MODAL.FORM_1).as('form')
        // Remove Rum21
        cy.get('@form').find(E.TRANSLATIONS_MODAL.RUM21).find('.delete').click().should('not.exist');
        // Deselect all languages
        cy.get('@form').find(E.TRANSLATIONS_MODAL.DESELECT_ALL).should('be.visible').click();
        // Select de_DE/nl_NL/sv_SE
        cy.get('@form').find(E.TRANSLATIONS_MODAL.GERMAN).click({ force: true }).should('be.checked');
        cy.get('@form').find(E.TRANSLATIONS_MODAL.DUTCH).click({ force: true }).should('be.checked');
        cy.get('@form').find(E.TRANSLATIONS_MODAL.SWEDISH).should('not.be.checked');
        cy.get('@form').find(E.TRANSLATIONS_MODAL.ENGLISH).should('not.be.checked');
        // Select all languages
        cy.get('@form').find(E.TRANSLATIONS_MODAL.SELECT_ALL).should('be.visible').click();
        cy.get('@form').find(E.TRANSLATIONS_MODAL.GERMAN).should('be.checked');
        cy.get('@form').find(E.TRANSLATIONS_MODAL.DUTCH).should('be.checked');
        cy.get('@form').find(E.TRANSLATIONS_MODAL.SWEDISH).should('be.checked');
        cy.get('@form').find(E.TRANSLATIONS_MODAL.ENGLISH).should('be.checked');

        // Add a new empty form
        cy.get(E.TRANSLATIONS_MODAL.ADD_NEW).should('be.visible').click().wait('@productTranslationsModal');
        cy.get(E.TRANSLATIONS_MODAL.FORM_2).should('exist');
    })
});
