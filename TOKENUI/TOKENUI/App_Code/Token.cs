using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

public class Token
{
    [Key]
    public int Id { get; set; }

    [Required]
    [StringLength(5)]
    public string Symbol { get; set; }

    [Required]
    [StringLength(50)]
    public string Name { get; set; }

    [Required]
    [Column("total_supply")]
    public long TotalSupply { get; set; }

    [Required]
    [StringLength(66)]
    [Column("contract_address")]
    public string ContractAddress { get; set; }

    [Required]
    [Column("total_holders")]
    public int TotalHolders { get; set; }

    [Column("price")]
    public decimal Price { get; set; }
}