//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FunitureManager.Models
{
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    using System.Runtime.Serialization;
 

    public partial class Favorite
    {
        public System.Guid Id { get; set; }
        public Nullable<System.Guid> Id_User { get; set; }
        public Nullable<System.Guid> Id_Product { get; set; }
        [JsonIgnore]
        [IgnoreDataMember]
        public virtual Product Product { get; set; }
        [JsonIgnore]
        [IgnoreDataMember]
        public virtual User User { get; set; }
    }
}
