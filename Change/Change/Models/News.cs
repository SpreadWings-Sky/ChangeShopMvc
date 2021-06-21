//------------------------------------------------------------------------------
// <auto-generated>
//     此代码已从模板生成。
//
//     手动更改此文件可能导致应用程序出现意外的行为。
//     如果重新生成代码，将覆盖对此文件的手动更改。
// </auto-generated>
//------------------------------------------------------------------------------

namespace Change.Models
{
    using System;
    using System.Collections.Generic;
    //
    using System.ComponentModel.DataAnnotations;
    public partial class News
    {
        public int NewsID { get; set; }
        [Display(Name = "分类")]
        [Required(ErrorMessage = "{0}是必填项")]
        public string NTypes { get; set; }
        [Display(Name = "内容")]
        [Required(ErrorMessage = "{0}是必填项")]
        public string Content { get; set; }
        [Display(Name = "图片")]
        [Required(ErrorMessage = "{0}是必填项")]
        public string PhotoUrl { get; set; }
        [Display(Name = "发布时间")]
        public Nullable<System.DateTime> PushTime { get; set; }
        [Display(Name = "状态")]
        public Nullable<int> States { get; set; }
        [Display(Name = "标题")]
        [Required(ErrorMessage = "{0}是必填项")]
        public string Title { get; set; }
    }
}