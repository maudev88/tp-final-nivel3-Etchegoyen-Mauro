using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using dominio;

namespace negocio
{
    public class ArticulosNegocio
    {

        public List<Articulo> listar(string id = "")
        {
            List<Articulo> lista = new List<Articulo>();
            SqlConnection conexion = new SqlConnection();
            SqlCommand comando = new SqlCommand();
            SqlDataReader lector;

            try
            {
                conexion.ConnectionString = "server=.\\SQLEXPRESS; database=CATALOGO_WEB_DB; integrated security=true";
                comando.CommandType = System.Data.CommandType.Text;
                comando.CommandText = "Select Codigo, Nombre, A.Descripcion as Articulo, IdMarca, IdCategoria, ImagenUrl, Precio, A.Id as Aidi, C.Descripcion as Categorias, M.Descripcion as Marcas from ARTICULOS A, CATEGORIAS C, MARCAS M where C.Id = A.IdCategoria AND M.Id = A.IdMarca";

                if (id != "")
                    comando.CommandText += " and A.Id = " + id;

                comando.Connection = conexion;

                conexion.Open();
                lector = comando.ExecuteReader();

                while (lector.Read())
                {
                    Articulo aux = new Articulo();
                    aux.Id = (int)lector["Aidi"];
                    aux.CodigoArticulo = (string)lector["Codigo"];
                    aux.Nombre = (string)lector["Nombre"];
                    aux.Descripcion = (string)lector["Articulo"];
                    aux.Marca = (int)lector["IdMarca"];
                    aux.Categoria = (int)lector["IdCategoria"];
                    if(!(lector["ImagenUrl"] is DBNull))
                        aux.Imagen = (string)lector["ImagenUrl"];
                    aux.Precio = (decimal)lector["Precio"];
                    aux.Categorias = new Elemento();
                    aux.Categorias.Descripcion = (string)lector["Categorias"];
                    aux.Marcas = new Elemento();
                    aux.Marcas.Descripcion = (string)lector["Marcas"];

                    lista.Add(aux);
                }

                conexion.Close();
                return lista;

            }
            catch (Exception ex)
            {

                throw ex;
            }

        }



        public List<Articulo> filtrar(string campo, string criterio, string filtro)
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                string consulta = "Select A.Id as Aidi, Codigo, Nombre, A.Descripcion as Articulo, IdMarca, IdCategoria, ImagenUrl, Precio, C.Descripcion as Categorias, M.Descripcion as Marcas from ARTICULOS A, CATEGORIAS C, MARCAS M where C.Id = A.IdCategoria AND M.Id = A.IdMarca AND ";
                if (campo == "Categoria")
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "C.Descripcion like '" + filtro + "%' ";
                            break;
                        case "Termina con":
                            consulta += "C.Descripcion like '%" + filtro + "'";
                            break;
                        default:
                            consulta += "C.Descripcion like '%" + filtro + "%'";
                            break;
                    }
                }
                else if (campo == "Marca")
                {
                    switch (criterio)
                    {
                        case "Comienza con":
                            consulta += "M.Descripcion like '" + filtro + "%' ";
                            break;
                        case "Termina con":
                            consulta += "M.Descripcion like '%" + filtro + "'";
                            break;
                        default:
                            consulta += "M.Descripcion like '%" + filtro + "%'";
                            break;
                    }
                }

                else
                {
                    switch (criterio)
                    {
                        case "Mayor a":
                            consulta += "Precio > " + filtro;
                            break;
                        case "Menor a":
                            consulta += "Precio < " + filtro;
                            break;
                        default:
                            consulta += "Precio = " + filtro;
                            break;
                    }
                }

                datos.setearConsulta(consulta);
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



        public void agregar(Articulo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();

            try
            {
                datos.setearConsulta("insert into ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, ImagenUrl, Precio) values (@codigo, @nombre, @descripcion, @idMarca, @idCategoria, @imagenUrl, @precio)");
                datos.setearParametro("codigo", nuevo.CodigoArticulo);
                datos.setearParametro("nombre", nuevo.Nombre);
                datos.setearParametro("descripcion", nuevo.Descripcion);
                datos.setearParametro("idMarca", nuevo.Marcas.Id);
                datos.setearParametro("idCategoria", nuevo.Categorias.Id);
                datos.setearParametro("imagenUrl", nuevo.Imagen);
                datos.setearParametro("precio", nuevo.Precio);
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

        public void modificar (Articulo art)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("   update ARTICULOS set Codigo = @Codigo, Nombre = @Nombre, Descripcion = @Descripcion, IdMarca = @Marca, IdCategoria = @Categoria, ImagenUrl = @Imagen, Precio = @Precio where Id = @id");
                datos.setearParametro("@Codigo", art.CodigoArticulo);
                datos.setearParametro("@Nombre", art.Nombre);
                datos.setearParametro("@Descripcion", art.Descripcion);
                datos.setearParametro("@Marca", art.Marcas.Id);
                datos.setearParametro("@Categoria", art.Categorias.Id);
                datos.setearParametro("@Imagen", art.Imagen);
                datos.setearParametro("@Precio", art.Precio);
                datos.setearParametro("@id", art.Id);

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
                datos.setearConsulta("Delete from Articulos where id = @id");
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
