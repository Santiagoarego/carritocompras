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
var cantidadproductos;
function agregarFila() {
    var table = document.getElementById("totalProductos");
    var e = document.getElementById("products");
    var producto = e.options[e.selectedIndex].text;
    var idproducto = e.options[e.selectedIndex].value;
    var precioCompra = document.getElementById("precompra").value;
    var cantidad = document.getElementById("canticompra").value;
    var credito = document.getElementById("credito").checked;
    cantidadproductos = document.getElementById("cantidadFactura").value;
    cantidadproductos++;
    document.getElementById("cantidadFactura").value=cantidadproductos;
    var rowCount = table.rows.length;
    console.log(idproducto)
    console.log(cantidadproductos);
    table.insertRow(-1).innerHTML = '<td><p id="'+idproducto+'">'+producto+'</p></td><td><p>'+precioCompra+'</p></td><td><p>'+cantidad+'</p></td><td><p>'+credito+'</p></td><td><p>'+(cantidad*precioCompra)+'</p></td>';
}

function eliminarFila() {
    var table = document.getElementById("totalProductos");
    var rowCount = table.rows.length;
    //console.log(rowCount);

    if (rowCount <= 1)
        alert('No se puede eliminar el encabezado');
    else
        table.deleteRow(rowCount - 1);
    cantidadproductos = document.getElementById("cantidadFactura").value;
    cantidadproductos--;
    document.getElementById("cantidadFactura").value=cantidadproductos;
}







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
