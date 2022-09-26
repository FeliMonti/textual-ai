*** Variables ***
${WINDOW}  window-size=1920,1080
${BROWSER}  chrome
${URL}  https://dev.textual.ai/d/auth/login
${MAIL}  xpath=/html/body/div[4]/div[1]/form/div[1]/input
${PASSWORD}  //*[@id="id_password"]
${Log_In_Button}  xpath=/html/body/div[4]/div[1]/form/div[3]/button
${Edit_Button}    xpath=/html/body/div[4]/div[1]/div[2]/div[4]/a
${Translation_Status_Showall}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[3]/div[2]
${Translation_Status_Missing}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[3]/div[2]/div/div[2]
${Translation_Status_Complete}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[3]/div[2]/div/div[3]
${More_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[4]/div[1]
${Parent_Child_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[4]/div[1]/div/div[2]
${Parent-child_Relations_Showall}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]/div/div[2]
${Parent-child_Relations_Parents}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]/div/div[2]/div/div[2]
${Parent-child_Relations_Children}   xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[2]/div/div[2]/div/div[3]
${Text_Column_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/button
${Text&Bullet_Select-all_Button}  xpath=/html/body/div[5]/div/div[2]/div/div[2]/div/table/tfoot/tr/th[4]
${Update-view_Button}  xpath=/html/body/div[5]/div/div[3]/button[2]
${Column_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div
${EAN_Checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[3]/div
${Namespace_Checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[4]/div
${Oiginal-text_Checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[5]/div
${Text-statuses_Checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[6]/div
${Product_Checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[7]/div
${Group-children-with-parent_Checkbox}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[15]
${Update_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/div[2]/div/div[2]/div[16]/button
${Bar-menu_Button}  xpath=/html/body/div[1]/div/div/a/i
${Manage_Button}  xpath=/html/body/div[1]/div/div/div/ul/li[12]/a/span
${Viewset_Button}  xpath=//html/body/div[4]/div/div[1]/ul/li[4]
${Edit_Edit_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[8]/div/div[1]/div[1]/a
${Name_Input}  //*[@id="id_name"]
${Default_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div
${Test_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div/div[2]/div[2]/div[1]
${Testtest_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[1]/div[2]/div[2]/div[2]/div/button[2]
${Save-as_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]
${Save-as_Input}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/input
${Add_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/div[2]/div
${Textual_Button}  xpath=/html/body/div[1]/div/a
${Filter-name_Input}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[5]/div/input
${Create-filter_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[6]/button
${Successful_verification}  xpath=//*[@id="react-django-toast"]/div/div/div/div
${Choose-Filter-Group_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/i
${Demo_Button}  xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[2]/div[2]/div[3]/div[2]/div[2]/div/div[2]/div[4]
${Edit_Frame}  xpath=/html/body/iframe

${Action_Button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[1]/span[1]
${New_Button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[2]/a/span
${Duplicate_Button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[2]/form[1]/button
${Copy-to_Button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[2]/div[1]/button
${Type_SKU_Input}  xpath=/html/body/div[6]/div/div[2]/form/div[2]/div/input
${Copy-from_Button}  xpath=/html/body/div[3]/div[1]/div/div[2]/div[2]/div[2]/button
${Set-status_Button}  xpath=/html/body/div[3]/div[1]/div/div[3]/div/div[1]/span[1]
${Importing_Radiobutton}  xpath=//*[@id="change-product-status-form"]/button[1]/i
${In-progress_Radiobutton}  xpath=//*[@id="change-product-status-form"]/button[2]/i
${Ready_Radiobutton}  xpath=//*[@id="change-product-status-form"]/button[3]/i
${Copy_To_Page}  xpath=/html
                       #/html/body/div[6]/div
                       #/html/body/div[6]
                       #/html/body/iframe
                       #/html
                       /html/body/iframe
                       /html/body/div[6]/div
                       /html/body/div[6]/div
                       /html/body/div[6]
                       

${Check_Radiobutton}   xpath=/html/body/div[6]/div/div[2]/form/div[1]/div[2]/div
