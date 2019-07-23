
package entidad;


public class Libro {
    private int idLibro;
    private String titulo;
    private int id_genero;
    private int id_autor;
    private int publicacion;
    private String editorial;
    private String estado;

    public Libro(int idLibro, String titulo, int id_genero, int id_autor, int publicacion, String editorial, String estado, int stock) {
        this.idLibro = idLibro;
        this.titulo = titulo;
        this.id_genero = id_genero;
        this.id_autor = id_autor;
        this.publicacion = publicacion;
        this.editorial = editorial;
        this.estado = estado;
        this.stock = stock;
    }
   private int stock;

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    

    public Libro() {
    }

    public int getIdLibro() {
        return idLibro;
    }

    public void setIdLibro(int idLibro) {
        this.idLibro = idLibro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public int getId_genero() {
        return id_genero;
    }

    public void setId_genero(int id_genero) {
        this.id_genero = id_genero;
    }

    public int getId_autor() {
        return id_autor;
    }

    public void setId_autor(int id_autor) {
        this.id_autor = id_autor;
    }

    public int getPublicacion() {
        return publicacion;
    }

    public void setPublicacion(int publicacion) {
        this.publicacion = publicacion;
    }

    public String getEditorial() {
        return editorial;
    }

    public void setEditorial(String editorial) {
        this.editorial = editorial;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
