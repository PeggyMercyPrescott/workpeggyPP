using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace PPcore.Helpers
{
    public static class Utils
    {
        public static string EncodeMd5(string plaintext)  
        {
            Byte[] originalBytes;
            Byte[] encodedBytes;
            MD5 md5;
            md5 = new MD5CryptoServiceProvider();
            //originalBytes = ASCIIEncoding.Default.GetBytes(plaintext);
            originalBytes = Encoding.Default.GetBytes(plaintext);
            encodedBytes = md5.ComputeHash(originalBytes); 
            //return BitConverter.ToString(encodedBytes);
            return ByteArrayToHexString(encodedBytes);
        }

        public static string ByteArrayToHexString(byte[] Bytes)
        {
            StringBuilder Result = new StringBuilder(Bytes.Length * 2);
            string HexAlphabet = "0123456789ABCDEF";

            foreach (byte B in Bytes)
            {
                Result.Append(HexAlphabet[(int)(B >> 4)]);
                Result.Append(HexAlphabet[(int)(B & 0xF)]);
            }

            return Result.ToString();
        }

        public static byte[] HexStringToByteArray(string Hex)
        {
            byte[] Bytes = new byte[Hex.Length / 2];
            int[] HexValue = new int[] { 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
                0x06, 0x07, 0x08, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                0x0A, 0x0B, 0x0C, 0x0D, 0x0E, 0x0F };

            for (int x = 0, i = 0; i < Hex.Length; i += 2, x += 1)
            {
                Bytes[x] = (byte)(HexValue[Char.ToUpper(Hex[i + 0]) - '0'] << 4 |
                                  HexValue[Char.ToUpper(Hex[i + 1]) - '0']);
            }
            return Bytes;
        }

        public static string GeneratePassword()
        {
            Random rd = new Random();
            int ran = rd.Next(1234, 9876);
            return ran.ToString();
        }

        public static string ToSQLDate(string dateThai)
        {
            var d = dateThai.Split('-');
            d[2] = (Int32.Parse(d[2]) - 543).ToString();
            return d[2]+d[1]+d[0];
        }

        public static SelectList getEducationDegreeList()
        {
            return new SelectList(new[] {
                new { Value = "340", Text = "ปริญญาเอก" },
                new { Value = "330", Text = "ปริญญาโท" },
                new { Value = "320", Text = "ปริญญาตรี" },
                new { Value = "310", Text = "อนุปริญญา" },
                new { Value = "240", Text = "ปวส" },
                new { Value = "230", Text = "ปวช"},
                new { Value = "220", Text = "มัธยมศึกษาตอนปลาย"},
                new { Value = "210", Text = "มัธยมศึกษาตอนต้น"},
                new { Value = "101", Text = "ประถมศึกษา"}
            }, "Value", "Text", "101");
        }

        public static string getEducationDegree(string educationCode)
        {
            string res = "";
            switch (educationCode)
            {
                case "340": res = "ปริญญาเอก"; break;
                case "330": res = "ปริญญาโท"; break;

                case "320": res = "ปริญญาตรี"; break;
                case "310": res = "อนุปริญญา"; break;
                case "240": res = "ปวส"; break;
                case "230": res = "ปวช"; break;
                case "220": res = "มัธยมศึกษาตอนปลาย"; break;
                case "210": res = "มัธยมศึกษาตอนต้น"; break;
                case "101": res = "ประถมศึกษา"; break;
            }
            return res;
        }
    }
}
