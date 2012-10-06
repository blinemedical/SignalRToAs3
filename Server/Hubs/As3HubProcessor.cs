using System;
using System.Collections.Generic;
using System.Linq;
using System.Reactive.Linq;
using System.Text;
using AmfInvoker;
using Data;

namespace Hubs
{
    public class As3HubProcessor : HubProcessorBase<As3Hub>
    {
        private static readonly Lazy<As3HubProcessor> _instance = new Lazy<As3HubProcessor>();
        public static As3HubProcessor Instance
        {
            get { return _instance.Value; }
        }

        public void Dispatch()
        {
            Context.Clients.TestAmfFunction(new TestObject
                                                {
                                                    Name = DateTime.Now.ToString(),
                                                    IntList = Enumerable.Range(0, 10).ToList()
                                                });
        }

        public void Initialize()
        {
            Observable.Interval(TimeSpan.FromSeconds(1)).Subscribe(_ => Dispatch());
        }
    }
}
