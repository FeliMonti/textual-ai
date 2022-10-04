*** Variables ***
${BROWSER}  chrome
${WINDOW}  window-size=1920,1080
${URL}  https://dev.textual.ai/d/auth/login

#${mail}  xpath=/html/body/div[4]/div[1]/form/div[1]/input
${login_username_email_input}  name:username
#${password}  id:id_password
${login_password_input}  id:id_password
#${log_in_button}  xpath=/html/body/div[4]/div[1]/form/div[3]/button
#${login_button}  xpath://*[@class="login"]//button
#${login_button}   xpath://*[@class="pbutton pbutton-primary"][contains(text(), "Log in")]
${login_button}  xpath://button[contains(text(), "Log in")]
#${edit_button}  xpath=/html/body/div[4]/div[1]/div[2]/div[4]/a
${customer_home_edit_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Edit")]

${product_list_search_button}  xpath://*[@data-testid="searchButton"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[1]/form/div/div[2]/button
${product_list_search_text_input}  xpath://*[@data-testid="searchQuery"]//input
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[1]/form/div/div[1]/div/input

${product_list_filter_by_date_button}  xpath://*[@data-testid="by-date"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]
${product_list_filter_by_date_menu}  xpath://div[@data-testid="by-date"]/div[@class="visible menu transition"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]
${product_list_filter_by_date_product_creation_date_option}  xpath://span[@class="text"][contains(text(), "Product creation date")]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]/div[1]/span
${product_list_filter_by_date_latest_publication_date_option}  xpath://span[@class="text"][contains(text(), "Latest publication date")]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]/div[2]/span
${product_list_filter_by_date_after_button}  xpath://div[@role="listbox"]//*[contains(text(), "After")]
#xpath://span/b[@style="font-weight: normal;"][contains(text(), "After")]
#/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]
${product_list_filter_by_date_before_button}  xpath://div[@role="listbox"]//*[contains(text(), "Before")]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/i
${product_list_filter_by_date_after_datepicker}   xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..//*[@class="react-datepicker"]
#xpath://div[@class="ui active visible basic button dropdown sc-fzqARJ eLpUJW tiny"]/div[@class="menu transition visible"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/div
${product_list_filter_by_date_before_datepicker}  xpath://div[@role="listbox"]//*[contains(text(), "Before")]/../..//*[@class="react-datepicker"]
#xpath://div[@class="ui active visible basic button dropdown sc-fzqARJ eLpUJW tiny"]/div[@class="menu transition visible"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/div
#${product_list_filter_by_date_after_previous_month_button}  xpath:
${product_list_filter_by_date_after_date_button}  xpath://div[@role="listbox"]//*[contains(text(), "After")]/../..//*[@class="react-datepicker"]/../..//*[@class="react-datepicker__week"]//div[@aria-label="Choose Saturday, October 1st, 2022"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/div/div/div/div[2]/div[2]/div[1]/div[5]
${product_list_filter_by_date_before_date_button}  xpath://div[@role="listbox"]//*[contains(text(), "Before")]/../..//*[@class="react-datepicker"]/../..//*[@class="react-datepicker__week"]//div[@aria-label="Choose Monday, October 31st, 2022"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/div/div/div/div[2]/div[2]/div[3]/div[4]
#xpath://div[@aria-label="Choose Friday, September 30th, 2022"]
#${product_list_filter_by_date_after_chosen_listbox}  #xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/span/b
#${product_list_filter_by_date_before_chosen_listbox}  #xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/span/b
${product_list_filter_by_date_close_button}  xpath://*[@data-testid="close-btn"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/i

${product_list_filter_product_status_button}  xpath://*[@data-testid="product-status"]
#xpath= /html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]
${product_list_filter_product_status_menu}  xpath://*[@class="visible menu transition"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div
${product_list_filter_product_status_show_all_option}  xpath://*[@data-testid="product-status-option-1"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/div
${product_list_filter_product_status_importing_option}  xpath://*[@data-testid="product-status-option-2"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[2]/div
${product_list_filter_product_status_in_progress_option}  xpath://*[@data-testid="product-status-option-3"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/div
${product_list_filter_product_status_ready_option}  xpath://*[@data-testid="product-status-option-4"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[4]

${product_list_filter_text_status_button}  xpath://*[@data-testid="text-status"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]
${product_list_filter_text_status_menu}   xpath://*[@class="visible menu transition"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div
${product_list_filter_text_status_show_all_option}  xpath: //*[@data-testid="text-status-option-1"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[1]/div
${product_list_filter_text_status_needs_review_option}  xpath://*[@data-testid="text-status-option-2"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]/div
${product_list_filter_text_status_approved_option}  xpath://*[@data-testid="text-status-option-3"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[3]/div
${product_list_filter_text_status_waiting_to_be_published_option}  xpath://*[@data-testid="text-status-option-4"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[4]/div
${product_list_filter_text_status_published_option}  xpath://*[@data-testid="text-status-option-5"]
#xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[5]/div

#${orange_eye_ico}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${green_tick_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${orange_hour_glass_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${blue_paper_areoplane_icon}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
