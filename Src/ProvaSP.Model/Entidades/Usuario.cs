﻿using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace ProvaSP.Model.Entidades
{
    public class Usuario
    {
        public  Usuario()
        {
            grupos = new List<Grupo>();
        }

        public string usu_id { get; set; }
        public string usu_login { get; set; }
        public string usu_senha { get; set; }
        [JsonIgnore]
        public string usu_criptografia { get; set; }
        public List<Grupo> grupos { get; set; }

        //private ICollection<Grupo> grupos;

        //public virtual ICollection<Grupo> Grupos => grupos ?? (grupos = new HashSet<Grupo>());

        public bool Supervisor
        {
            get
            {
                return grupos.Where(x => x.gru_id == Grupo.Perfil.Supervisor).Count() > 0;
            }
        }

        public bool Diretor
        {
            get
            {
                return grupos.Where(x => x.gru_id == Grupo.Perfil.Diretor).Count() > 0;
            }
        }

        public bool Coordenador
        {
            get
            {
                return grupos.Where(x => x.gru_id == Grupo.Perfil.Coordenador).Count() > 0;
            }
        }

        public bool Professor
        {
            get
            {
                return grupos.Where(x => x.gru_id == Grupo.Perfil.Professor).Count() > 0;
            }
        }

        public bool Aluno
        {
            get
            {
                return grupos.Where(x => x.gru_id == Grupo.Perfil.Aluno).Count() > 0;
            }
        }

        public bool AcessoNivelSME
        {
            get
            {
                return grupos.Where(x => x.AcessoNivelSME).Count() > 0;
            }
        }

        public bool AcessoNivelDRE
        {
            get
            {
                return grupos.Where(x => x.AcessoNivelDRE).Count() > 0;
            }
        }
    }
}
