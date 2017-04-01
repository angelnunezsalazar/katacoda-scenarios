Comienza ejecutando todas las pruebas end to end `make e2e-tests`{{execute}}

Abre la clase `./test/e2e-test/amazon-test.js` y agrega una nueva prueba unitaria.

<pre class="file" data-filename="./test/e2e-test/amazon-test.js" data-target="replace">
var expect   = require("chai").expect;
describe("Amazon", function(){
    it("allows to search books", function () {
        browser.url('https://www.amazon.com/')
        browser.setValue('#twotabsearchtextbox', 'Experiences of Test Automation')
        browser.click('input.nav-input[type=submit]')
        
        html=browser.getHTML('#atfResults');
        expect(html).to.contain('Experiences of Test Automation: Case Studies of Software Test Automation');
    });
});
</pre>

Ejecuta nuevamente todas las pruebas `make e2e-tests`{{execute}}