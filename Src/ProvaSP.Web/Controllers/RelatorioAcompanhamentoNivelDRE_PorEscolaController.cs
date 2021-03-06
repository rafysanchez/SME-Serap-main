﻿using ProvaSP.Data;
using ProvaSP.Model.Entidades;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProvaSP.Web.Controllers
{
    public class RelatorioAcompanhamentoNivelDRE_PorEscolaController : Controller
    {
        // GET: RelatorioAcompanhamentoNivelDRE_PorEscola
        public ActionResult Index(string usu_id, string uad_codigo)
        {
            var usuario = DataUsuario.RetornarUsuario(usu_id);

            if (usuario.AcessoNivelSME || usuario.Supervisor)
            {
                ViewBag.Usuario = usuario;
                ViewBag.DRE = uad_codigo;
                var indicadores = Data.DataAcompanhamentoAplicacao.RecuperarAcompanhamentoEscolaNivelDRE_PorEscola("2017", uad_codigo);
                return View(indicadores);
            }
            else
                return RedirectToAction("Index", "RelatorioAcompanhamento");
        }
    }
}