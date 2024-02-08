using Normalization;
using System;
using System.Reflection;
using System.Security.Cryptography;

class Program
{
    private static void Main()
    {
       ExcelFile ex = new ExcelFile();
        ex.OpenFile();
        //ex.Task4();
        Task4 task4 = new Task4();
        task4.FZ();
        ex.CloseFile();
    }
}