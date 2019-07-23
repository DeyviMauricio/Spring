<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Prestamos</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <scrip>
        
    </scrip>
    </head>
  
    <body>
       <div class="container mt-4 col-lg-4">
            <div class="card border-success">
                <div class="card-header bg-success text-white">
                    <h4>Prestar Libro</h4>
                </div>
            </div>
            <div class="card-body">               
                <label>Autor </label>
                <input type="text" class="form-control" value="${lista[0].nom_autor}" disabled="true">
                
                <label>Estado del Libro </label>
                <input type="text" class="form-control" value="${lista[0].estado}" disabled="true">
                
                <label>Fecha de Prestamo </label>
                <input type="date" name="prestamo" class="form-control" value="${lista[0].prestamo}" disabled="true">
                
                 <label>Fecha de Entrega </label>
                 <input type="date" name="entrega"class="form-control" value="${lista[0].entrega}" disabled="true" >
                 
                <form method="POST">                      
                    <label>Usuario</label>
                    <select name="id_usuario" class="form-control">
                        <c:forEach var="usuario" items="${Usuario}">                       
                             <option value="${usuario.idUser}">${usuario.nombre}</option>
                        </c:forEach> 
                   </select>    
                    <input type="hidden" name="id_libro" class="form-control" value="${lista[0].idLibro}">
                    <div class="text-center">
                    <br>
                    <input type="submit" value="Agregar" class="btn btn-info">
                    <a href="index.htm" class="btn btn-danger">Cancelar</a>
                    </div>
                </form>
            </div>
        </div>
        
        
    </body>
</html>
