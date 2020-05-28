package amazon;

/**
 * Clase para usar los objetos de tipo Amazon
 * 
 * @author Ian Lopez
 * @version 19/05/2020
 */

public class Amazon {

	private int id_amazon;
	private String pais;

	/**
	 * Constructor de la clase vacio
	 * 
	 * @param
	 */
	public Amazon() {
		super();
	}

	/**
	 * Constructor de la clase que recibe todas las variables
	 * 
	 * @param int id_amazon, String pais
	 */
	public Amazon(int id_amazon, String pais) {
		super();
		this.id_amazon = id_amazon;
		this.pais = pais;
	}

	public int getId_amazon() {
		return id_amazon;
	}

	public void setId_amazon(int id_amazon) {
		this.id_amazon = id_amazon;
	}

	public String getPais() {
		return pais;
	}

	public void setPais(String pais) {
		this.pais = pais;
	}

}
