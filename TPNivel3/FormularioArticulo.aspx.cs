using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPNivel3
{
    public partial class FormularioArticulo : System.Web.UI.Page
    {
        public bool ConfirmaEliminacion { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            txtId.Enabled = false;

            try
            {
                if (!IsPostBack)
                {
                    CategoriaNegocio negocio = new CategoriaNegocio();
                    List<Elemento> lista = negocio.listar();

                    ddlCategoria.DataSource = lista;
                    ddlCategoria.DataValueField = "Id";
                    ddlCategoria.DataTextField = "Descripcion";
                    ddlCategoria.DataBind();

                    MarcaNegocio negocio2 = new MarcaNegocio();
                    List<Elemento> lista2 = negocio2.listar();

                    ddlMarca.DataSource = lista2;
                    ddlMarca.DataValueField = "Id";
                    ddlMarca.DataTextField = "Descripcion";
                    ddlMarca.DataBind();
                }

                string id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (id != "" && !IsPostBack)
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    Articulo seleccionado = (negocio.listar(id))[0];

                    Session.Add("articuloSeleccionado", seleccionado);

                    txtId.Text = id;
                    txtCodigo.Text = seleccionado.CodigoArticulo;
                    txtNombre.Text = seleccionado.Nombre;
                    ddlCategoria.SelectedValue = seleccionado.Categoria.ToString();
                    ddlMarca.SelectedValue = seleccionado.Marca.ToString();
                    txtPrecio.Text = seleccionado.Precio.ToString();
                    txtDescripcion.Text = seleccionado.Descripcion;
                    txtImagen.Text = seleccionado.Imagen;
                    txtImagen_TextChanged(sender, e);

                }

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                Articulo nuevo = new Articulo();
                ArticulosNegocio negocio = new ArticulosNegocio();

                nuevo.CodigoArticulo = txtCodigo.Text;
                nuevo.Nombre = txtNombre.Text;
                nuevo.Categorias = new Elemento();
                nuevo.Categorias.Id = int.Parse(ddlCategoria.SelectedValue);
                nuevo.Marcas = new Elemento();
                nuevo.Marcas.Id = int.Parse(ddlMarca.SelectedValue);
                nuevo.Precio = Decimal.Parse(txtPrecio.Text);
                nuevo.Descripcion = txtDescripcion.Text;

                if (txtImagen.Text == "")
                {
                    nuevo.Imagen = "https://www.generationsforpeace.org/wp-content/uploads/2018/03/empty-300x240.jpg";
                }
                else
                {
                    nuevo.Imagen = txtImagen.Text;

                }
               

                if (Request.QueryString["id"] != null)
                {
                    nuevo.Id = int.Parse(txtId.Text);
                    negocio.modificar(nuevo);
                }
                else
                    negocio.agregar(nuevo);

                Response.Redirect("ArticulosLista.aspx", false);

            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }

        protected void txtImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulos.ImageUrl = txtImagen.Text;
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ConfirmaEliminacion = true;
        }

        protected void btnConfirmarEliminacion_Click(object sender, EventArgs e)
        {
            try
            {
                if (chkConfirmaEliminacion.Checked)
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    negocio.eliminar(int.Parse(txtId.Text));
                    Response.Redirect("ArticulosLista.aspx", false);
                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("Error.aspx");
            }
        }
    }
}