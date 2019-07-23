<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Libros Prestados</title>
    </head>
    <body>
        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <a class="btn btn-light" href="index.htm">Biblioteca</a>
                </div>
            </div><br>
            <form class="form-inline float-right" action="filtrar.htm">
               <input type="search" name="txtUsuario" class="form-control" placeholder="Nombre Usuario">
               
                <input type="submit" value="Buscar" class="btn btn-primary">
            </form><br><br>
            
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nombre</th>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Fecha Entrega</th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <c:forEach var="prestado" items="${Prestamo}">
                            <tr>
                                <td>${prestado.idPrestamo}</td>
                                <td>${prestado.nombre}</td>
                                <td>${prestado.titulo}</td>
                                <td>${prestado.nom_autor}</td>
                                <td>${prestado.entrega}</td>                                  
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
