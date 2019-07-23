
package services;

import org.springframework.jdbc.datasource.DriverManagerDataSource;


public class Conexion {
    public DriverManagerDataSource Conectar(){
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://localhost:3307/Biblioteca");
        dataSource.setUsername("root");
        dataSource.setPassword("alumno");
        return dataSource;
    }
}
