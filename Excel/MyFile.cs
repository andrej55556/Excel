using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Normalization
{
    public class MyFile
    {
        string name;
        public string Name
        {
            get { return name; }
            set
            {
                name = value;
                //сделать выбор файла из возможных
                //name = "Коттеджи.xlsx";
            }
        }
        string path;
        public string Path
        {
            get { return path; }
            set
            {
                /*//path = value;
                string pathAnalysis = "C:\\Users\\Таня\\source\\repos\\Excel\\Excel\\bin\\Debug\\net6.0\\Разбор тестовых вариантов";
                path = pathAnalysis + "\\" + name;*/
                path = value + "\\" + name;
            }
        }

        public MyFile()
        {
            name = string.Empty;
            path = string.Empty;
        }
        public MyFile(string name,string path)
        {
            //this.name = name;
            Name = name;
            //this.path = path;
            Path = path;
        }

        public void ChooseFile()
        {
            //сделать красивый выбор папки
        }

        public bool Exists()
        {
            try
            {
                if (File.Exists(path))
                {
                    return true;
                }
            }
            catch (Exception ex) { Console.Write(ex.Message); };

            Console.WriteLine("Файл не найден!");
            return false;
        }

        
    }
}
