package amazon;

/**
 * Clase para usar los objetos de tipo Seccion
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Seccion {
	private int id_seccion;
	private String nombreSeccion;
	
	public Seccion() {
		super();
	}

	public Seccion(int id_seccion, String nombreSeccion) {
		super();
		this.id_seccion = id_seccion;
		this.nombreSeccion = nombreSeccion;
	}

	public int getId_seccion() {
		return id_seccion;
	}

	public void setId_seccion(int id_seccion) {
		this.id_seccion = id_seccion;
	}

	public String getNombreSeccion() {
		return nombreSeccion;
	}

	public void setNombreSeccion(String nombreSeccion) {
		this.nombreSeccion = nombreSeccion;
	}
	
}
