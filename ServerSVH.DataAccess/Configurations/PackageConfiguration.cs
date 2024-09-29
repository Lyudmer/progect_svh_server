﻿
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using Microsoft.EntityFrameworkCore;

using ServerSVH.DataAccess.Entities;



namespace ServerSVH.DataAccess.Configurations
{
    public class PackageConfiguration : IEntityTypeConfiguration<PackageEntity>
    {
        public void Configure(EntityTypeBuilder<PackageEntity> builder)
        {
            builder.ToTable("packages");
            //ключи
            builder.HasKey(p => p.Id);

            builder
                .HasMany(p => p.Documents)
                .WithOne(d => d.Package)
                .HasForeignKey(d => d.Pid);
            //свойства полей
            builder.Property(p => p.Id)
                   .IsRequired()
                   .ValueGeneratedOnAdd()
                   .HasColumnName("pid")
                   .HasColumnType("bigint");
            builder.Property(p => p.UUID)
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasColumnName("uuid")
                        .HasColumnType("uuid");

            builder.Property(p => p.CreateDate)
                        .HasColumnName("create_date")
                        .HasDefaultValueSql("now()");

            builder.Property(p => p.ModifyDate)
                    .HasColumnName("modify_date");

            builder.Property(p => p.StatusId)
                   .HasDefaultValue("0")
                   .HasColumnName("status");

            builder.Property(p => p.UserId)
                   .HasColumnName("user_id")
                   .IsRequired();


        }
    }
}
