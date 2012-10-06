using System;

namespace AmfInvoker
{
    [Serializable]
    public class ActionScriptRemoteObject
    {
        public string Name { get; set; }
        public object [] Arguments { get; set; }
    }
}
