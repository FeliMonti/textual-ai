# Variablea common to all modules

*** Variables ***
${BROWSER}  chrome
${WINDOW}  window-size=1920,1080
${LOGIN_URL}  https://dev.textual.ai/d/auth/login

${login_username_email_input}  name:username
${login_password_input}  id:id_password
${login_button}  xpath://button[contains(text(), "Log in")]
${customer_home_edit_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Edit")]
${customer_home_create_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Create")]
${textual_logo}  xpath://*[@class="logo"]

${product_list_menu_button}  xpath://div[@class="dropdown"]/a[@title="Menu"]
# ${product_list_menu_dropdown}  xpath://*[@class="material-icons"][contains(text(),"menu")]/../..
${product_list_menu_dropdown}  xpath://div[@class="dropdown"]/div
${product_list_menu_dropdown_manage}  xpath://div[@class="dropdown"]/div//span[contains(text(),"Manage")]/..
${product_list_menu_dropdown_logout}  xpath://div[@class="dropdown"]/div//a[contains(text(),"Logout")]
