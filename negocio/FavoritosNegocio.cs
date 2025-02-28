using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominio;
using System.Configuration;

namespace negocio
{
    public class FavoritosNegocio
    {

        public List<Articulo> listarConSP(Usuario nuevo)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("spUsuarioFavoritos2");
                datos.setearParametro("@IdUser", nuevo.Id);

                datos.ejecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)datos.Lector["Aidi"];
                    aux.CodigoArticulo = (string)datos.Lector["Codigo"];
                    aux.Nombre = (string)datos.Lector["Nombre"];
                    aux.Descripcion = (string)datos.Lector["Articulo"];
                    aux.Marca = (int)datos.Lector["IdMarca"];
                    aux.Categoria = (int)datos.Lector["IdCategoria"];
                    if (!(datos.Lector["ImagenUrl"] is DBNull))
                        aux.Imagen = (string)datos.Lector["ImagenUrl"];
                    aux.Precio = (decimal)datos.Lector["Precio"];
                    aux.Categorias = new Elemento();
                    aux.Categorias.Descripcion = (string)datos.Lector["Categorias"];
                    aux.Marcas = new Elemento();
                    aux.Marcas.Descripcion = (string)datos.Lector["Marcas"];

                    lista.Add(aux);
                }

                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void agregarConSP(Articulo nuevo, Usuario nuevo1)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearProcedimiento("agregarConSP");
                datos.setearParametro("@IdUser", nuevo1.Id);
                datos.setearParametro("@IdArticulo", nuevo.Id);

                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }

        public void eliminar(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.setearConsulta("Delete from Favoritos where IdArticulo = @id");
                datos.setearParametro("@id", id);
                datos.ejecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }

    
}
