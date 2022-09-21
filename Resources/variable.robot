*** Variables ***
${BROWSER}                 chrome
${WINDOW}                  window-size=1920,1080
${URL}                     https://dev.textual.ai/d/auth/login
${MAIL}                    xpath=/html/body/div[4]/div[1]/form/div[1]/input
${PASSWORD}                id:id_password
${LOGINBUTTON}             xpath=/html/body/div[4]/div[1]/form/div[3]/button
${MENU}                    xpath=/html/body/div[1]/div/div/a/i
${EDITBUTTON}              xpath=/html/body/div[4]/div[1]/div[2]/div[4]/a
${SEARCHMENU}              xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[1]/form/div/div[2]/button
${SEARCHTEXT}              xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[1]/form/div/div[1]/div/input
${TABLE}                   xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table

${BYDATE_LIST}             xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]
${BYDATE_LISTBOX}          xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]
${PRODUCTCREATIONDATE}     xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]/div[1]/span
${LATESTPULICATIONDATE}    xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[1]/div[2]/div[2]/span
${AFTER_DROPDOWNICON}      xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/i
${BEFORE_DROPDOWNICON}     xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/i
${AFTER_DATEMENU}          xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/div
${BEFORE_DATEMENU}         xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/div
${AFTER_DATEBUTTON}        xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/div/div/div/div[2]/div[2]/div[1]/div[5]
${BEFORE_DATEBUTTON}       xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/div/div/div/div[2]/div[2]/div[3]/div[4]
${CHOSEN_AFTERDATE}        xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[2]/span/b
${CHOSEN_BEFOREDATE}       xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/div[3]/span/b
${DELETEDATE}              xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[1]/i


#${CREATEDAT_DESCEDINGSORTED}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/thead/tr/th[7]

${PRODUCTSTATUS_BUTTON}    xpath= /html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]
${PRODUCTSTATUS_MENU}      xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div
${SHOWALLPRODUCTSTATUS_OPTION}   xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[1]/div
${IMPORTING_OPTION}        xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[2]/div
${INPROGRESS_OPTION}       xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[3]/div
${READY_OPTION}            xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[1]/div[2]/div/div[4]

${TEXTSTATUS_BUTTON}       xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]
${TEXTSTATUS_MENU}         xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div
${SHOWALLTEXTSTATUS_OPTION}      xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[1]/div
${NEEDSREVIEW_OPTION}      xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[2]/div
${APPROVED_OPTION}         xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[3]/div
${WAITINGTOBEPUBLISHED_OPTION}    xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[4]/div
${PUBLISHED_OPTION}        xpath=/html/body/div[4]/div/div[2]/div/div[1]/div/div[3]/div/div[2]/div[1]/div[2]/div[2]/div/div[5]/div

#${ORANGEEYE_ICON}          xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]
#${GREENTICK_ICON}          xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr/td[4]/div/i/i
#${ORANGEHOURGLASS_ICON}    xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[1]/td[4]/div/i[1]/i
#${BLUEPAPERAEROPLANE_ICON}  xpath=/html/body/div[4]/div/div[2]/div/div[2]/div/table/tbody/tr[2]/td[7]/div/i/i
