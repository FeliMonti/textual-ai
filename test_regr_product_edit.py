import logging
from typing import List, Any

import logins
from Session import Session
from Selectors import SelectBy

from selenium.webdriver.common.by import By

from random import randint
from time import sleep


session = Session(logins.Textual_AB)


def test_create_new_product():

    if not session.logged_in:
        session.login()

    session.driver.get(session.base_url + '/d/' + session.customer.NAME + '/products')  # Navigate to product list
    session.driver.find_element(By().CSS_SELECTOR, '[data-action="create-product"]').click()  # Create new product
    current_url = session.driver.current_url
    assert 'product/' in current_url, "Create new product: 'product/' not in current url"
    product_id = current_url.split('/')[-1]

    assert product_id in current_url, f"Create new product: product id ({product_id}) not in current url"
    logging.info(f'New product {product_id} created')
    session.product_id = product_id


def test_product_edit_top_fields():
    if not session.logged_in:
        session.login()
    logging.info('Starting test: Product edit top fields')

    # Create new product if none is opened
    if not session.product_id:
        test_create_new_product()

    # Open the sessions current product
    session.driver.get(session.base_url + '/d/' + session.customer.NAME + '/product/' + session.product_id)

    # Check all top (metadata) fields
    # Name
    name = session.assert_element_present(By().ID, 'id_name')
    name.send_keys('TestName')

    # SKU
    sku = session.assert_element_present(By().ID, 'id_external_id')
    sku.send_keys('RegrTesting' + str(randint(1, 10000)))

    # Brand
    brand = session.assert_element_present(By().CSS_SELECTOR, '[class="field brand-field"]')  # Brand
    brand_input = brand.find_element(By().TAG_NAME, 'input')
    brand_input.send_keys('TESTBRAND')

    # Predefined_title
    if session.customer.NAME in ['textual-ab', 'NA-KD']:
        session.assert_element_present(By().CLASS_NAME, 'predefined-title-component')  # Title (predefined)
        if session.customer.NAME == 'NA-KD':
            # TODO: Add a predefined title
            pass

    # Labels
    labels = session.assert_element_present(By().CSS_SELECTOR, '[class="field label-field"]')  # Labels
    labels_input = labels.find_element(By().TAG_NAME, 'input')
    labels_input.send_keys('TESTLABEL')

    # Parent, only checks if field is present. Parent testing is part of another test
    session.assert_element_present(By().CSS_SELECTOR, '[data-react-component="ProductDetailEditParentButton"]')

    # Original headline
    original_headline = session.assert_element_present(By().ID, 'id_original_headline')
    original_headline.send_keys('This is an original headline')

    # Original text
    original_text = session.assert_element_present(By().ID, 'id_original_text')
    original_text.send_keys('This is an original text')

    # Notes
    if session.customer.NAME == 'textual-ab':
        notes = session.assert_element_present(By().ID, 'id_notes')
        notes.send_keys('Here is some notes')

    # Original text language
    original_text_lang = session.assert_element_present(By().ID, 'id_language')
    options = [i.strip() for i in original_text_lang.text.split("\n") if i.strip()]  #  String manip to remove whitespace from the selector options
    assert options
    # Make sure all options work
    for option in options:
        original_text_lang = session.assert_element_present(By().ID, 'id_language') #  Need to fetch it every time or element becomes stale
        session.change_selector_value(original_text_lang, SelectBy.VISIBLE_TEXT, option)
        sleep(1)
    # Set it back to the original language
    original_text_lang = session.assert_element_present(By().ID, 'id_languagee')
    session.change_selector_value(original_text_lang, SelectBy.VALUE, session.customer.MASTER_LANGUAGE)

    session.driver.refresh()

    # name = session.assert_element_present(By().ID, 'id_name')

    # session.assert_element_present(By().CSS_SELECTOR, '[value="TestName"]')


    # status_dropdown = session.assert_element_present(By().CSS_SELECTOR, '[data-react-component="ProductStatusButton"]')
    # status_dropdown.click()
    # ready_button = status_dropdown.find_element(By().)

    # session.driver.find_element(By().CSS_SELECTOR, '[data-test="edit-tab"]').click() #Switch to Edit tab

    # assert session.driver.find_element(By().CLASS_NAME, 'edit'), 'Edit tab not found'

if __name__ == '__main__':
    test_product_edit_top_fields()


    