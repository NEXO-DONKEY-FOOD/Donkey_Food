<div class="row">
                <div class="col-lg-1">
        <a href="Inventario.jsp">
        <button class="learn-more" style="margin-top: 40px; margin-left: 100px">
          <span class="circle" aria-hidden="true">
          <span class="icon arrow"></span>
          </span>
            <span class="button-text">Volver</span> 
        </button>
        </a>
                </div>
                <div class="col-lg-6">
                <div class="Namebox">
                    <font color="#1d134b"><b><center>CENTRO DE ESTUDIOS CIENTIFICOS Y TECNOLOGICOS N°9</center></b></font>
                </div>
                </div>
            </div>
<div style="max-width: 1200px; margin-top: 75px; margin-left: 75px">
<form action="Inventario.jsp">
                
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nombre">Escribe el ID del producto</label>
                <input type="text" class="form-control" id="idprod" placeholder="ID" name="idprod">
            </div>
        </div>
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="nombre">Escribe el nuevo nombre:</label>
                <input type="text" class="form-control" id="nomprod" placeholder="Nombre" name="nomprod">
            </div>
        </div>

        <div class="col">
            <div class="mb-3 mt-3">
                <label for="descripcion">Escribe la nueva descripción:</label>
                <input type="text" class="form-control" id="descprod" placeholder="Descripción" name="descprod">
            </div>
        </div>

        <div class="col">
            <div class="mb-3 mt-3">
                <label for="url">Escribe la cantidad de unidades:</label>
                <input type="text" class="form-control" id="uniprod" placeholder="Unidades" name="uniprod">
            </div>
        </div>
        
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="url">Escribe el precio del producto:</label>
                <input type="text" class="form-control" id="preprod" placeholder="Precio" name="preprod">
            </div>
        </div>

        
    <div class="row mt-4 grey" style="margin-left: 20px">
        <input type="hidden" id="action" name="action" value="change" />
        <div class=""input-group mb-3">
            <button type="submit" class="btn btn-primary" style="border-color: #1d134b; color: #ffffff; background-color: #1d134b;">Enviar</button>
            <button type="reset" class="btn btn-primary" style="border-color: #1d134b; color: #ffffff; background-color: #1d134b;">Borrar</button>
        </div>
    </div>
</form>
<br/>
</div>