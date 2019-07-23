<%-- 
    Document   : usuario
    Created on : 19-jul-2019, 16:16:27
    Author     : Sam
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Registrar Usuario</title>
    </head>
    <body>
        <div class="container mt-4 col-lg-4"">
            <div class="card border-success">
                <div class="card-header bg-success text-white">
                    <h4>Nuevo Usuario!</h4>
                </div>
            </div>
            <div class="card-body">
                <form method="POST">
                    <label>Nombre</label>
                    <input type="text" name="nombre" class="form-control">
                    <label>Apellido</label>
                    <input type="text" name="apellidos" class="form-control">
                    <label>Dirección</label>
                    <input type="text" name="direccion" class="form-control">
                    <label>Numero Celular</label>
                    <input type="text" name="celular" class="form-control">
                    <label>E-mail</label>
                     <input type="text" name="email" class="form-control">

                    <br>
                    <div class="text-center">
                    <input type="submit" value="Agregar" class="btn btn-info">
                    <a href="index.htm" class="btn btn-danger">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
