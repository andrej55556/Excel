using Microsoft.Office.Interop.Excel;
using System;
using System.Reflection;
using System.Security.Cryptography;
using Excel = Microsoft.Office.Interop.Excel;

class Program
{
    private static void Main()
    {
        Application xlApp = new Application();
        //string path = "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов\\_Разбор задания  по нормализации БД Вариант Квартплата от Чуприной СИ.xlsx";
        string path = "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов\\Коттеджи.xlsx";
        //string path = "Разбор тестовых вариантов\\_Разбор задания  по нормализации БД Вариант Квартплата от Чуприной СИ.xlsx";
        Workbook xlWorkbook = xlApp.Workbooks.Open(path);
        //xlApp.Visible = true;

        Worksheet worksheet = xlWorkbook.ActiveSheet;

        //количество строк в листе
        int rowCount = worksheet.UsedRange.Rows.Count;

        //количество столбцов в листе
        int columnCount = worksheet.UsedRange.Columns.Count;

        Excel.Range EX4 = worksheet.Cells.Find("Задание №4. Перечислите все выявленные функциональные зависимости");
        //Console.WriteLine(EX4.Address);
        Excel.Range EX5 = worksheet.Cells.Find("Задание №5");
        //Console.WriteLine(EX5.Address);

        int i_start = Convert.ToInt32(EX4.Address.Split('$')[2]) + 2;
        //Console.WriteLine(i_start);
        int i_last = Convert.ToInt32(EX5.Address.Split('$')[2]) - 1;
        //Console.WriteLine(i_last);

        for (int i = i_start; i <= i_last; i++)
        {
            string cellValue = string.Empty;
            for (int j = 1; j <= columnCount; j++)
            {
                cellValue += Convert.ToString(worksheet.Cells[i, j].Value2) + '_';

                if (cellValue == null && Convert.ToString(worksheet.Cells[i, j + 1].Value2) == null) { break; }
            }

            string[] split = null;
            if (cellValue.Contains('→'))
            {
                split = cellValue.Split('→');
            }
            else if (cellValue.Contains("->"))
            {
                split = cellValue.Split("->");
            }
            else if (cellValue.Contains("-->"))
            {
                split = cellValue.Split("-->");
            }
            
            string Keys = split[0];
            string Values = split[1];
            //Console.WriteLine(Keys);
            //Console.WriteLine(Values);

            List<string> keys = new List<string>();
            foreach (string key in Keys.Split('_')) { keys.Add(key); }
            List<string> values = new List<string>();
            foreach (string value in Values.Split('_')) { values.Add(value); }

            foreach (string key in keys) { Console.Write(key + ' '); }
            Console.WriteLine();
            foreach (string value in values) { Console.Write(value + ' '); }
            Console.WriteLine();
        }
    }
}