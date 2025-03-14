﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using dominio;
using negocio;

namespace TPNivel3
{
    public partial class Detalle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] != null)
            {
                string user = Request.QueryString["id"].ToString();
              
                if (user != "" && !IsPostBack)
                {
                    ArticulosNegocio negocio = new ArticulosNegocio();
                    Articulo seleccionado = (negocio.listar(user))[0];

                    Session.Add("articuloSeleccionado", seleccionado);

                    txtId.InnerText = user;
                    txtImg.Src = seleccionado.Imagen;
                    txtCodigo.InnerText = seleccionado.CodigoArticulo.ToString();
                    txtNombre.InnerText = seleccionado.Nombre.ToString();
                    txtMarca.InnerText = seleccionado.Marcas.Descripcion.ToString();
                    txtCategoria.InnerText = seleccionado.Categorias.Descripcion.ToString();
                    txtPrecio.InnerText = seleccionado.Precio.ToString();
                    txtDescripcion.InnerText = seleccionado.Descripcion.ToString();
                }
            }
        }

       
        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx", false);
        }

        protected void btnFavoritos_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                if (Seguridad.sesionActiva(Session["usuario"]))
                {
                    Articulo nuevo = new Articulo();
                    FavoritosNegocio negocio = new FavoritosNegocio();

                    Usuario usuarioActual = (Usuario)Session["usuario"];
                    nuevo.Id = int.Parse(Request.QueryString["id"]);

                    negocio.agregarConSP(nuevo, usuarioActual);

                    btnFavoritos.Text = "Agregado";
                    btnFavoritos.Enabled = false;

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