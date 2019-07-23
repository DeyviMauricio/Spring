
package entidad;

public class Usuario {
    private int iduser;
    private String nombre;
    private String apellidos;
    private String direccion;
    private String celular;
    private String email;

    public Usuario(int iduser, String nombre, String apellidos, String direccion, String celular, String email) {
        this.iduser = iduser;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.direccion = direccion;
        this.celular = celular;
        this.email = email;
    }

    public Usuario() {
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidos() {
        return apellidos;
    }

    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
