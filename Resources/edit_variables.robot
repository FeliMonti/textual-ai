*** Variables ***

${product_list_data_table_edit_button_1}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=1]//*[@data-testid="product-list-edit-button"]
${product_list_data_table_edit_button_2}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=2]//*[@data-testid="product-list-edit-button"]
${product_list_data_table_edit_button_3}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=3]//*[@data-testid="product-list-edit-button"]
${product_list_data_table_edit_button_4}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=4]//*[@data-testid="product-list-edit-button"]
${product_list_data_table_edit_button_5}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=5]//*[@data-testid="product-list-edit-button"]

#---edit function common variables---#
${edit_list_subpage_iframe}  xpath://iframe[@class="subpage-iframe"]
${edit_list_edit_tab}  xpath://a[@data-test="edit-tab"]
${edit_list_main_category_input}  xpath://input[@data-testid="single-input"]         ### 1 the same xpath as attribute
${edit_list_subpart_attribute_input}  xpath://input[@data-testid="single-input"]     ### 1
${edit_list_main_category_close_icon}  xpath://*[local-name()="svg"]   ###  2  the same xpath as attribute
${edit_list_subpart_attribute_close_icon}  xpath://*[local-name()="svg"]  ###  2
${edit_list_subpart_attribute_close}  xpath://*[@class="delete-button"]
${edit_list_request_button}  xpath://*[@class="option-request-word"]
${edit_list_request_submit_button}  xpath://button[@data-testid="requestwordmodal-button-submit"]
${edit_list_bulk_actions_menu_product_delete_products_html}  xpath://html[@lang="en_US"]
${edit_list_additional_information_button}  xpath://*[@class="ui text grey"]
${edit_list_original_text_ruta}  xpath://*[@id="id_original_text"]
${edit_list_data_table_original_text_1}  xpath://td[@data-table-cell="1-3"][@class="text-column"]
${edit_list_data_table_original_text_3}  xpath://td[@data-table-cell="3-3"][@class="text-column"]
${edit_list_data_table_original_text_4}  xpath://td[@data-table-cell="4-3"][@class="text-column"]  ###----There are two text-column in row 1, have to use the column to locate this element---#
${edit_list_suggestions_container}  xpath://div[@data-testid="suggestions-container"]
${edit_list_delete_icon}  xpath://*[@data-testid="tag-remove"]
${edit_list_subpage_back_button}  xpath://*[@class="subpage-back"]

#---action menu---#
${edit_list_actions_button}  xpath://*[@class="title"]/../..//*[@class="action menu"]
${edit_list_actions_menu}  xpath://*[@class="options"]
${edit_list_name_input}  xpath://input[@id="id_name"]
${edit_list_SKU_number}  xpath://h2
${edit_list_actions_new_button}  xpath://*[@class="material-icons"]/../..//*[@data-test="action-new"]
${edit_list_actions_duplicate_button}  xpath://*[@data-test="action-duplicate"]
${edit_list_actions_copy_from_button}  xpath://button[@data-testid="tofrom"]  #data:testid:tofrom
${edit_list_SKU_EAN_input}  xpath://*[@data-testid="SKU-EAN-input"]//input
${edit_list_actions_copy_from_copy_button}  xpath://*[@data-testid="copy-modal-copy-action"]
${edit_list_actions_copy_to_button}  xpath://button[@data-testid="fromto"]  #data:testid:fromto
${edit_list_actions_copy_to_copy_button}  xpath://*[@data-testid="copy-modal-copy-action"]
${edit_list_data_table_SKU_3}  xpath://td[@data-table-cell="3-2"]
${edit_list_data_table_SKU_4}  xpath://td[@data-table-cell="4-2"]

#---delete SKU---#
${edit_list_data_table_SKU_1}  xpath://td[@data-table-cell="1-2"]
${edit_list_data_table_checkbox_1}  xpath://*[@data-table-cell="1-1"]/*[@class="ui fitted checkbox select"]
${edit_list_bulk_actions_button}  xpath://*[contains(text(),"Bulk actions")]/../..//*[@name="bulk-actions"]
${edit_list_bulk_actions_menu}  xpath://*[@class="menu transition visible"]
${edit_list_bulk_actions_menu_product}  xpath://*[contains(text(),"Product")][@role="option"]
${edit_list_bulk_actions_menu_product_delete_products}  xpath://*[@data-testid="DeleteAction"]
${edit_list_bulk_actions_menu_product_delete_products_button}  xpath://button["pbutton phutton-primary"][contains(text(),"Delete products")]

#---set status button---#
${edit_list_set_status_button}  xpath://*[@class="product-status menu"]
${edit_list_set_status_menu}  xpath://*[@id="change-product-status-form"]
${edit_list_set_status_importing_radiobutton}  xpath://*[@id="change-product-status-form"]//*[contains(text(),"Importing")]
${edit_list_set_status_ready_radiobutton}  xpath://*[@id="change-product-status-form"]//*[contains(text(),"Ready")]
${edit_list_set_status_importing_cancel_button}  xpath://*[@class="ui button"][contains(text(),"Cancel")]
${edit_list_set_status_in_progress_radiobutton}  xpath://*[@id="change-product-status-form"]//*[contains(text(),"In progress")]  #//*[contains(text(),"In progress")
${edit_list_set_status_in_progress_status}  xpath://*[@class="title"]//*[text() = "In progress"]
${edit_list_data_table_product_status_column}  xpath://*[@class="status"][contains(text(),"Product Status")]
${edit_list_data_table_product_status_column_1}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=1]//*[@class="status"]

