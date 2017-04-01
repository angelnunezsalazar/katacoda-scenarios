Copia el siguiente código en el editor.

<pre class="file" data-filename="./test/unit-test/calculator-test.js" data-target="replace">
var expect   = require("chai").expect;
describe("Calculator", function(){
    it("adds two numbers", function () {
        expect(1+2).equal(3);
    }); 
    it("subtract two numbers", function () {
        expect(3-1).equal(2);
    }); 
});
</pre>

Ejecuta las pruebas desde el terminal utilizando el siguiente comando `make unit-tests`{{execute}}