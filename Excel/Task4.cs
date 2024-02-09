using Microsoft.Office.Interop.Excel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Excel = Microsoft.Office.Interop.Excel;

namespace Normalization
{
    public class Task4
    {
        Dictionary<List<string>, List<string>> Functionaldependency;
        public Task4()
        {
            Functionaldependency = new Dictionary<List<string>, List<string>>();
        }

        public string Task4Find(int i)
        {
            string cellValue = string.Empty;
            for (int j = 1; j <= ExcelFile.columnCount; j++)
            {
                cellValue += Convert.ToString(ExcelFile.worksheet.Cells[i, j].Value2) + '_';

                string a = ExcelFile.worksheet.Cells[i, j + 1].Value2;
                if (cellValue == "" && a == null) { return string.Empty; }
            }
            return cellValue;
        }

        public void Task4Dictionary(int i_start, int i_last)
        {
            for (int i = i_start; i <= i_last; i++)
            {
                string cellValue = Task4Find(i);
                if (cellValue == "") { /*Console.WriteLine("Пусто!");*/ return; }

                string separator = ExcelFile.Separator(cellValue);
                if (separator == null) { Console.WriteLine("Неправльный разделитель!"); return; }

                string[] split = cellValue.Split(separator);

                string Keys = split[0];
                string Values = split[1];
                //Console.WriteLine(Keys);
                //Console.WriteLine(Values);

                List<string> keys = new List<string>();
                foreach (string key in Keys.Split('_')) { if(key.Length > 2)keys.Add(key); }
                List<string> values = new List<string>();
                foreach (string value in Values.Split('_'))
                {
                    if (value.Length > 2)
                        values.Add(value);
                }

                //добавление в словарь
                Functionaldependency.Add(keys, values);
            }
        }

        public void FZ()
        {
            Excel.Range EX4 = ExcelFile.worksheet.Cells.Find("Задание №4. Перечислите все выявленные функциональные зависимости");
            //Console.WriteLine(EX4.Address);
            Excel.Range EX5 = ExcelFile.worksheet.Cells.Find("Задание №5");
            //Console.WriteLine(EX5.Address);

            int i_start = Convert.ToInt32(EX4.Address.Split('$')[2]) + 2;
            //int i_start = 79;
            //Console.WriteLine(i_start);
            int i_last = Convert.ToInt32(EX5.Address.Split('$')[2]) - 1;
            //Console.WriteLine(i_last);

            Task4Dictionary(i_start, i_last);

            foreach (KeyValuePair<List<string>, List<string>> pair in Functionaldependency)
            {
                foreach (string key in pair.Key) { Console.Write(key + ' '); }
                Console.WriteLine();
                foreach (string value in pair.Value) { Console.Write(value + ' '); }
                Console.WriteLine();
            }
        }
    }
}
