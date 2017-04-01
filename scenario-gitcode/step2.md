Comienza ejecutando todas las pruebas unitarias `make e2e-tests`{{execute}}

Abre la clase `./test/e2e-test/chrome-test.js` y agrega una nueva prueba unitaria.

<pre class="file" data-filename="./test/e2e-test/chrome-test.js" data-target="replace">
var expect   = require("chai").expect;
describe("Chrome", function(){
    it("gets the title of Chrome top page", function () {
        const title = browser.url('https://www.google.com/chrome/').getTitle()
        expect(title).equal('Chrome Web Browser');
    });
});
</pre>

Ejecuta nuevamente todas las pruebas `make e2e-tests`{{execute}}