*** Variables ***
${WINDOW}  window-size=1920,1080
${BROWSER}  chrome
${URL}  https://dev.textual.ai/d/auth/login
${login_username_email_input}  name:username
${login_password_input}  id:id_password
${login_button}  xpath://button[contains(text(), "Log in")]
${customer_home_edit_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Edit")]

${product_list_filter_translation_status_button}  xpath://*[@data-testid="translation-status"][@role="listbox"]
${product_list_filter_translation_status_menu}  xpath://*[@class="visible menu transition"]
${product_list_filter_translation_status_show_all_option}  xpath://*[@data-testid="translation-status-option-1"]
${product_list_filter_translation_status_missing_translations_option}  xpath://*[@data-testid="translation-status-option-2"]
${product_list_filter_translation_status_complete_translations_option}  xpath://*[@data-testid="translation-status-option-3"]

${product_list_filter_more_button}  xpath://*[@data-testid="product-filter-add-filter"]
${product_list_filter_more_menu}  xpath://*[@data-testid="product-filter-add-filter"]//*[@class="menu transition visible"]
${product_list_filter_more_parent_child_option}  xpath://*[@data-testid="parentChild"]

${product_list_filter_parent_child_button}  xpath://*[@data-testid="parent-child-relations"]
${product_list_filter_parent_child_menu}  //*[@data-testid="parent-child-relations"]//*[@class="visible menu transition"]
${product_list_filter_parent_child_relations_show_all_option}  xpath://*[@data-testid="parent-child-relations-option-1"]
${product_list_filter_parent_child_relations_parents_option}  xpath://*[@data-testid="parent-child-relations-option-2"]
${product_list_filter_parent_child_relations_children_option}  xpath://*[@data-testid="parent-child-relations-option-3"]

${product_list_text_column_button}  xpath://*[@data-testid="channel-language-selector-button-open-button"]
${product_list_text_column_text&bullet_select_all_checkbox}  xpath://*[@data-testid="select-all-checkbox-1056"]
${product_list_text_column_update_view_button}  xpath://*[@data-testid="submitButton"][contains(text(), "Update view")]

${product_list_column_button}  xpath://*[@data-testid="columns-selector-button"]
${product_list_column_EAN_checkbox}  xpath://*[@data-testid="EAN"]
${product_list_column_product_type_checkbox}  xpath://*[@data-testid="product_type"]
${product_list_column_oiginal_text_checkbox}  xpath://*[@data-testid="original_text"]
${product_list_column_text_statuses_checkbox}  xpath://*[@data-testid="text_statuses"]
${product_list_column_product_checkbox}  xpath://*[@data-testid="product"]
${product_list_column_group_children_with_parent_checkbox}  xpath://div[@role="option"]//*[contains(text(),"Group children with parent")]/../..//*[@class="ui checked checkbox"]
${product_list_column_update_button}  xpath://*[@data-testid="update-selected-columns-button"]

${product_list_menu}  xpath://a[@href="#"][@title="Menu"]
${product_list_menu_manage}  xpath://*[@class="timeout"]//*[contains(text(),"Manage")]
${product_list_filters_default_button}  xpath://*[@data-testid="filter-group-dropdown"]
${product_list_filters_default_test}  xpath://*[@data-testid="accordian-title-TEST"]
${product_list_filters_default_testtest}  xpath://*[@class="ui mini fluid vertical buttons"]//*[contains(text(),"Testtest")]
${product_list_filters_save_as_button}  xpath://*[@data-testid="product-filter-saveas-button"]
${product_list_filters_save_as_filter_group_input}  xpath://input[@class="search"]
${product_list_filters_save_as_filter_group_add}  xpath:'//div[@role="option"]//*[contains(text(),"Add")]/../..//*[@class="text"]
${textual_logo}  xpath://*[@class="logo"]
${product_list_filters_save_as_choose_group_option}  xpath://div[@role="combobox"]//*[contains(text(),"Choose Group")]/../..//*[@class="search"]
${product_list_filters_save_as_choose_group_demo_option}  xpath://*[@class="text"][contains(text(),"Demo")]
${product_list_filters_save_as_filter_name_input}  xpath://input[@placeholder="Filter name..."]
${product_list_filters_save_as_filter_name_create_filter_button}  xpath://button[contains(text(),"Create Filter")]
${product_list_filters_successful_verification}  xpath://*[@id="react-django-toast"]
${product_list_edit_button}  xpath://*[@data-table-cell="1-8"][@class="collapsing links"]//*[@data-testid="product-list-edit-button"]

${edit_list_subpage_iframe}  xpath://*[@class="subpage-iframe"]
${edit_list_edit_tab}  xpath://a[@data-test="edit-tab"]
${edit_list_name_input}  xpath://input[@id="id_name"]
${edit_list_action_button}  xpath://*[@class="action menu"]
${edit_list_action_new_button}  xpath://*[@data-test="action-new"]
${edit_list_action_duplicate_button}  xpath://*[@data-test="action-duplicate"]
${edit_list_action_copy_to_button}  xpath://button[@data-testid="fromto"]  #data:testid:fromto
${edit_list_SKU_EAN_input}  xpath://*[@data-testid="SKU-EAN-input"]//input
${edit_list_action_copy_from_button}  xpath://button[@data-testid="tofrom"]  #data:testid:tofrom
${edit_list_set_product_status_button}  xpath://*[@class="product-status menu"]
${edit_list_set_status_importing_radiobutton}  xpath://*[@id="change-product-status-form"]//*[contains(text(),"Importing")]
${edit_list_set_status_in_progress_radiobutton}  xpath://*[@id="change-product-status-form"]//*[contains(text(),"In progress")]
${edit_list_set_status_ready_radiobutton}  xpath://*[@id="change-product-status-form"]//*[contains(text(),"Ready")]

#${edit_list_check_radiobutton}
#xpath=/html/body/div[6]/div/div[2]/form/div[1]/div[2]/div
#${product_list_menu_manage_filter_group}
#xpath=//html/body/div[4]/div/div[1]/ul/li[4]
