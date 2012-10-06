using System.Dynamic;
using SignalR.Hubs;

namespace AmfInvoker
{
    class ClientsProxy : DynamicObject 
    {
        private readonly ClientAgent _clientAgent;
        public ClientsProxy(ClientAgent clientAgent)
        {
            _clientAgent = clientAgent;
        }

        public dynamic this[string key]
        {
            get
            {
                // when we want to act on a single client by connectionID we
                // return a signalAgentProxy

                return new SignalAgentProxy(_clientAgent[key]);
            }
        }

        // Get the property value by index.
        public override bool TryGetIndex(
            GetIndexBinder binder, object[] indexes, out object result)
        {

            var key = (string)indexes[0];
            result = this[key];
            return true;
        }


        public override bool TryGetMember(GetMemberBinder binder, out object result)
        {
            result = this[binder.Name];
            return true;
        }

        /// <summary>
        /// When a method is attempted to call on a dynamic object we'll transform
        /// the request to invoke our KNOWN javascript bridge function and re-package the arguments
        /// as a base64 AMF serialized wrapper object
        /// </summary>
        /// <param name="binder"></param>
        /// <param name="args"></param>
        /// <param name="result"></param>
        /// <returns></returns>
        public override bool TryInvokeMember(InvokeMemberBinder binder, object[] args, out object result)
        {
            result = _clientAgent.Invoke(DynamicInvokeHelper.JavascriptFunctionName, DynamicInvokeHelper.Message(binder.Name,args));
            return true;
        }
    }
}
