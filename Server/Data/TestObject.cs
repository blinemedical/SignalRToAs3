using System;
using System.Collections.Generic;

namespace Data
{
    [Serializable]
    public class TestObject
    {
        public String Name { get; set; }
        public List<int> IntList { get; set; }
    }
}
