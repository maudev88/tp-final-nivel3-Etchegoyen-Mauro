using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace dominio
{
    public class Articulo
    {
        //Código de artículo. Nombre. Descripción. Marca(seleccionable de una lista desplegable). 
        //Categoría(seleccionable de una lista desplegable. Imagen. Precio.
        
        public int Id { get; set; }

        public string CodigoArticulo { get; set; }

        public string Nombre { get; set; }

        public string Descripcion { get; set; }

        public int Marca { get; set; }

        public int Categoria { get; set; }

        public string Imagen { get; set; }

        public decimal Precio { get; set; }

        public Elemento Categorias { get; set; }

        public Elemento Marcas { get; set; }




    }
}
