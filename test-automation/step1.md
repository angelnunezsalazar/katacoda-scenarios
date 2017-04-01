Comienza ejecutando todas las pruebas unitarias `make unit-tests`{{execute}}

Abre la clase `./test/unit-test/calculator-test.js` y agrega una nueva prueba unitaria.

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

Ejecuta nuevamente todas las pruebas `make unit-tests`{{execute}}