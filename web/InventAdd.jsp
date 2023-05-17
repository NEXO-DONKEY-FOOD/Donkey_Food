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
                <label for="nombre">Escribe el nombre:</label>
                <input type="text" class="form-control" id="nomprod" placeholder="Nombre" name="nomprod" required>
            </div>
        </div>

        <div class="col">
            <div class="mb-3 mt-3">
                <label for="descripcion">Escribe la descripción:</label>
                <input type="text" class="form-control" id="descprod" placeholder="Descripción" name="descprod" required>
            </div>
        </div>

        <div class="col">
            <div class="mb-3 mt-3">
                <label for="url">Escribe la cantidad de unidades:</label>
                <input type="text" class="form-control" id="uniprod" placeholder="Unidades" name="uniprod" required>
            </div>
        </div>
        
        <div class="col">
            <div class="mb-3 mt-3">
                <label for="url">Escribe el precio del producto:</label>
                <input type="text" class="form-control" id="preprod" placeholder="Precio" name="preprod" required>
            </div>
        </div>
            <div class="col">
               <div class="mb-3 mt-3">
                <label for="url">Inserte una imagen del producto:</label>
                <input type="file" class="form-control" id="photoprod" name="photoprod">
                </div>
            </div>
        </div>

        
    <div class="row mt-4 grey" style="margin-left: 100px">
        <input type="hidden" id="action" name="action" value="send" />
        <div class=""input-group mb-3">
            <button type="submit" class="btn btn-primary" style="border-color: #1d134b; color: #ffffff; background-color: #1d134b;">Enviar</button>
            <button type="reset" class="btn btn-primary" style="border-color: #1d134b; color: #ffffff; background-color: #1d134b;">Borrar</button>
        </div>
    </div>
</form>
<br/>
</div>