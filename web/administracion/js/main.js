function muestra_oculta(id) {
    if (document.getElementById) { //se obtiene el id
        var el = document.getElementById(id); //se define la variable "el" igual a nuestro div
        el.style.display = (el.style.display == 'none') ? 'block' : 'none'; //damos un atributo display:none que oculta el div
    }
}
window.onload = function () {/*hace que se cargue la función lo que predetermina que div estará oculto hasta llamar a la función nuevamente*/
    muestra_oculta('divControlProducto');/* "contenido_a_mostrar" es el nombre que le dimos al DIV */
    muestra_oculta('divAddProduct');
   
}
function agregarFila() {
    var table = document.getElementById("addProduct");
    var rowCount = table.rows.length;
    table.insertRow(-1).innerHTML = '<td><select><option value="chocolate">Chocolate</option><option value="condon">Condones</option></select></td><td><input type="Number" id="precompra' + (rowCount - 1) + '" placeholder="Ingrese el Precio compra"></td><td><input type="number" id="canticompra' + (rowCount - 1) + '" placeholder="Ingrese cantidad"></td><td><input type="checkbox" id="credito' + (rowCount - 1) + '"> </td><td><p id="subtotal' + (rowCount - 1) + '"></p></td>';
}

function eliminarFila() {
    var table = document.getElementById("addProduct");
    var rowCount = table.rows.length;
    //console.log(rowCount);

    if (rowCount <= 2)
        alert('No se puede eliminar el encabezado');
    else
        table.deleteRow(rowCount - 2);
}

function agregarFilaProducto() {
    var table = document.getElementById("newProduct");
    var rowCount = table.rows.length;
    table.insertRow(-1).innerHTML = '<td><input type="Number" id="precompra' + (rowCount - 1) + '" onkeyup="calcularSubtotal("precompra' + (rowCount - 1) + '")" placeholder="Ingrese el Precio compra"></td><td><input type="number" id="canticompra' + (rowCount - 1) + '" placeholder="Ingrese cantidad" onkeyup="calcularSubtotal("canticompra' + (rowCount - 1) + '")"></td><td><input type="checkbox" id="credito' + (rowCount - 1) + '"> </td><td><p id="subtotal' + (rowCount - 1) + '"></p></td>';
}

function eliminarFilaProducto() {
    var table = document.getElementById("newProduct");
    var rowCount = table.rows.length;
    //console.log(rowCount);

    if (rowCount <= 2)
        alert('No se puede eliminar el encabezado');
    else
        table.deleteRow(rowCount - 2);
}
function calcularSubtotal(id) {
    var cantidad = document.getElementById(id).value;
    var precio = document.getElementById(id).value;
    document.getElementById(id).innerHTML = (+cantidad) * (+precio);
    console.log(((+cantidad) * (+precio)));
}
;


$(function () {
    $('#newproduct').validate({
        rules: {
            nombre: {
                required: true
            },
            id: {
                required: true
            }


        },
        submitHandler: function (form) {
            var data = $('#newproduct').serialize();
            $.post("CrearProducto", data, function (res, est, jqXHR) {
                alert(res);
                if (res == "El producto ha sido registrado correctamente") {
                    location.href = "./panel.jsp";
                }
                else {
                    location.href = "./newProduct.jsp";
                }
            });
        }});

});
