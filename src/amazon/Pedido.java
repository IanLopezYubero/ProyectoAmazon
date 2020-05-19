package amazon;

public class Pedido {
	private int id_pedido;
	private int id_cliente;
	private String fechaRealizada;
	private String fechaEntregaPrevista;
	private String fechaDespachada;
	private String fechaEntregada;
	private String estadoPedido;
	private String review;
	private double monto;
	private double gastosEnvio;
	
	public Pedido() {
		super();
	}

	public Pedido(int id_pedido, String fechaRealizada, String fechaEntregaPrevista,
			String fechaDespachada, String fechaEntregada, String estadoPedido, String review, double monto,
			double gastosEnvio, int id_cliente) {
		super();
		this.id_pedido = id_pedido;
		this.id_cliente = id_cliente;
		this.fechaRealizada = fechaRealizada;
		this.fechaEntregaPrevista = fechaEntregaPrevista;
		this.fechaDespachada = fechaDespachada;
		this.fechaEntregada = fechaEntregada;
		this.estadoPedido = estadoPedido;
		this.review = review;
		this.monto = monto;
		this.gastosEnvio = gastosEnvio;
	}

	public int getId_pedido() {
		return id_pedido;
	}

	public void setId_pedido(int id_pedido) {
		this.id_pedido = id_pedido;
	}

	public int getId_cliente() {
		return id_cliente;
	}

	public void setId_cliente(int id_cliente) {
		this.id_cliente = id_cliente;
	}

	public String getFechaRealizada() {
		return fechaRealizada;
	}

	public void setFechaRealizada(String fechaRealizada) {
		this.fechaRealizada = fechaRealizada;
	}

	public String getFechaEntregaPrevista() {
		return fechaEntregaPrevista;
	}

	public void setFechaEntregaPrevista(String fechaEntregaPrevista) {
		this.fechaEntregaPrevista = fechaEntregaPrevista;
	}

	public String getFechaDespachada() {
		return fechaDespachada;
	}

	public void setFechaDespachada(String fechaDespachada) {
		this.fechaDespachada = fechaDespachada;
	}

	public String getFechaEntregada() {
		return fechaEntregada;
	}

	public void setFechaEntregada(String fechaEntregada) {
		this.fechaEntregada = fechaEntregada;
	}

	public String getEstadoPedido() {
		return estadoPedido;
	}

	public void setEstadoPedido(String estadoPedido) {
		this.estadoPedido = estadoPedido;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public double getMonto() {
		return monto;
	}

	public void setMonto(double monto) {
		this.monto = monto;
	}

	public double getGastosEnvio() {
		return gastosEnvio;
	}

	public void setGastosEnvio(double gastosEnvio) {
		this.gastosEnvio = gastosEnvio;
	}
	
	
}
