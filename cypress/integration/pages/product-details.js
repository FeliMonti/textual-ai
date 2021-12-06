export const E = {
    DEBOUNCE: '#debounce_time',

    // Fields
    NAME_FIELD: 'input[name=name]',
    SKU_FIELD: '#id_external_id',
    LABEL_FIELD: '.label-field',
    BRAND_FIELD_INPUT: '.brand-field input[class=search]',
    BRAND_FIELD_TEXT: '.brand-field div.text',
    ORIGINAL_HEADLINE_FIELD: 'input[name=original_headline]',
    ORIGINAL_TEXT_FIELD: 'textarea[name=original_text]',
    ORIGINAL_TEXT_LANGUAGE_FIELD: 'select[name=change_language]',

    // Actions toolbar
    ACTION_MENU: '[data-test=action-menu]',
    ACTION_NEW: '[data-test=action-new]',
    ACTION_DUPLICATE: '[data-test=action-duplicate]',
    ACTION_COPY_TO: '[data-test=action-copy-to]',
    ACTION_COPY_FROM: '[data-test=action-copy-from]',

    // Text Generation Preview
    RELOAD: '.reload > a',
    TP_SELECTOR: '#preview .text-patterns',
    TEXTS_GRID: '.texts-grid',

    // Copy to/from modal
    COPY_MODAL: {
        SKU_RADIO: '#sku-ean-modal #sku',
        EAN_RADIO: '#sku-ean-modal #ean',
        OVERWRITE_RADIO: '#sku-ean-modal #overwrite',
        MERGE_RADIO: '#sku-ean-modal #merge',
        TEXT_FIELD: '#sku-ean-modal div.modal input[type=text]',
        COPY_BUTTON: '#sku-ean-modal div.modal button.copy',
        COPY_NAME: '#sku-ean-modal #product-name',
        COPY_BRAND: '#sku-ean-modal #product-brand',
    },

    // Edit Tab
    EDIT_TAB: '[data-test=edit-tab]',

    // Edit tab fields
    FREE_TEXT_TAG_EXTRACT: {
        SEARCH_FIELD: 'input[name=text]',
        ANALYZE_BUTTON: '[data-test=tag-extract-analyze-btn]',
        ADD_BUTTON: '[data-test=tag-extract-add-btn]',
        REPLACE_BUTTON: '[data-test=tag-extract-replace-btn]',

        // Generated tags
        TAGS: {
            BEAUTIFUL: '[style="z-index: 1000;"] > .taggy-wrapper > :nth-child(2) > mark',
            TABLE: '[style="z-index: 1000;"] > .taggy-wrapper > :nth-child(4) > mark',
            LEGS_IN_WOOD: '[style="z-index: 1000;"] > .taggy-wrapper > [offset="26"] > mark',
            LEGS: '[style="margin-left: 0px; z-index: 1000;"] > .taggy-wrapper > :nth-child(2) > mark',
            WOOD: '[offset="34"] > mark',
            RED: ':nth-child(2) > mark',
            SURFACE: ':nth-child(4) > mark',
        },
    },
    MAIN_CATEGORY_FIELD: '.product-type > .vocabulary-lookup > .input-container > .input-wrapper',
    GRAMMATICAL_FIELD: '#id_product_type_number',
    QUANTITY_FIELD: '#id_product_number',
    PROPERTIES_FIELD: '.row-properties > .vocabulary-lookup > .input-container > .input-wrapper',
    MATERIAL_FIELD: '.row-material > .vocabulary-lookup > .input-container > .input-wrapper',
    COLOR_FIELD: '.row-color > .vocabulary-lookup > .input-container > .input-wrapper',
    IMAGE: '.tab-container img:first-of-type',

    // Generated subparts
    SUBPART: {
        LEG: '.subparts.bound > li:nth-child(1) > .subpart > a.link',
        SURFACE: '.subparts.bound > li:nth-child(2) > .subpart > a.link',
    },

    IMAGES_TAB: '.tab-edit-image',
    IMAGES_TAB_IMAGE: '[data-test=image-url]',
    SHOW_TRANSLATIONS_MODAL_BUTTON: '[data-test=show-translations-modal]',
    HIDE_TRANSLATIONS_MODAL_BUTTON: '[data-test=hide-translations-modal]',
    TRANSLATIONS_MODAL: {
        CONTAINER: '.translations-modal',
        SHOW_BUTTON: '[data-test=show-translations-modal]',
        HIDE_BUTTON: '[data-test=hide-translations-modal]',
        FORM_1: '.translations-modal .channel-language-form:nth(0)',
        FORM_2: '.translations-modal .channel-language-form:nth(1)',
        // Use this selectors on form object by cy.get(E.TRANSLATIONS_MODAL.FORM_1).find(...)
        ADD_NEW: '#add-empty-form',
        SELECT_ALL: '#language-select-all',
        DESELECT_ALL: '#language-deselect-all',
        GERMAN: '[data-language-code=de_DE]',
        DUTCH: '[data-language-code=nl_NL]',
        SWEDISH: '[data-language-code=sv_SE]',
        ENGLISH: '[data-language-code=en_US]',
        // Customer specific channels
        ROYAL_DESIGN: '[value="912"]',
        RUM21: '[value="913"]',
    },

    // Material Tab
    MATERIALS: {
        TAB: '[data-test=materials-tab]',
        FORM: {
            CONTAINER: ".edit-template-form",
            // Use this selectors on form object by cy.get(E.MATERIALS.FORM.CONTAINER).find(...)
            MATERIAL_1: '#material_field_1 > .vocabulary-lookup-wrapper > .vocabulary-lookup',
            MATERIAL_2: '#material_field_2 > .vocabulary-lookup-wrapper > .vocabulary-lookup',
            PERCENTAGE_1: 'input[name=material_1_percentage]',
            PERCENTAGE_2: 'input[name=material_2_percentage]',
        }
    },
}

// Router interceptors
export const R = {
    FORM: {
        method: 'POST',
        pathname: /\/d\/.*\/product\/.*\/form/,
    },
    ORIGINAL_TEXT: {
        method: 'POST',
        pathname: /\/d\/.*\/product\/.*\/edit\/original-text/,
    },
    TRANSLATIONS: {
        method: 'GET',
        pathname: /\/d\/.*\/product\/.*\/translations/,
    },
    PREVIEW: {
        method: 'POST',
        pathname: /\/d\/.*\/product\/.*\/preview/,
    },
    MATERIALS: {
        method: 'GET',
        pathname: /\/d\/.*\/product\/.*\/edit\/materials/,
    },
    FIELDS: {
        method: 'GET',
        pathname: /\/d\/.*\/product\/.*\/edit\/fields/,
    }
}
