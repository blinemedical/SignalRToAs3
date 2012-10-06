namespace AmfInvoker
{
    public static class DynamicInvokeHelper
    {
        public const string JavascriptFunctionName = "InvokeOnActionScript";

        public static string Message(string methodName,object [] args)
        {
            var remoteObject = new ActionScriptRemoteObject
                                   {
                                       Name = methodName,
                                       Arguments = args
                                   };

            return AMFSerializerUtil<ActionScriptRemoteObject>.ConvertToBase64(remoteObject);
        }
    }
}
