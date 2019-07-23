<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    <a class="btn btn-light" href="usuario.htm">Registrarse</a>
                    <a class="btn btn-light" href="agregar.htm">Nuevo Libro</a>
                    <a class="btn btn-light" href="prestado.htm">Libros Prestados</a>
                    <a class="btn btn-light float-right" href="index.htm">Biblioteca</a>
                </div>
            </div><br>
            <form class="form-inline float-right" action="buscar.htm">
               <input type="search" name="txtAutor" class="form-control" placeholder="Nombre Autor">
               <input type="search" name="txtPublicacion" class="form-control" placeholder="Año Publicación">
               <select name="cboGenero" class="form-control">
                    <option value="">Genero</option>
                    <c:forEach var="genero" items="${Genero}">                       
                         <option >${genero.descripcion}</option>
                    </c:forEach> 
               </select>
                <input type="submit" value="Buscar" class="btn btn-primary">
            </form><br><br>
            
            <div class="card-body">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>Titulo</th>
                            <th>Genero</th>
                            <th>Autor</th>
                            <th>Año publación</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach var="libro" items="${Lista}">
                            <tr>
                                <td>${libro.titulo}</td>
                                <td>${libro.descripcion}</td>
                                <td>${libro.nom_autor}</td>
                                <td>${libro.año_publicacion}</td>
                                <td>${libro.estado}</td>
                                <td>
                                    <a class="btn btn-primary" href="prestar.htm?id=${libro.idLibro}">Prestarse</a>
                                    <a class="btn btn-warning" href="editar.htm?id=${libro.idLibro}">Editar</a>
                                    <a class="btn btn-danger" href="eliminar.htm?id=${libro.idLibro}">Eliminar</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
