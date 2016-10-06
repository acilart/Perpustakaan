﻿using PerpustakaanModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PerpustakaanDAL
{
    public class CabinetRowDAL
    {
        public static List<MstCabinetRow> GetAllCabinetRow()
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstCabinetRow.ToList();
            }
        }

        public static List<MstCabinetRow> GetAllCabinetRowByIdCabinet(int id)
        {
            using (var db = new PerpustakaanDbContext())
            {
                return db.MstCabinetRow.Where(n=>n.IDRak==id).ToList();
            }
        }
    }
}
