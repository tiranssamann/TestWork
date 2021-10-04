using System;
using System.Collections.Generic;
using System.Text;

namespace FirugeLibrary
{
    public class Circle : IFigure
    {
        public double Area()
        {
            double S = 0;
            if (a <= 0)
            {
                throw new Exception("Radius should be > 0");
            }
            S = Math.PI * Math.Pow(a, 2);
            return S;
        }
    }
}
