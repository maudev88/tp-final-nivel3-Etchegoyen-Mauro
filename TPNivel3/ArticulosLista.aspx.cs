using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using negocio;
using dominio;

namespace TPNivel3
{
    public partial class ArticulosLista : System.Web.UI.Page
    {
        public bool FiltroAvanzado { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            if (!IsPostBack)
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                Session.Add("listaArticulos", negocio.listar());
                dgvArticulos.DataSource = Session["listaArticulos"];
                dgvArticulos.DataBind();
            }
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            Response.Redirect("FormularioArticulo.aspx?id=" + id);
        }

        protected void dgvArticulos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvArticulos.PageIndex = e.NewPageIndex;
            dgvArticulos.DataBind();
        }

        protected void txtFiltro_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Categorias.Descripcion.ToUpper().Contains(txtFiltro.Text.ToUpper())
            || x.Marcas.Descripcion.ToUpper().Contains(txtFiltro.Text.ToUpper())
            || x.Nombre.ToUpper().Contains(txtFiltro.Text.ToUpper())
            || x.CodigoArticulo.ToUpper().Contains(txtFiltro.Text.ToUpper()));
            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
        }

        protected void txtFiltroAvanzado_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["listaArticulos"];
            List<Articulo> listaFiltrada = lista.FindAll(x => x.Categorias.Descripcion.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper())
            || x.Marcas.Descripcion.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper())
            || x.Nombre.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper())
            || x.CodigoArticulo.ToUpper().Contains(txtFiltroAvanzado.Text.ToUpper()));
            dgvArticulos.DataSource = listaFiltrada;
            dgvArticulos.DataBind();
        }

        protected void chkAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            FiltroAvanzado = chkAvanzado.Checked;
            txtFiltro.Enabled = !FiltroAvanzado;
        }

        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlCriterio.Items.Clear();
            if (ddlCampo.SelectedItem.ToString() == "Precio")
            {
                ddlCriterio.Items.Add("Igual a");
                ddlCriterio.Items.Add("Mayor a");
                ddlCriterio.Items.Add("Menor a");
            }
            else
            {
                ddlCriterio.Items.Add("Contiene");
                ddlCriterio.Items.Add("Comienza con");
                ddlCriterio.Items.Add("Termina con");
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                ArticulosNegocio negocio = new ArticulosNegocio();
                dgvArticulos.DataSource = negocio.filtrar(
                    ddlCampo.SelectedItem.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text);
                dgvArticulos.DataBind();
            }
            catch (Exception ex)
            {
                Session.Add("error", ex);
                throw;
            }
        }

      
    }
}