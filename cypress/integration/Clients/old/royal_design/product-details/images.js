import {E} from '../../../pages/product-details'
import {AUTHENTICATION} from "../../../support/commands";

describe('Product details', () => {
  function randomString(length) {
    let result = '';
    const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
    const charactersLength = characters.length;
    for (let i = 0; i < length; i++) {
      result += characters.charAt(Math.floor(Math.random() * charactersLength));
    }
    return result;
  }


  it('Images', () => {
    const [username, password, token] = AUTHENTICATION["royalDesign"]
    let ID = randomString(10)
    let SKU = randomString(10)
    cy.request({
      method: "POST",
      url: "/api/v2/product",
      headers: {Token: token},
      body: {
        id: ID,
        external_id: SKU,
        imported_metadata: {"testkey": 34},
        images: [{image_url: "http://example.com/image.jpg"}],
      }
    })

    cy.textualLogin('royalDesign', `/d/royal-design/product/${ID}`)
    cy.get(E.IMAGE)
      .should('be.visible')
      .and("have.attr", "src", "http://example.com/image.jpg")

    // Change to images tab
    cy.get(E.IMAGES_TAB).click()
    cy.get(E.IMAGES_TAB_IMAGE)
      .should('be.visible')
      .and("have.attr", "src", "http://example.com/image.jpg")
  })
})
