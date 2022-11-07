*** Variables ***

#---product list common variables---#
${product_list_search_button}  xpath://*[@data-testid="searchButton"]
${product_list_search_text_input}  xpath://*[@data-testid="searchQuery"]//input
${product_list_data_table}  xpath://table[@data-testid="products-table"]
${product_list_product_filter_clear_button}  xpath://button[@data-testid="product-filter-clear-button"]
#${product_list_edit_button}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=4]//*[@data-testid="product-list-edit-button"]
#${product_list_edit_button}  xpath://table[@data-testid="products-table"]//tr[@data-table-row=5]//*[@data-testid="product-list-edit-button"]

#---search for SKU---#
${product_list_sku_column_in_products_table}  xpath://*[@data-testid="products-table"]//th[contains(text(), "SKU")]

#---filter by date---#
${product_list_filter_by_date_button}  xpath://*[@data-testid="by-date"]
${product_list_filter_by_date_menu}  xpath://div[@data-testid="by-date"]/div[@class="visible menu transition"]
${product_list_filter_by_date_product_creation_date_option}  xpath://span[@class="text"][contains(text(), "Product creation date")]
${product_list_filter_by_date_latest_publication_date_option}  xpath://span[@class="text"][contains(text(), "Latest publication date")]
${product_list_filter_by_date_after_button}  xpath://div[@data-testid="by-date"]/following-sibling::div[1]
${product_list_filter_by_date_before_button}  xpath://div[@data-testid="by-date"]/following-sibling::div[2]

#---product status---#
${product_list_filter_product_status_button}  xpath://*[@data-testid="product-status"]
${product_list_filter_product_status_menu}  xpath://*[@class="visible menu transition"]
${product_list_filter_product_status_show_all_option}  xpath://*[@data-testid="product-status-option-1"]
${product_list_filter_product_status_importing_option}  xpath://*[@data-testid="product-status-option-2"]
${product_list_filter_product_status_in_progress_option}  xpath://*[@data-testid="product-status-option-3"]
${product_list_filter_product_status_ready_option}  xpath://*[@data-testid="product-status-option-4"]
#${product_list_product_status_column_in_products_table}  xpath://*[@data-testid="products-table"]//th[contains(text(), "Product Status")]  #
#${product_list_product_status_row_in_products_table}  xpath://tr[@data-table-row="1"]//td[@class="status"]  #
${product_list_product_table_product_status_cell}   xpath://td[@class="status"]

#---text status---#
${product_list_filter_text_status_button}  xpath://*[@data-testid="text-status"]
${product_list_filter_text_status_menu}   xpath://div[@data-testid="text-status"]//*[@class="visible menu transition"]
${product_list_filter_text_status_show_all_option}  xpath: //*[@data-testid="text-status-option-1"]
${product_list_filter_text_status_needs_review_option}  xpath://*[@data-testid="text-status-option-2"]
${product_list_filter_text_status_approved_option}  xpath://*[@data-testid="text-status-option-3"]
${product_list_filter_text_status_waiting_to_be_published_option}  xpath://*[@data-testid="text-status-option-4"]
${product_list_filter_text_status_published_option}  xpath://*[@data-testid="text-status-option-5"]
${product_list_text_status_column_in_products_table}  xpath://th[@class="three wide text-column"][contains(text(), "Text Statuses")]   #
${product_list_product_table_text_statuses_cell}  xpath://td[@class="text-column"]//div[@data-testid="product-list-text-statuses-cell"]  #it is for text statuses column
#${product_list_product_table_text_statuses_cell_flag_icon}   xpath:
#${product_list_product_table_text_bullet_cell_orange_eye_icon}  xpath:
${product_list_product_table_text_column}   xpath://td[@class="text-column"]  #it could refer to test status, text&bullets on different languages
${product_list_data_text_status_needs_reviewed_orange_eye_icon}  xpath://td[@class="text-column"]//i[@data-text-status="needs-reviewed"]
${product_list_data_text_status_approved_green_tick_icon}  xpath://td[@class="text-column"]//i[@data-text-status="approved"]
${product_list_data_text_status_waiting_to_be_published_orange_hour_glass_icon}  xpath://td[@class="text-column"]//i[@data-text-status="waiting-to-be-published"]
${product_list_data_text_status_published_blue_paper_areoplane_icon}   xpath://td[@class="text-column"]//i[@data-text-status="published"]

