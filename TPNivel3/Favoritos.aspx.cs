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
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    if (Seguridad.sesionActiva(Session["usuario"]))
                   {
                        Usuario usuarioActual = (Usuario)Session["usuario"];
                        FavoritosNegocio negocio = new FavoritosNegocio();
                    Session.Add("listaArticulos", negocio.listarConSP(usuarioActual));
                    dgvArticulos.DataSource = Session["listaArticulos"];
                    dgvArticulos.DataBind();
                   }
                }
            }
            catch (Exception ex)
            {

                Session.Add("error", ex.ToString());
            }
        }

        protected void dgvArticulos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = dgvArticulos.SelectedDataKey.Value.ToString();
            FavoritosNegocio negocio = new FavoritosNegocio();
            negocio.eliminar(int.Parse(id));
            Usuario usuarioActual = (Usuario)Session["usuario"];
            Session.Add("listaArticulos", negocio.listarConSP(usuarioActual));
            dgvArticulos.DataSource = Session["listaArticulos"];
            dgvArticulos.DataBind();
        }

    }
}