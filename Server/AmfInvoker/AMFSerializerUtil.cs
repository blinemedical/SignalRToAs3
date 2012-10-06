using System;
using System.IO;
using com.TheSilentGroup.Fluorine;

namespace AmfInvoker
{
    public static class AMFSerializerUtil<T>
    {
        public static byte[] SerializeAMF3(T item)
        {
            using (var amfData = new MemoryStream())
            {
                var ser = new AMFSerializer(amfData) {UseLegacyCollection = false};
                using (var fcm = new FluorineClassMappingApplicationContext())
                {
                    ser.WriteData(fcm, ObjectEncoding.AMF3, item);
                    amfData.Position = 0;
                    return amfData.ToArray();
                }
            }
        }

        public static string ConvertToBase64(T item)
        {
            var amfData = SerializeAMF3(item);

            return Convert.ToBase64String(amfData);
        }
    }
}