#---translation status---#
${product_list_filter_translation_status_button}  xpath://*[@data-testid="translation-status"][@role="listbox"]
${product_list_filter_translation_status_menu}  xpath://*[@class="visible menu transition"]
${product_list_filter_translation_status_show_all_option}  xpath://*[@data-testid="translation-status-option-1"]
${product_list_filter_translation_status_missing_translations_option}  xpath://*[@data-testid="translation-status-option-2"]
${product_list_filter_translation_status_complete_translations_option}  xpath://*[@data-testid="translation-status-option-3"]
${product_list_data_text_column_missing_translation_flag_icon}  xpath://td[@class="text-column"]//i[@data-text-status="missing-translation"]

#---more function---#
${product_list_filter_more_button}  xpath://*[@data-testid="product-filter-add-filter"]
${product_list_filter_more_menu}  xpath://*[@data-testid="product-filter-add-filter"]//*[@class="menu transition visible"]
${product_list_filter_more_parent_child_option}  xpath://*[@data-testid="parentChild"]

#---parent child relations---#
${product_list_filter_parent_child_button}  xpath://*[@data-testid="parent-child-relations"]
${product_list_filter_parent_child_menu}  //*[@data-testid="parent-child-relations"]//*[@class="visible menu transition"]
${product_list_filter_parent_child_relations_show_all_option}  xpath://*[@data-testid="parent-child-relations-option-1"]
${product_list_filter_parent_child_relations_parents_option}  xpath://*[@data-testid="parent-child-relations-option-2"]
${product_list_filter_parent_child_relations_children_option}  xpath://*[@data-testid="parent-child-relations-option-3"]
${product_list_filter_parent_child_option_close_button}   xpath://i[@data-testid="close-btn-choice"]   #

#---text column---#
${product_list_text_column_button}  xpath://*[@data-testid="channel-language-selector-button-open-button"]
${product_list_text_column_select_column}  xpath://*[@class="header"][contains(text(),"Select column(s)")]
#${product_list_text_column_text&bullet_select_all_checkbox}  xpath://*[@data-testid="select-all-checkbox-1056"]   #for textual AB
${product_list_text_column_text&bullet_select_all_checkbox}  xpath://*[@data-testid="select-all-checkbox-1494"]    #for textual testing account
${product_list_text_column_update_view_button}  xpath://*[@data-testid="submitButton"][contains(text(), "Update view")]

#---column function---#
${product_list_column_button}  xpath://*[@data-testid="columns-selector-button"]//*[@role="listbox"]
${product_list_column_menu}  xpath://*[@class="menu transition left"]
${product_list_column_EAN_checkbox}  xpath://*[@data-testid="EAN"]
${product_list_column_product_type_checkbox}  xpath://*[@data-testid="product_type"]
${product_list_column_oiginal_text_checkbox}  xpath://*[@data-testid="original_text"]
${product_list_column_text_statuses_checkbox}  xpath://*[@data-testid="text_statuses"]
${product_list_column_product_checkbox}  xpath://*[@data-testid="product"]
${product_list_column_group_children_with_parent_checkbox}  xpath://div[@role="option"]//*[contains(text(),"Group children with parent")]/..
${product_list_column_update_button}  xpath://*[@data-testid="update-selected-columns-button"]

#---create filter group---#
${product_list_filter_default_button}  xpath://*[@data-testid="filter-group-dropdown"]
${product_list_filter_default_menu}  xpath://*[@class="menu transition visible"]
${product_list_filter_default_test}  xpath://*[@data-testid="accordian-title-TEST"]
${product_list_filter_default_testtest}  xpath://*[@class="ui mini fluid vertical buttons"]/button[contains(text(),"Testtest")]
${product_list_filter_save_as_button}  xpath://*[@data-testid="product-filter-saveas-button"]
${product_list_filter_save_as_filter_group_input}  xpath://input[@class="search"]
${product_list_filter_save_as_filter_group_add}  xpath://div[@role="option"]/*[contains(text(),"Add")]
${product_list_filter_save_as_filter_name_input}  xpath://input[@placeholder="Filter name..."]
${product_list_filter_save_as_filter_name_create_filter_button}  xpath://button[contains(text(),"Create Filter")]
${product_list_filter_successful_verification}  xpath://*[@id="react-django-toast"]
${hamburger_menu_dropdown_manage_filter_groups}  xpath://*[contains(text(),"Manage filter groups.")]/..
#${hamburger_menu_dropdown_manage_filter_groups_delete}  xpath://*[contains(text(),${group_name})]/../..//button[contains(text(), "Delete")]

#---icon in table---#
#${orange_eye_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${green_tick_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${orange_hour_glass_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${blue_paper_areoplane_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
#${edit_list_check_radiobutton}  xpath=/html/body/div[6]/div/div[2]/form/div[1]/div[2]/div
#${product_list_menu_manage_filter_group}  xpath=//html/body/div[4]/div/div[1]/ul/li[4]
