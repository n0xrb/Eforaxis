﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Eforaxis.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class EforaxisEntities2 : DbContext
    {
        public EforaxisEntities2()
            : base("name=EforaxisEntities2")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<administradores> administradores { get; set; }
        public virtual DbSet<categorias> categorias { get; set; }
        public virtual DbSet<producto> producto { get; set; }
        public virtual DbSet<usuario> usuario { get; set; }
        public virtual DbSet<ventas> ventas { get; set; }
    }
}