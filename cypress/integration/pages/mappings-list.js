export const E = {
    LIST: {
        FIRST_ITEM: '.items > :nth-child(2) > .partial',
        ITEM: {
            // use these selectors on list item by cy.get(LIST.FIRST_ITEM).find(LIST.ITEM.EDIT_BUTTON)
            EDIT_BUTTON: ".pbutton.pbutton-inverse.buttonOfMapping",
            DELETE_BUTTON: ".pbutton.pbutton-primary.buttonOfMapping",
        },

    },
    EDIT_MODAL: {
        WINDOW: ".wizard-dialog > .dialog",
        // use these selectors on EDIT_MODAL.WINDOW by cy.get(EDIT_MODAL.WINDOW).find(EDIT_MODAL.VOCABULARY_INPUT)
        VOCABULARY_INPUT: ".VocabularyLookup",
        REQUEST_POPUP: ".tree_view_popover",
    },
}