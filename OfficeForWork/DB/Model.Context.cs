﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace OfficeForWork.DB
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class OFWEntities : DbContext
    {
        public OFWEntities()
            : base("name=OFWEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Admin> Admin { get; set; }
        public virtual DbSet<Document> Document { get; set; }
        public virtual DbSet<DocumentSave> DocumentSave { get; set; }
        public virtual DbSet<Member> Member { get; set; }
        public virtual DbSet<Position> Position { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<Section> Section { get; set; }
        public virtual DbSet<Start> Start { get; set; }
    }
}
