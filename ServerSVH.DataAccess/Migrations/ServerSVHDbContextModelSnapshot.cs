﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;
using ServerSVH.DataAccess;

#nullable disable

namespace ServerSVH.DataAccess.Migrations
{
    [DbContext(typeof(ServerSVHDbContext))]
    partial class ServerSVHDbContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.8")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("ServerSVH.DataAccess.Entities.DocumentEntity", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("did");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<long>("Id"));

                    b.Property<DateTime>("CreateDate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("timestamp with time zone")
                        .HasColumnName("create_date")
                        .HasDefaultValueSql("now()");

                    b.Property<Guid>("DocId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid")
                        .HasColumnName("docid");

                    b.Property<string>("DocType")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("IdSha256")
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasMaxLength(64)
                        .HasColumnType("character varying(64)")
                        .HasColumnName("idsha256");

                    b.Property<string>("Idmd5")
                        .IsRequired()
                        .ValueGeneratedOnAdd()
                        .HasMaxLength(32)
                        .HasColumnType("character varying(32)")
                        .HasColumnName("idmd5");

                    b.Property<DateTime>("ModifyDate")
                        .HasColumnType("timestamp with time zone")
                        .HasColumnName("modify_date");

                    b.Property<long>("Pid")
                        .HasColumnType("bigint")
                        .HasColumnName("pid");

                    b.Property<int>("SizeDoc")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasColumnName("size_doc");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("SizeDoc"));

                    b.HasKey("Id");

                    b.HasIndex("Pid");

                    b.ToTable("documents", (string)null);
                });

            modelBuilder.Entity("ServerSVH.DataAccess.Entities.PackageEntity", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint")
                        .HasColumnName("pid");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<long>("Id"));

                    b.Property<DateTime>("CreateDate")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("timestamp with time zone")
                        .HasColumnName("create_date")
                        .HasDefaultValueSql("now()");

                    b.Property<DateTime>("ModifyDate")
                        .HasColumnType("timestamp with time zone")
                        .HasColumnName("modify_date");

                    b.Property<int>("StatusId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer")
                        .HasDefaultValue(0)
                        .HasColumnName("status");

                    b.Property<Guid>("UUID")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uuid")
                        .HasColumnName("uuid");

                    b.Property<Guid>("UserId")
                        .HasColumnType("uuid")
                        .HasColumnName("user_id");

                    b.HasKey("Id");

                    b.ToTable("packages", (string)null);
                });

            modelBuilder.Entity("ServerSVH.DataAccess.Entities.StatusGraphEntity", b =>
                {
                    b.Property<int>("OldSt")
                        .HasColumnType("integer")
                        .HasColumnName("oldst");

                    b.Property<int>("NewSt")
                        .HasColumnType("integer")
                        .HasColumnName("newst");

                    b.HasKey("OldSt", "NewSt");

                    b.ToTable("pkg_status_graph", (string)null);
                });

            modelBuilder.Entity("ServerSVH.DataAccess.Entities.DocumentEntity", b =>
                {
                    b.HasOne("ServerSVH.DataAccess.Entities.PackageEntity", "Package")
                        .WithMany("Documents")
                        .HasForeignKey("Pid")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Package");
                });

            modelBuilder.Entity("ServerSVH.DataAccess.Entities.PackageEntity", b =>
                {
                    b.Navigation("Documents");
                });
#pragma warning restore 612, 618
        }
    }
}
