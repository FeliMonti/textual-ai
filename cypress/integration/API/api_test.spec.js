describe('all api tests', () =>{
    it('Get', () => {
        cy.request('Get', 'https://reqres.in/api/users?page=2')
        .then((response => {
            expect(response).to.have.property('status', 200);

        }))
    })
})