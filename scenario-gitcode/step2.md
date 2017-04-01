Copia el siguiente código en el editor.

<pre class="file" data-filename="./test/e2e-test/chrome-test.js" data-target="replace">
var expect   = require("chai").expect;
describe("Chrome", function(){
    it("gets the title of Chrome top page", function () {
        const title = browser.url('https://www.google.com/chrome/').getTitle()
        expect(title).equal('Chrome Web Browser');
    });
});
</pre>

Ejecuta las pruebas desde el terminal utilizando el siguiente comando `make e2e-tests`{{execute}}