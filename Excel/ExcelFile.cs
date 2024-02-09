using System;
using System.Collections;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Office.Interop.Excel;
using Excel = Microsoft.Office.Interop.Excel;

namespace Normalization
{
    public class ExcelFile
    {
        Application xlApp;
        Workbook xlWorkbook;
        public static Worksheet worksheet;
        MyFile myFile;
        public static int rowCount;
        public static int columnCount;

        public ExcelFile()
        {
            xlApp = new Application();
            //xlWorkbook = new Workbook();
            //worksheet = new Worksheet();
            myFile = new MyFile();
            rowCount = 0;
            columnCount = 0;
        }

        public bool OpenFile()
        {
            //myFile = new MyFile("Коттеджи.xlsx", "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов");
            myFile = new MyFile("_Разбор задания  по нормализации БД Вариант Квартплата от Чуприной СИ.xlsx", "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов");

            if (!myFile.Exists())
            {
                return false;
            }

            try
            {
                xlWorkbook = xlApp.Workbooks.Open(myFile.Path);
            }
            catch(Exception ex) { Console.WriteLine(ex.Message); }

            xlApp.Visible = true;

            worksheet = xlWorkbook.ActiveSheet;
            rowCount = worksheet.UsedRange.Rows.Count;
            columnCount = worksheet.UsedRange.Columns.Count;

            return true;
        }

        public static string Separator(string s)
        {
            if (s.Contains('→'))
            {
                return "→";
            }
            else if (s.Contains("->"))
            {
                return "->";
            }
            else if (s.Contains("-->"))
            {
                return "-->";
            }

            return string.Empty;
        }

        private void releaseObject(object obj)
        {
            try
            {
                System.Runtime.InteropServices.Marshal.ReleaseComObject(obj);
                obj = null;
            }
            catch (Exception ex)
            {
                obj = null;
                //MessageBox.Show("Exception Occured while releasing object " + ex.ToString());
                Console.WriteLine("Exception Occured while releasing object " + ex.ToString());
            }
            finally
            {
                GC.Collect();
                GC.WaitForPendingFinalizers();
            }
        }

        public void CloseFile()
        {
            xlWorkbook.Close(false);
            xlApp.Quit();

            releaseObject(xlWorkbook);
            releaseObject(xlApp);

            Process[] List;
            List = Process.GetProcessesByName("EXCEL");
            foreach (Process p in List) { p.Kill(); }
        }
    }
}
