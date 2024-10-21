*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${BROWSER}          Edge
${URL}              http://localhost:5173/allcourse?editMajor=25531471103793
${XPATH_FIGURE}     //*[@id="root"]/div/div[2]/div[2]/div/form/div[1]/div[5]/details[1]/summary
${XPATH_BUTTON}     //*[@id="root"]/div/div[2]/div[2]/div/form/div[1]/div[5]/details[1]/div/ul/li[1]/span
${XPATH_SECOND}     //*[@id="root"]/div/div[2]/div[2]/div/form/div[1]/div[5]/details[1]/div/ul/li[1]/span
${SEARCH_RESULT}    1500202


*** Test Cases ***
Navigate to Course Page, Wait for Loading, Double Click Element, and Wait
    [Documentation]    Navigate to the course page, wait for loading, double-click the specified element, and wait for 5 seconds.
    [Tags]    navigation, wait, click
    Open Course Page
    Wait for and Double Click Element
    Wait After Double Click
    Click Second Element
    Capture Page Screenshot
    Close Browser


*** Keywords ***
Open Course Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Wait for and Double Click Element
    Wait Until Element Is Visible    xpath=${XPATH_FIGURE}    timeout=2s
    Double Click Element    xpath=${XPATH_FIGURE}

Wait After Double Click
    Sleep    5s

Click Second Element
    Wait Until Element Is Visible    xpath=${XPATH_SECOND}    timeout=2s
    Click Element    xpath=${XPATH_SECOND} 

Verify Search Results
    Page Should Contain    ${SEARCH_RESULT}
