using System;
using System.IO;
using System.Net;
using System.Text;

// Send SIGNL4 alert from C#

// Your SIGNL4 team secret
string teamSecret = "<team-secret>";

// Alert data
string json = @"{  
'Title': 'Alert',  
'Message': 'SIGNL4 alert from C#'  
}"; 

sendSIGNL4Alert(teamSecret, json);

public static void sendSIGNL4Alert(string strTeamSecret, string strData)
{
    string url = "https://connect.signl4.com/webhook/" + strTeamSecret;

    try
    {
        HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);
        request.Method = "POST";

        byte[] byteArray = Encoding.UTF8.GetBytes(strData);

        request.ContentType = "application/json";
        request.ContentLength = byteArray.Length;

        // Send the request
        Stream dataStream = request.GetRequestStream();
        dataStream.Write(byteArray, 0, byteArray.Length);
        dataStream.Close();

        // Get the response.
        HttpWebResponse response = (HttpWebResponse)request.GetResponse();
        Console.WriteLine(((HttpWebResponse)response).StatusDescription);

        using (dataStream = response.GetResponseStream())
        {
            StreamReader reader = new StreamReader(dataStream);
            string responseFromServer = reader.ReadToEnd();

            Console.WriteLine("Status Code: {0}", (int)response.StatusCode);
            Console.WriteLine(responseFromServer);

            if ((int)response.StatusCode == 201) {
                // Success
                Console.WriteLine("Success");
            }
            else {
                // Error
                Console.WriteLine("Error");
            }
        }

        response.Close();
    }
    catch (Exception e)
    {
        // Error
        Console.WriteLine("Error: " + e.ToString());
    }

}
