*** Variables ***
${BROWSER}  chrome
${WINDOW}  window-size=1920,1080
${URL}  https://dev.textual.ai/d/auth/login

${mail}  xpath=/html/body/div[4]/div[1]/form/div[1]/input
${password}  id:id_password
${log_in_button}  xpath=/html/body/div[4]/div[1]/form/div[3]/button
${edit_button}  xpath=/html/body/div[4]/div[1]/div[2]/div[4]/a

${product_list_search_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[1]/form/div/div[2]/button
${product_list_search_text_input}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[1]/form/div/div[1]/div/input
${product_list_filter_by_date_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]
${product_list_filter_by_date_menu}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]
${product_list_filter_by_date_product_creation_date_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]/div[1]/span
${product_list_filter_by_date_latest_publication_date_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]/div[2]/span
${product_list_filter_by_date_after_dropdownicon_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/i
${product_list_filter_by_date_before_dropdownicon_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/i
${product_list_filter_by_date_after_datepicker}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/div
${product_list_filter_by_date_before_datepicker}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/div
${product_list_filter_by_date_after_date_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/div/div/div/div[2]/div[2]/div[1]/div[5]
${product_list_filter_by_date_before_date_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/div/div/div/div[2]/div[2]/div[3]/div[4]
${product_list_filter_by_date_after_chosen_listbox}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/span/b
${product_list_filter_by_date_before_chosen_listbox}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/span/b
${product_list_filter_by_date_close_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/i

${product_list_filter_product_status_button}  xpath= /html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]
${product_list_filter_product_status_menu}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div
${product_list_filter_product_status_show_all_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/div
${product_list_filter_product_status_importing_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[2]/div
${product_list_filter_product_status_in_progress_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/div
${product_list_filter_product_status_ready_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[4]

${product_list_filter_text_status_button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]
${product_list_filter_text_status_menu}   xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div
${product_list_filter_text_status_show_all_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[1]/div
${product_list_filter_text_status_needs_review_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]/div
${product_list_filter_text_status_approved_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[3]/div
${product_list_filter_text_status_waiting_to_be_published_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[4]/div
${product_list_filter_text_status_published_option}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[5]/div

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

#${edit_list_edit_frame_2}  xpath=/html/body/div[5]/div
#${edit_list_check_radiobutton}   xpath=/html/body/div[6]/div/div[2]/form/div[1]/div[2]/div
#${orange_eye_ico}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${green_tick_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${orange_hour_glass_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${blue_paper_areoplane_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
