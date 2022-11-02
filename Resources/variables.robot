# Variablea common to all modules

*** Variables ***
${BROWSER}  chrome
${WINDOW}  window-size=1920,1080
${HEADLESS}  False
${APP_URL}  https://dev.textual.ai
${LOGIN_URL}  ${APP_URL}/d/auth/login
${API_TOKEN}  7d9efb7d289041eb88ca5929018c339880ea5154919e40729e5c748fbb148147
# ${USERNAME}  textualtest
${USERNAME}  regrtestaccount
${PASSWORD}  test987!

${login_username_email_input}  name:username
${login_password_input}  id:id_password
${login_button}  xpath://button[contains(text(), "Log in")]
${customer_home_edit_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Edit")]
${customer_home_create_button}  xpath://a[@class="pbutton pbutton-primary"][contains(text(), "Create")]
${textual_logo}  xpath://*[@class="logo"]

${hamburger_menu_button}  xpath://div[@class="dropdown"]/a[@title="Menu"]
# ${hamburger_menu_dropdown}  xpath://*[@class="material-icons"][contains(text(),"menu")]/../..
${hamburger_menu_dropdown}  xpath://div[@class="dropdown"]/div
${hamburger_menu_dropdown_manage}  xpath://div[@class="dropdown"]/div//span[contains(text(),"Manage")]/..
${hamburger_menu_dropdown_logout}  xpath://div[@class="dropdown"]/div//a[contains(text(),"Logout")]

${subpage_iframe}  xpath://iframe[@class="subpage-iframe"]
