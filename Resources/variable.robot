*** Variables ***
${BROWSER}  chrome
${WINDOW}  window-size=1920,1080
${URL}  https://dev.textual.ai/d/auth/login

${login_username_email_input}  name:username
${login_password_input}  id:id_password
${login_button}  xpath://button[contains(text(), "Log in")]
${customer_home_edit_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Edit")]

${product_list_search_button}  xpath://*[@data-testid="searchButton"]
${product_list_search_text_input}  xpath://*[@data-testid="searchQuery"]//input

${product_list_filter_by_date_button}  xpath://*[@data-testid="by-date"]
${product_list_filter_by_date_menu}  xpath://div[@data-testid="by-date"]/div[@class="visible menu transition"]
${product_list_filter_by_date_product_creation_date_option}  xpath://span[@class="text"][contains(text(), "Product creation date")]
${product_list_filter_by_date_latest_publication_date_option}  xpath://span[@class="text"][contains(text(), "Latest publication date")]
${product_list_filter_by_date_after_button}  xpath://div[@role="listbox"]//*[contains(text(), "After")]
${product_list_filter_by_date_before_button}  xpath://div[@role="listbox"]//*[contains(text(), "Before")]
${product_list_filter_by_date_after_datepicker}   xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..//*[@class="react-datepicker"]
${product_list_filter_by_date_before_datepicker}  xpath://div[@role="listbox"]//*[contains(text(), "Before")]/../..//*[@class="react-datepicker"]
${product_list_filter_by_date_after_date_button}  xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..//*[@class="react-datepicker"]/../..//*[@class="react-datepicker__week"]//div[@aria-label="Choose Saturday, October 1st, 2022"]
${product_list_filter_by_date_before_date_button}  xpath://div[@role="listbox"]//*[contains(text(), "Before")]/../..//*[@class="react-datepicker"]/../..//*[@class="react-datepicker__week"]//div[@aria-label="Choose Monday, October 31st, 2022"]
${product_list_filter_by_date_close_button}  xpath://*[@data-testid="close-btn"]

${product_list_filter_product_status_button}  xpath://*[@data-testid="product-status"]
${product_list_filter_product_status_menu}  xpath://*[@class="visible menu transition"]
${product_list_filter_product_status_show_all_option}  xpath://*[@data-testid="product-status-option-1"]
${product_list_filter_product_status_importing_option}  xpath://*[@data-testid="product-status-option-2"]
${product_list_filter_product_status_in_progress_option}  xpath://*[@data-testid="product-status-option-3"]
${product_list_filter_product_status_ready_option}  xpath://*[@data-testid="product-status-option-4"]

${product_list_filter_text_status_button}  xpath://*[@data-testid="text-status"]
${product_list_filter_text_status_menu}   xpath://*[@class="visible menu transition"]
${product_list_filter_text_status_show_all_option}  xpath: //*[@data-testid="text-status-option-1"]
${product_list_filter_text_status_needs_review_option}  xpath://*[@data-testid="text-status-option-2"]
${product_list_filter_text_status_approved_option}  xpath://*[@data-testid="text-status-option-3"]
${product_list_filter_text_status_waiting_to_be_published_option}  xpath://*[@data-testid="text-status-option-4"]
${product_list_filter_text_status_published_option}  xpath://*[@data-testid="text-status-option-5"]



${product_list_filters_translation_status_show_all_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[3]/div[2]
${product_list_filters_translation_status_missing_translations_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[3]/div[2]/div/div[2]
${product_list_filters_translation_status_complete_translations_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[3]/div[2]/div/div[3]
${product_list_filters_more_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[4]/div[1]
${product_list_filters_parent_child_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[4]/div[1]/div/div[2]
${product_list_filters_parent_child_relations_show_all_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]/div/div[2]
${product_list_filters_parent_child_relations_parents_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]/div/div[2]/div/div[2]
${product_list_filters_parent_child_relations_children_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]/div/div[2]/div/div[3]
${product_list_text_column_button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/button
${product_list_text_column_text&bullet_select_all_checkbox}  xpath=/html/body/div[5]/div/div[2]/div/div[2]/div/table/tfoot/tr/th[4]
${product_list_text_column_update_view_button}  xpath=/html/body/div[5]/div/div[3]/button[2]

${product_list_column_button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div
${product_list_column_EAN_checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[3]/div
${product_list_column_namespace_checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[4]/div
${product_list_column_namespace_product_type}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/thead/tr/th[3]
${product_list_column_oiginal_text_checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[5]/div
${product_list_column_text_statuses_checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[6]/div
${product_list_column_product_checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[7]/div
${product_list_column_group_children_with_parent_checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[15]
${product_list_column_update_button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[16]/button
${bar_menu}  xpath=/html/body/div[1]/div/div/a/i
${bar_menu_manage}  xpath=/html/body/div[1]/div/div/div/ul/li[12]/a/span
${bar_menu_manage_filter_group}  xpath=//html/body/div[4]/div/div[1]/ul/li[4]

${product_list_filters_default_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div
${product_list_filters_default_test}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div/div[2]/div[2]/div[1]
${product_list_filters_default_testtest}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/button[2]
${product_list_filters_save_as_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]
${product_list_filters_save_as_filter_group_input}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/input
${product_list_filters_save_as_filter_group_add}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/div[2]/div
${textual_logo}  xpath=/html/body/div[1]/div/a
${product_list_filters_save_as_choose_group_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/i
${product_list_filters_save_as_choose_group_demo_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/div[2]/div[4]
${product_list_filters_save_as_filter_name_input}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[5]/div/input
${product_list_filters_save_as_filter_name_create_filter_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[6]/button
${product_list_filters_successful_verification}  xpath=//*[@id="react-django-toast"]/div/div/div/div

${edit_list_edit_frame_1}  xpath=/html/body/iframe
${edit_list_edit_edit_button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[8]/div/div[1]/div[1]/a
${edit_list_name_input}  //*[@id="id_name"]
${edit_list_action_button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[1]/span[1]
${edit_list_new_button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[2]/a/span
${edit_list_duplicate_button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[2]/form[1]/button
${edit_list_copy_to_button}  data:testid:fromto
${edit_list_keyin_SKU_input}  xpath=/html/body/div[5]/div/div[2]/form/div[2]/div/input
${edit_list_copy_from_button}  data:testid:tofrom
${edit_list_set_status_button}  xpath=/html/body/div[3]/div[1]/div/div[3]/div/div[1]/span[1]
${edit_list_set_status_importing_radiobutton}  xpath=//*[@id="change-product-status-form"]/button[1]/i
${edit_list_set_status_in_progress_radiobutton}  xpath=//*[@id="change-product-status-form"]/button[2]/i
${edit_list_set_status_ready_radiobutton}  xpath=//*[@id="change-product-status-form"]/button[3]/i
${edit_list_set_status_copy_button}  xpath=/html/body/div[5]/div/div[4]/button[2]


#---Edit Function---#
${product_list_edit_button}  xpath://*[@data-table-cell="2-8"][@class="collapsing links"]//*[@data-testid="product-list-edit-button"]
${edit_list_subpage_iframe}  xpath://*[@class="subpage-iframe"]
${edit_list_edit_tab}  xpath://a[@data-test="edit-tab"]

${edit_list_main_catogary_input}  xpath://input[@data-testid="single-input"]   ###

${edit_list_edit_field_add}  xpath://div[@class="edit-fields"]//*[contains(text(), "Add")]
${edit_list_subpart_attribute_input}  xpath://div[@class="product-type-row"]//input[@data-testid="single-input"]'  ###


#---property---#
${edit_list_properties_input}  xpath://div[@class="row row-properties"]//input
${edit_list_properties_suggestions_container}  xpath://div[@class="row row-properties"]//div[@data-testid="suggestions-container"]
${edit_list_properties_menu_item_suggestion_item}  xpath://div[@class="row row-properties"]//*[contains(text(), "beautiful")]
${edit_list_properties_delete_icon}  xpath://div[@class="row row-properties"]//*[@data-testid="tag-remove"]

#---occasion---#
${edit_list_occasion_input}  xpath://div[@class="row row-occasion"]//input
${edit_list_occasion_suggestions_container}  xpath://div[@class="row row-occasion"]//div[@data-testid="suggestions-container"]
${edit_list_occasion_menu_item_suggestion_item}  xpath://div[@class="row row-occasion"]//*[contains(text(), "for the summer party")]
${edit_list_occasion_delete_icon}  xpath://div[@class="row row-occasion"]//*[@data-testid="tag-remove"]

#---color---#
${edit_list_color_input}  xpath://div[@class="row row-color"]//input
${edit_list_color_suggestions_container}  xpath://div[@class="row row-color"]//div[@data-testid="suggestions-container"]
${edit_list_color_menu_item_suggestion_item}  xpath://div[@class="row row-color"]//*[contains(text(), "orange")]
${edit_list_color_delete_icon}  xpath://div[@class="row row-color"]//*[@data-testid="tag-remove"]

#---material---#
${edit_list_material_input}  xpath://div[@class="row row-material"]//input
${edit_list_material_suggestions_container}  xpath://div[@class="row row-material"]//div[@data-testid="suggestions-container"]
${edit_list_material_menu_item_suggestion_item}  xpath://div[@class="row row-material"]//*[contains(text(), "metal")]
${edit_list_material_delete_icon}  xpath://div[@class="row row-material"]//*[@data-testid="tag-remove"]

#---made in---#
${edit_list_made_in_input}  xpath://div[@class="row row-made_in"]//input
${edit_list_made_in_suggestions_container}  xpath://div[@class="row row-made_in"]//div[@data-testid="suggestions-container"]
${edit_list_made_in_menu_item_suggestion_item}  xpath://div[@class="row row-made_in"]//*[contains(text(), "in Sweden")]
${edit_list_made_in_delete_icon}  xpath://div[@class="row row-made_in"]//*[@data-testid="tag-remove"]

#---designed in---#
${edit_list_designed_in_input}  xpath://div[@class="row row-designed_in"]//input
${edit_list_designed_in_suggestions_container}  xpath://div[@class="row row-designed_in"]//div[@data-testid="suggestions-container"]
${edit_list_designed_in_menu_item_suggestion_item}  xpath://div[@class="row row-designed_in"]//*[contains(text(), "in Italy")]
${edit_list_designed_in_delete_icon}  xpath://div[@class="row row-designed_in"]//*[@data-testid="tag-remove"]

#---position---#
${edit_list_position_input}  xpath://div[@class="row row-position"]//input
${edit_list_position_suggestions_container}  xpath://div[@class="row row-position"]//div[@data-testid="suggestions-container"]
${edit_list_position_menu_item_suggestion_item}  xpath://div[@class="row row-position"]//*[contains(text(), "in front")]
${edit_list_position_delete_icon}  xpath://div[@class="row row-position"]//*[@data-testid="tag-remove"]

#---phrase---#
${edit_list_phrase_input}  xpath://div[@class="row row-phrase"]//input
${edit_list_phrase_suggestions_container}  xpath://div[@class="row row-phrase"]//div[@data-testid="suggestions-container"]
${edit_list_phrase_menu_item_suggestion_item}  xpath://div[@class="row row-phrase"]//*[contains(text(), "for elegance")]
${edit_list_phrase_delete_icon}  xpath://div[@class="row row-phrase"]//*[@data-testid="tag-remove"]

#---fixed phrases---#
${edit_list_fixed_phrases_input}  xpath://div[@class="row row-fixed_phrases"]//input
${edit_list_fixed_phrases_suggestions_container}  xpath://div[@class="row row-fixed_phrases"]//div[@data-testid="suggestions-container"]
${edit_list_fixed_phrases_menu_item_suggestion_item}  xpath://div[@class="row row-fixed_phrases"]//*[contains(text(), "Easy on and off. (Lätt av och på.)")]
${edit_list_fixed_phrases_delete_icon}  xpath://div[@class="row row-fixed_phrases"]//*[@data-testid="tag-remove"]

#---labels---#
${edit_list_labels_input}  xpath://div[@class="field label-field"]//input
${edit_list_labels_add}  xpath://div[@role="listbox"]//*[@class="selected item addition"]
${edit_list_labels_delete_icon}  xpath://div[@class="field label-field"]//i[@class="delete icon"]
${edit_list_labels_default_text}  xpath://div[@class="default text"][contains(text(), "Type to search")]
#${edit_list_labels_combobox}  xpath://div[@class="field label-field"]//div[@role="combobox"]

#---name---#
${edit_list_name_input}  xpath://input[@id="id_name"]  #---it doesn't work if use this xpath to verify while return to edit subpage frame #
${edit_list_name_field_input}  xpath://div[@class="field name-field"]//input
${edit_list_subpage_back_button}  xpath://div[@class="subpage-back"]//button

#---additional information(original headline and original text---#
${edit_list_additional_information_column}  xpath://div[@class="column"]//*[contains(text(), "ADDITIONAL INFORMATION")]
${edit_list_original_headline_input}  xpath://input[@id="id_original_headline"]
${edit_list_original_text_textarea}  xpath://*[@id="id_original_text"]




#${edit_list_edit_frame_2}  xpath=/html/body/div[5]/div
#${edit_list_check_radiobutton}   xpath=/html/body/div[6]/div/div[2]/form/div[1]/div[2]/div
#${orange_eye_ico}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${green_tick_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${orange_hour_glass_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${blue_paper_areoplane_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
