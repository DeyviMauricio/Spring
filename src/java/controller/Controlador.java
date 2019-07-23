package controller;

import entidad.Libro;
import entidad.Prestamo;
import entidad.Usuario;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import services.Conexion;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class Controlador {

    Conexion cnn = new Conexion();
    JdbcTemplate jdbcTemplate = new JdbcTemplate(cnn.Conectar());
    ModelAndView mav = new ModelAndView();
    int id;
    List datos;

   /*------------------------------------------*/
    @RequestMapping("index.htm")
    public ModelAndView Listar() {
        String libro = "call listarLibros();";
        String genero = "select*from genero";
        String autor = "select*from autor";

        List l = jdbcTemplate.queryForList(libro);
        List g = jdbcTemplate.queryForList(genero);
        List a = jdbcTemplate.queryForList(autor);

        mav.addObject("Lista", l);
        mav.addObject("Genero", g);
        mav.addObject("Autor", a);
        
        mav.setViewName("index");
        return mav;

    }  
    @RequestMapping("buscar.htm")
    public ModelAndView Filtrar(HttpServletRequest request) {
        String id_genero=request.getParameter("cboGenero");
        String id_autor=request.getParameter("txtAutor"); 
        String publicacion=request.getParameter("txtPublicacion");
        String query="select idLibro,titulo,g.descripcion,a.nom_autor,editorial,año_publicacion \n" +
                    "from genero g inner join libro l on l.id_genero=g.idGenero inner join autor a on a.idAutor=l.id_autor where concat(g.descripcion,a.nom_autor,l.año_publicacion) LIKE" + "'%" +id_genero+id_autor+publicacion+ "%'";
        
         datos = jdbcTemplate.queryForList(query);
         mav.addObject("Lista", datos);
         mav.setViewName("index");   
        return mav;
    }
    @RequestMapping(value = "agregar.htm", method = RequestMethod.GET)
    public ModelAndView Agregar() {
        mav.addObject(new Libro());
        mav.setViewName("agregar");
        return mav;
    }

    @RequestMapping(value = "agregar.htm", method = RequestMethod.POST)
    public ModelAndView Agregar(Libro l) {
        String sql = "insert into libro values(null,?,?,?,?,?,?,?)";
        this.jdbcTemplate.update(sql,l.getTitulo(),l.getId_genero(),l.getId_autor(),l.getEditorial(),l.getStock(),l.getPublicacion(),l.getEstado());
        return new ModelAndView("redirect:/index.htm");
    }
    /*---------------------------------------*/
    @RequestMapping(value = "editar.htm", method = RequestMethod.GET)
    public ModelAndView Editar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "select * from libro where idLibro="+id;  
        datos = this.jdbcTemplate.queryForList(sql);     
        mav.addObject("lista", datos);   
        mav.setViewName("editar");
        return mav;
    }
   @RequestMapping(value = "editar.htm", method = RequestMethod.POST)
    public ModelAndView Editar(Libro l) {
        String sql = "update libro set titulo=?,id_genero=?,id_autor=?,editorial=?,stock=?,año_publicacion=?,estado=? where idLibro="+id;
        this.jdbcTemplate.update(sql,l.getTitulo(),l.getId_genero(),l.getId_autor(),l.getEditorial(),l.getStock(),l.getPublicacion(),l.getEstado());
        return new ModelAndView("redirect:/index.htm");
    }
    /*----------------------------------------------*/
    @RequestMapping(value = "prestar.htm",method = RequestMethod.GET)
    public ModelAndView Prestar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "call listarPorId("+id+")"; 
        String user = "select*from usuario";
        List u = jdbcTemplate.queryForList(user);
        mav.addObject("Usuario", u);
        datos = this.jdbcTemplate.queryForList(sql);     
        mav.addObject("lista", datos);   
        mav.setViewName("prestamo");
        return mav;
    }
    @RequestMapping(value = "prestar.htm", method = RequestMethod.POST)
    public ModelAndView Prestar(Prestamo p) {
        String sql = "call Prestamos(?,?);";
        this.jdbcTemplate.update(sql,p.getId_usuario(),p.getId_libro());
        return new ModelAndView("redirect:/prestado.htm");
    }
    
    /*------------------------------------------*/
    @RequestMapping(value = "usuario.htm", method = RequestMethod.GET)
    public ModelAndView Usuario() {
        mav.setViewName("usuario");
        return mav;
    }
    @RequestMapping(value = "usuario.htm", method = RequestMethod.POST)
    public ModelAndView Usuario(Usuario u) {
        String sql = "insert into usuario values(null,?,?,?,?,?)";
        this.jdbcTemplate.update(sql,u.getNombre(),u.getApellidos(),u.getDireccion(),u.getCelular(),u.getEmail());
        return new ModelAndView("redirect:/index.htm");
    }
    /*------------------------------------------*/
   @RequestMapping(value = "prestado.htm")
    public ModelAndView Prestado() {
        String prestamo = "call ListarPrestados();";
        List p = jdbcTemplate.queryForList(prestamo);
        mav.addObject("Prestamo", p);        
        mav.setViewName("prestados");
        return mav;
    }
    @RequestMapping("filtrar.htm")
    public ModelAndView FiltradoUsuario(HttpServletRequest request) {
        String usuario=request.getParameter("txtUsuario");
        String sql="select nom_autor,nombre,titulo,idPrestamo,DATE_FORMAT(fechaEntrega, '%d de %b del %Y') as entrega from libro inner join autor on libro.id_autor=autor.idAutor \n" +
            "inner join prestamo on prestamo.id_libro=libro.idLibro inner join usuario on usuario.idUser=prestamo.id_usuario where nombre LIKE " + "'%" +usuario+ "%'";       
         datos = jdbcTemplate.queryForList(sql);
         mav.addObject("Prestamo", datos);
         mav.setViewName("prestados");   
        return mav;
    }
    
    //CONTROLADOR : MÉTODO ELIMINAR:
    @RequestMapping("eliminar.htm")
    public ModelAndView Eliminar(HttpServletRequest request) {
        id = Integer.parseInt(request.getParameter("id"));
        String sql = "delete from libro where idLibro=" + id;
        this.jdbcTemplate.update(sql);
        return new ModelAndView("redirect:/index.htm");
    }

    
}