#---Main category---#
#${edit_list_main_category_sugestions_container}  xpath://div[@class="product-type-row"]//div[@data-testid="suggestions-container"]
#---Add main category---#
${edit_list_main_category_sugestions_container}  xpath://div[@class="product-type-row"]//div[@data-testid="suggestions-container"]
${edit_list_main_category_menu_item_suggestion_item}  xpath://div[@class="product-type-row"]//*[contains(text(), "shoes")]
${edit_list_main_category_product_selected_value}  xpath://*[@class="edit-fields"]//*[contains(text(), "shoes")]
${edit_list_main_category_edit_filed_product}  xpath://*[@class="edit-fields"]//*[contains(text(), "product")]
${edit_list_main_category_product_request_submit_value}   xpath://a[@class="active"]

#---subpart attribute---#
${edit_list_edit_field_add}  xpath://div[@class="edit-fields"]//*[contains(text(), "Add")]
${edit_list_subpart_attribute_new_attribute}  xpath://div[@class="subpart"]//*[contains(text(), "new attribute")]
${edit_list_subpart_attribute_suggestions_container}  xpath://div[@class="product-type-row"]//div[@data-testid="suggestions-container"]
#${edit_list_subpart_attribute_menu_item_suggestion_item}   xpath://div[@class="product-type-row"]//*[contains(text(), "attribute_input")]
${edit_list_subpart_attribute_new_attribute_selected_value}     xpath://a[@class="link active"]
${edit_list_subpart_attribute_new_attribute_selected}   xpath://a[@class="link"]

#---property---#
${edit_list_properties_input}  xpath://div[@class="row row-properties"]//input
#${edit_list_properties_menu_item_suggestion_item}  xpath://div[@class="row row-properties"]//*[contains(text(), "${properties_input}")]   #xpath doesn't work in variables list

#---occasion---#
${edit_list_occasion_input}  xpath://div[@class="row row-occasion"]//input
#${edit_list_occasion_menu_item_suggestion_item}  xpath://div[@class="row row-occasion"]//*[contains(text(), "${occasion_input}")]

#---color---#
${edit_list_color_input}  xpath://div[@class="row row-color"]//input
#${edit_list_color_menu_item_suggestion_item}  xpath://div[@class="row row-color"]//*[contains(text(), "${color_input}")]

#---material---#
${edit_list_material_input}  xpath://div[@class="row row-material"]//input
#${edit_list_material_menu_item_suggestion_item}  xpath://div[@class="row row-material"]//*[contains(text(), "material_input")]

#---made in---#
${edit_list_made_in_input}  xpath://div[@class="row row-made_in"]//input
#${edit_list_made_in_menu_item_suggestion_item}  xpath://div[@class="row row-made_in"]//*[contains(text(), "${made_in_input}")]

#---designed in---#
${edit_list_designed_in_input}  xpath://div[@class="row row-designed_in"]//input
#${edit_list_designed_in_menu_item_suggestion_item}  xpath://div[@class="row row-designed_in"]//*[contains(text(), "${designed_in_input}")]

#---position---#
${edit_list_position_input}  xpath://div[@class="row row-position"]//input
#${edit_list_position_menu_item_suggestion_item}  xpath://div[@class="row row-position"]//*[contains(text(), "${position_input}")]

#---phrase---#
${edit_list_phrase_input}  xpath://div[@class="row row-phrase"]//input
#${edit_list_phrase_menu_item_suggestion_item}  xpath://div[@class="row row-phrase"]//*[contains(text(), "${phrase_input}")]

#---fixed phrases---#
${edit_list_fixed_phrase_input}  xpath://div[@class="row row-fixed_phrases"]//input
#${edit_list_fixed_phrase_menu_item_suggestion_item} xpath://div[@class="row row-fixed_phrase"]//*[contains(text(), "${fixed_phrase_input}")]

#---labels---#
${edit_list_labels_input}  xpath://div[@class="field label-field"]//input
${edit_list_labels_add_item}  xpath://div[@role="listbox"]//*[@class="selected item addition"]
${edit_list_labels_delete_icon}  xpath://div[@class="field label-field"]//i[@class="delete icon"]

#---name---#
${edit_list_name_input}  xpath://input[@id="id_name"]
${edit_list_subpage_back_button}  xpath://div[@class="subpage-back"]//button

#---additional information(original headline and original text---#
${edit_list_additional_information_column}  xpath://div[@class="column"]//*[contains(text(), "ADDITIONAL INFORMATION")]
${edit_list_original_headline_input}  xpath://input[@id="id_original_headline"]
${edit_list_original_text_textarea}  xpath://*[@id="id_original_text"]


#${orange_eye_ico}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${green_tick_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${orange_hour_glass_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${blue_paper_areoplane_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
#${edit_list_check_radiobutton}  xpath=/html/body/div[6]/div/div[2]/form/div[1]/div[2]/div
#${product_list_menu_manage_filter_group}  xpath=//html/body/div[4]/div/div[1]/ul/li[4]
