package amazon;

/**
 * Clase para usar los objetos de tipo Departamento
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Departamento {
	private int id_departamento;
	private String nombreDepartamento;

	/**
	 * Constructor de la clase vacio
	 * 
	 * @param
	 */
	public Departamento() {
		super();
	}

	/**
	 * Constructor de la clase que recibe todas las variables
	 * 
	 * @param int id_departamento, String nombreDepartamento
	 */
	public Departamento(int id_departamento, String nombreDepartamento) {
		super();
		this.id_departamento = id_departamento;
		this.nombreDepartamento = nombreDepartamento;
	}

	public int getId_departamento() {
		return id_departamento;
	}

	public void setId_departamento(int id_departamento) {
		this.id_departamento = id_departamento;
	}

	public String getNombreDepartamento() {
		return nombreDepartamento;
	}

	public void setNombreDepartamento(String nombreDepartamento) {
		this.nombreDepartamento = nombreDepartamento;
	}

}
