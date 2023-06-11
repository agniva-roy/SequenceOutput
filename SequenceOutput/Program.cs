using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SequenceOutput
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string line;
            Console.WriteLine("Enter a String: ");
            while ((line = Console.ReadLine()) != null)
            {
                line = line.Trim();
                if (line.Length == 0)
                    continue;

                string[] parts = line.Split(';');
                string str1 = parts[0];
                string str2 = parts[1];

                string longestCommonSubsequence = LongestCommonSubsequence(str1, str2);
                Console.WriteLine(longestCommonSubsequence);
            }
        }

        static string LongestCommonSubsequence(string str1, string str2)
        {
            int[,] dp = new int[str1.Length + 1, str2.Length + 1];

            for (int i = 1; i <= str1.Length; i++)
            {
                for (int j = 1; j <= str2.Length; j++)
                {
                    if (str1[i - 1] == str2[j - 1])
                    {
                        dp[i, j] = dp[i - 1, j - 1] + 1;
                    }
                    else
                    {
                        dp[i, j] = Math.Max(dp[i - 1, j], dp[i, j - 1]);
                    }
                }
            }

            int lcsLength = dp[str1.Length, str2.Length];
            char[] lcs = new char[lcsLength];

            int k = lcsLength - 1;
            int m = str1.Length;
            int n = str2.Length;

            while (m > 0 && n > 0)
            {
                if (str1[m - 1] == str2[n - 1])
                {
                    lcs[k] = str1[m - 1];
                    k--;
                    m--;
                    n--;
                }
                else if (dp[m - 1, n] > dp[m, n - 1])
                {
                    m--;
                }
                else
                {
                    n--;
                }
            }

            return new string(lcs);
        }
    }
}
