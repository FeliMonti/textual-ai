describe('all api tests', () =>{
    it('Get', () => {
//file contains link to static test website. Work in progress. Not yet complete

        cy.request('Get', 'https://reqres.in/api/users?page=2')
        .then((response => {
            expect(response).to.have.property('status', 200);

        }))
    })
})