﻿using GestaoAvaliacao.Entities;
using GestaoAvaliacao.Repository.Map.Base;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GestaoAvaliacao.Repository.Map
{
    public class AdministrativeUnitTypeMap : EntityBaseMap<AdministrativeUnitType>
    {
        public AdministrativeUnitTypeMap()
        {
            ToTable("AdministrativeUnitType");

            Property(p => p.AdministrativeUnitTypeId)
              .IsRequired();

            Property(p => p.Name)
              .IsRequired();
        }
    }
}