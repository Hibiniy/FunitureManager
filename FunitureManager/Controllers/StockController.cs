﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FunitureManager.Controllers
{
    public class StockController : Controller
    {
        // GET: Stock
        public ActionResult IndexStock()
        {
            return View();
        }
    }
}