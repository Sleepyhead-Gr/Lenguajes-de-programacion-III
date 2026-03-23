using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Actividad_1
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Declaracion de variables
            string nombre;
            string edad;
            string fechaNac;
            string carrera;
            string salir;

            Console.WriteLine("\n\nBienvenidos a UMI / Universidad Coppel");
            Console.WriteLine("\nIngreso los datos a continuación.");
            Console.WriteLine("\nNombre Completo: ");
            nombre = Console.ReadLine();
            Console.WriteLine("Edad: ");
            edad = Console.ReadLine();
            Console.WriteLine("Fecha de Nacimiento (DD/MM/AAAA): ");
            fechaNac = Console.ReadLine();
            Console.WriteLine("Carrera a la que desea ingresar: ");
            carrera = Console.ReadLine();

            Console.WriteLine("\n\nGracias " + nombre + " por formar parte de UMI/Universidad Coppel. \n Bienvenido a la carrera " + carrera + " ingresada.");
            Console.WriteLine("\nNombre: " + nombre + ".");
            Console.WriteLine("\nEdad: " + edad + ".");
            Console.WriteLine("\nFecha de Nacimiento: " + fechaNac + ".");
            Console.WriteLine("\nCarrera: " + carrera + ".");

            Console.WriteLine("\n\n\n\n Presione enter para salir.");
            salir = Console.ReadLine();
        }
    }
}
