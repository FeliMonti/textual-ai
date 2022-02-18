from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support.select import Select
from selenium.common.exceptions import NoSuchElementException
from Selectors import SelectBy

import logins
import logging
import pytest

from random import randint
from os import getcwd
from datetime import datetime


# Used as a base for the regression testing, always initialized before a test (tests)

class Session():

    path = getcwd()
    screenshots_path = path+'ErrorScreenshots/'

    options = webdriver.ChromeOptions()
    options.add_argument('--no-sandbox')
    #options.add_argument('--headless')
    options.add_experimental_option('excludeSwitches', ['enable-logging'])
    service = Service(path+'/chromedriver_98')
    driver = webdriver.Chrome(service=service, options=options)
    driver.implicitly_wait(5)

    base_url = 'https://dev.textual.ai'
    logging.getLogger().setLevel(logging.INFO)

    logged_in = False
    product_id = None  # The current product the session is testing

    # Settings
    stop_on_error = True  # Stop the tests or move on to the next one upon error

    def __init__(self, customer):
        self.customer = customer  # name, user, pw
    
    def login(self):
        self.driver.get(self.base_url)
        assert 'login' in self.driver.current_url

        username = self.driver.find_element(By.NAME, 'username')
        username.send_keys(self.customer.USER)
        password = self.driver.find_element(By.NAME, 'password')
        password.send_keys(self.customer.PW)
        login_button = self.driver.find_element(By.CLASS_NAME, 'pbutton-primary')
        login_button.click()
        
        assert self.customer.NAME in self.driver.current_url
        logging.info(f'Login to {self.customer.NAME} successful')
        self.logged_in = True

    def assert_element_present(self, selector, value):
        try:
            element = self.driver.find_element(selector, value)
            logging.info(f'{value} found ( method: {selector} )')
            return element

        except Exception as msg:
            logging.exception(f'''Exception when running function: assert_element_present({selector},{value})\n{msg}''')
            self.handle_error()

    def change_selector_value(self, element, select_by, value):
        try:
            selector = Select(element)
            if select_by == SelectBy.VALUE:
                selector.select_by_value(value)
            elif select_by == SelectBy.VISIBLE_TEXT:
                selector.select_by_visible_text(value)
            elif select_by == SelectBy.INDEX:
                selector.select_by_index(value)

        except Exception as msg:

            logging.exception(f'''Exception when running function: change_selector_value({element},{value})\n{msg}\n*Selector as in e.g a dropdown, not to be confused with css-selectors''')
            self.handle_error()

    def handle_error(self):
        # Take screenshot and potentially stop
        # Example name: 2022-02-18 18:27:12
        # Doesn't work with --headless option
        self.driver.save_screenshot(
            f"{self.screenshots_path}{datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M:%S')}.png"
            )
        if self.stop_on_error:
            raise

    def quit_session(self):
        logging.info('Terminating session')
        self.driver.quit()
        quit()































def create_new_product(session):
    session.driver.get(session.base_url + '/d/' + session.customer.NAME + '/products')       # Navigate to product list
    session.driver.find_element(By().CSS_SELECTOR, '[data-action="create-product"]').click() # Create new product
    current_url = session.driver.current_url
    assert 'product/' in current_url, "Create new product: 'product/' not in current url"
    product_id = current_url.split('/')[-1]

    assert product_id in current_url, f"Create new product: product id ({product_id}) not in current url"
    logging.info(f'New product {product_id} created') 
    session.product_id = product_id


def test_product_edit_top_fields(session):
    logging.info('Starting test: Product edit top fields')

    # Create new product if none is opened
    if not session.product_id:
        create_new_product(session)

    # Open the sessions current product
    session.driver.get(session.base_url+'/d/'+session.customer.NAME+'/product/'+session.product_id)

    # Check all top (metadata) fields
    # Name
    name = session.assert_element_present(By().ID, 'id_name')
    name.send_keys('TestName')

    # SKU
    sku = session.assert_element_present(By().ID, 'id_external_id')
    sku.send_keys('RegrTesting'+str(randint(1, 10000)))

    # Brand
    brand = session.assert_element_present(By().CSS_SELECTOR,'[class="field brand-field"]') # Brand
    brand_input = brand.find_element(By().TAG_NAME, 'input')
    brand_input.send_keys('TESTBRAND')

    # Predefined_title
    if session.customer.NAME in ['textual-ab', 'NA-KD']:        
        session.assert_element_present(By().CLASS_NAME, 'predefined-title-component')# Title (predefined)
        if session.customer.NAME == 'NA-KD':
            pass # Add a title
    
    # Labels
    labels = session.assert_element_present(By().CSS_SELECTOR,'[class="field label-field"]') # Labels
    labels_input = labels.find_element(By().TAG_NAME, 'input')
    labels_input.send_keys('TESTLABEL')

    # Parent, only checks if field is present. Parent testing is part of another test
    session.assert_element_present(By().CSS_SELECTOR,'[data-react-component="ProductDetailEditParentButton"]')

    # Original headline
    original_headline = session.assert_element_present(By().ID, 'id_original_headline')
    original_headline.send_keys('ORIGINAL HEADLINE TEST')

    # Original text
    original_text = session.assert_element_present(By().ID, 'id_original_text')
    original_text.send_keys('This is an original text')

    # Notes
    if session.customer.NAME == 'textual-ab':
        notes = session.assert_element_present(By().ID, 'id_notes')
        notes.send_keys('Here is some notes')

    #Original text language
    original_text_lang = session.assert_element_present(By().ID, 'id_language')

    #session.driver.refresh()

    status_dropdown = session.assert_element_present(By().CSS_SELECTOR, '[data-react-component="ProductStatusButton"]')
    # status_dropdown.click()
    # ready_button = status_dropdown.find_element(By().)

    #session.driver.find_element(By().CSS_SELECTOR, '[data-test="edit-tab"]').click() #Switch to Edit tab

    #assert session.driver.find_element(By().CLASS_NAME, 'edit'), 'Edit tab not found'

if __name__ == '__main__':
    session = Session(logins.Textual_AB())
    session.login()
    test_product_edit_top_fields(session=session)


    #sleep(5)
    #session.quit()
    
