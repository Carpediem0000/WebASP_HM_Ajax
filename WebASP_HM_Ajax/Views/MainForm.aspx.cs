using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebASP_HM_Ajax.Views
{
    public partial class MainForm : System.Web.UI.Page, ICallbackEventHandler
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataBind();

            ClientScriptManager manager = Page.ClientScript;
            string resp = manager.GetCallbackEventReference(this, "num", "createMatrix", null, false);
            string callbackScript = $"javascript:{{{resp}}}";

            btn_Matrix_3.Attributes["onclick"] = callbackScript.Replace("num", btn_Matrix_3.Attributes["value"]);
            btn_Matrix_4.Attributes["onclick"] = callbackScript.Replace("num", btn_Matrix_4.Attributes["value"]);
            btn_Matrix_5.Attributes["onclick"] = callbackScript.Replace("num", btn_Matrix_5.Attributes["value"]);
        }

        private string _eventArgument;
        void ICallbackEventHandler.RaiseCallbackEvent(string eventArgument)
        {
            _eventArgument = eventArgument;
        }
        string ICallbackEventHandler.GetCallbackResult()
        {
            if (!string.IsNullOrEmpty(_eventArgument))
            {
                return _eventArgument;
            }
            else return "3";
        }
    }
}