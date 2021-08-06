using System;
using System.IO;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.Extensions.Configuration;
using Web_Api.online.Models;
using Web_Api.online.Models.Tables;

#nullable disable

namespace Web_Api.online.Data
{
    public partial class ExchangeContext : DbContext
    {
        public ExchangeContext()
        {
        }

        public ExchangeContext(DbContextOptions<webapionlineContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Wallet> Wallets { get; set; }
        public virtual DbSet<Currency> Currencies { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                IConfigurationRoot configuration = new ConfigurationBuilder()
                   .SetBasePath(Directory.GetCurrentDirectory())
                   .AddJsonFile("appsettings.json")
                   .Build();
                var connectionString = configuration.GetConnectionString("ExchangeConnection");
                optionsBuilder.UseSqlServer(connectionString);
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Cyrillic_General_CI_AS");

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
