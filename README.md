https://gitlab.com/textual-ai/e2e-testing

End to End testing
===================

This framework uses JavaScript based CYpress testing
on [Cypress](https://cypress.io).

Installation
============

```
$ cd e2e
$ npm install Cypress
```

Developing tests
===============

Normally you would develop tests against your local machine, that you can do by:
```
$ npm run cypress:open
```

This will open up a window that embeds a web browser(Electon)and allowing you to 
use other browers installed on your machine(Edge, Firefox , Safari, ..) plus showing 
the status of the tests.  The amazing  part of testing with Cypress is that while 
running in manually or through the runner you have available screenshots that show 
you exactly where  the test failed. 
Saving in your editor will rerun the tests.

You can also develop against staging or dev, by typing one of:

```
$ npm run cypress:open-dev

```


Structure of Directlry
=============
The tests written need to be saved in the cypress/ integration folder. The Directory 
structure is as follows
/Project
   /.git
   /android
   /cypress
		/fixtures
		/integration
			/API
			/Clients
			/loginCheck
			/mapping
			/pages
			/Web
			/App   (testing for clients on the app environment)
			/Dev
		/plugin
		/reports
		/screenshots
		/support
		/videos
   .npmrc
   cypress.json
   package.json
   Readme.md
   
	/

Writing tests
=============

We can write them against a specific customer, like Babyshop and remember:
* Add elements and network mockups in the beginning of the file probably in the pages directory
* For newly developed backend code, use data-test=xxx selectors to make it future proof
* Write tests so that they can run many times, don't depend on existing products being there
* Use random numbers to avoid conflicts in fields like SKU
* If necessary, delete created objects after you're finished
* For now, login in the beforeEach() setup function before each test.

Run tests
=========

You can run tests locally or in docker container. To run tests locally:

```
$ npm run cypress:run
$ npm run cypress:run-dev
$ npm run cypress:run-staging
```

Or to use docker container:
```
docker run -it -v  $(pwd)/e2e/:/e2e/ -v  $(pwd)/.git/:/e2e/.git/ <<cypress image from Dockerfile>> npm run cypress:run[-dev|-staging]
```

For CI runner use (to be added)
```
docker run -it -v  $(pwd)/e2e/:/e2e/ -v  $(pwd)/.git/:/e2e/.git/ <<cypress image from Dockerfile>> npm run cypress:run-dev -- --ci-build-id XXX
```