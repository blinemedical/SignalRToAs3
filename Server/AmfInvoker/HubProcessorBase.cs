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
                // wrap the hub context in a hub context proxy so we can catch invocation requests

                return new HubContextProxy(GlobalHost.ConnectionManager.GetHubContext<T>());
            }
        }
    }
}
