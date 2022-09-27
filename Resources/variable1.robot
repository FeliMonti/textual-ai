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

#${orange_eye_ico}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${green_tick_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${orange_hour_glass_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${blue_paper_areoplane_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
