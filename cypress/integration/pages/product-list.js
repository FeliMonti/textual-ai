export const PL_E = {
    LIST: {
        SELECT_CHECKBOX: '.collapsing.select > div',
    },
    BULK_ACTION: {
        FORM: '#bulk-actions',
        SELECT_FIELD: '#bulk-actions > div > div.menu.transition > div:nth-child(1)',
        PUBLISH_OPTION: 'option[value="texts"]',
        GENERATE_TEXT_CONFIG: {
            GENERATE_BTN: 'button[data-test="generate-texts"]',
            REVIEW_BTN: 'button[data-test="review-texts"]',
            CHANNELS: 'ul[data-test="channel-choices"] > li',
            LANGUAGES: 'ul[data-test="language-choices"] > li',
        },
        GENERATE_TEXT_CONFIRM: {
            DOWNLOAD_BTN: 'button[data-test="download"]',
            PUBLISH_BTN: 'a[data-test="publish"]',
            CONFIRM_MSG: '.alert-box.success > .inner > p',
        },
        PUBLISH_CONFIG: {
            PRODUCT_COUNT: '.container > :nth-child(1) > :nth-child(2)',
            NEXT_BTN: '.actions > button',
            LANGUAGES: {
                SELECT_ALL: '.select-all',
                DESELECT_ALL: '.deselect-all',
                EN_US: 'input[value="244"]',
            },
        },
    },
}
