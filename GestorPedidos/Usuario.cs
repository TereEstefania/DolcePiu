﻿using System;

namespace Gestor_Pedidos
{
    [Serializable]
    public class Usuario
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Direccion { get; set; }
        public int IdZona { get; set; }
        public string Email { get; set; }
    }
}