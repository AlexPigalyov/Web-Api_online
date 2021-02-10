using Microsoft.EntityFrameworkCore;

namespace Web_Api.online.Models.Tables.DPDCities
{
    public partial class webapionlineContext : DbContext
    {
        public webapionlineContext()
        {
        }

        public webapionlineContext(DbContextOptions<webapionlineContext> options)
            : base(options)
        {
        }

        public virtual DbSet<DpdCity> DpdCities { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("server=localhost\\SQLExpress;user=webapionline;password=webapionline1;database=web-api.online");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("Relational:Collation", "Cyrillic_General_CI_AS");

            modelBuilder.Entity<DpdCity>(entity =>
            {
                entity.HasKey(e => e.CityId)
                    .HasName("PK_DpdCities_48");

                entity.Property(e => e.CityId)
                    .ValueGeneratedNever()
                    .HasColumnName("cityId");

                entity.Property(e => e.Abbreviation)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("abbreviation");

                entity.Property(e => e.CityCode)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("cityCode");

                entity.Property(e => e.CityIdSpecified).HasColumnName("cityIdSpecified");

                entity.Property(e => e.CityName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("cityName");

                entity.Property(e => e.CountryCode)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("countryCode");

                entity.Property(e => e.CountryName)
                    .IsRequired()
                    .HasMaxLength(50)
                    .HasColumnName("countryName");

                entity.Property(e => e.IndexMax)
                    .HasMaxLength(50)
                    .HasColumnName("indexMax");

                entity.Property(e => e.IndexMin)
                    .HasMaxLength(50)
                    .HasColumnName("indexMin");

                entity.Property(e => e.Lat).HasColumnName("lat");

                entity.Property(e => e.Lng).HasColumnName("lng");

                entity.Property(e => e.RegionCode).HasColumnName("regionCode");

                entity.Property(e => e.RegionCodeSpecified).HasColumnName("regionCodeSpecified");

                entity.Property(e => e.RegionName)
                    .IsRequired()
                    .HasMaxLength(100)
                    .HasColumnName("regionName");

                entity.Property(e => e.Settled)
                    .HasMaxLength(20)
                    .IsFixedLength(true);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
