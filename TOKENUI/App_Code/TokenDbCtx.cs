using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using MySql.Data.EntityFramework;
using System.Data.Entity.ModelConfiguration.Conventions;


[DbConfigurationType(typeof(MySqlEFConfiguration))]
public class TokenDbContext : DbContext
{
    public DbSet<Token> Tokens { get; set; }

    public TokenDbContext()
        : base("name=DefaultConnection")
    {
    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();

        modelBuilder.Entity<Token>()
            .ToTable("tokens")
            .Property(t => t.TotalSupply)
            .HasColumnName("total_supply");

        modelBuilder.Entity<Token>()
            .Property(t => t.ContractAddress)
            .HasColumnName("contract_address");

        modelBuilder.Entity<Token>()
            .Property(t => t.TotalHolders)
            .HasColumnName("total_holders");

        modelBuilder.Entity<Token>()
            .Property(t => t.Price)
            .HasColumnName("price");

        base.OnModelCreating(modelBuilder);
    }
}