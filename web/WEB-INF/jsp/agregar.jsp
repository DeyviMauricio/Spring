<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Libro</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <div class="container mt-4 col-lg-4"">
            <div class="card border-success">
                <div class="card-header bg-success text-white">
                    <h4>Agregar Nuevo Registro</h4>
                </div>
            </div>
            <div class="card-body">
                <form method="POST">
                    <label>Titulo</label>
                    <input type="text" name="titulo" class="form-control">
                    <label>Genero</label>
                    <select name="id_genero" class="form-control">
                        <c:forEach var="genero" items="${Genero}">                       
                             <option value="${genero.idGenero}">${genero.descripcion}</option>
                        </c:forEach> 
                   </select>
                    <label>Autor</label>
                    <select name="id_autor" class="form-control">
                        <c:forEach var="autor" items="${Autor}">                       
                             <option value="${autor.idAutor}">${autor.nom_autor}</option>
                        </c:forEach> 
                   </select>
                    <label>Año publicación</label>
                    <input type="text" name="publicacion" class="form-control">
                    <label>Editorial</label>
                     <input type="text" name="editorial" class="form-control">   
                    <label>Stock</label>
                    <input type="text" name="stock" class="form-control" value="1">
                    <label>Estado</label>
                    <input type="text" name="estado" class="form-control" value="Disponible">
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
