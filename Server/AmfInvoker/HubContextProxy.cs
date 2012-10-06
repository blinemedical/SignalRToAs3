using SignalR;
using SignalR.Hubs;

namespace AmfInvoker
{
    class HubContextProxy : IHubContext
    {
        private readonly IHubContext _hubContext;
        private dynamic _clients;

        public HubContextProxy(IHubContext hubContext)
        {
            _hubContext = hubContext;
        }

        #region Implementation of IHubContext

        public dynamic Clients
        {
            get { return _clients ?? (_clients = new ClientsProxy(_hubContext.Clients)); }
        }

        public IGroupManager Groups
        {
            get { return _hubContext.Groups; }
        }

        #endregion
    }
}
