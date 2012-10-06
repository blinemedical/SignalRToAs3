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

        public override bool TryInvokeMember(InvokeMemberBinder binder, object[] args, out object result)
        {
            result = _clientAgent.Invoke(DynamicInvokeHelper.JavascriptFunctionName, DynamicInvokeHelper.Message(binder.Name,args));
            return true;
        }
    }
}
