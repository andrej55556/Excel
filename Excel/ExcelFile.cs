using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Excel;
using Excel = Microsoft.Office.Interop.Excel;

namespace Normalisation
{
    public class ExcelFile
    {
        public bool OpenFile()
        {
            /*Application xlApp = new Application();
            //string path = "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов\\_Разбор задания  по нормализации БД Вариант Квартплата от Чуприной СИ.xlsx";
            string path = "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов\\Коттеджи.xlsx";
            //string path = "Разбор тестовых вариантов\\_Разбор задания  по нормализации БД Вариант Квартплата от Чуприной СИ.xlsx";
            Workbook xlWorkbook = xlApp.Workbooks.Open(path);
            //xlApp.Visible = true;

            Worksheet worksheet = xlWorkbook.ActiveSheet;*/

            return true;
        }

        public string Separator()
        {
            return string.Empty;
        }
    }
}
