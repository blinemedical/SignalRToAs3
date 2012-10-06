using SignalR;
using SignalR.Hubs;

namespace AmfInvoker
{
    public class HubProcessorBase<T>  where T: Hub
    {
        protected IHubContext Context
        {
            get
            {
                return new HubContextProxy(GlobalHost.ConnectionManager.GetHubContext<T>());
            }
        }

        protected IHubContext ContextDotNet
        {
            get
            {
                return GlobalHost.ConnectionManager.GetHubContext<T>();
            }
        }

    }
}
