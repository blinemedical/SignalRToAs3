using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Reactive.Linq;
using System.Threading.Tasks;
using SignalR.Hubs;

namespace Hubs
{
    [HubName("as3Hub")]
    public class As3Hub : Hub, IConnected
    {
        public As3Hub()
        {
            As3HubProcessor.Instance.Initialize();
        }

        public Task Connect()
        {
            return null;
        }

        public Task Reconnect(IEnumerable<string> groups)
        {
            return null;
        }
    }
}
