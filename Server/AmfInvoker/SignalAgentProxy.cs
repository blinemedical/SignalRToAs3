using System.Dynamic;
using SignalR.Hubs;

namespace AmfInvoker
{
    class SignalAgentProxy : DynamicObject
    {
        private readonly SignalAgent _signalAgent;

        public SignalAgentProxy(SignalAgent signalAgent)
        {
            _signalAgent = signalAgent;
        }

        public override bool TryGetMember(GetMemberBinder binder, out object result)
        {
            result = null;
            return false;
        }

        public override bool TryInvokeMember(InvokeMemberBinder binder, object[] args, out object result)
        {
            result = _signalAgent.Invoke(DynamicInvokeHelper.JavascriptFunctionName, DynamicInvokeHelper.Message(binder.Name,args));
            return true;
        }
    }
}
