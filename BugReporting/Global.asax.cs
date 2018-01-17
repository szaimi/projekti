using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace BugReporting
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            string JQueryVer = "1.7.1";

            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition

            {

                Path = "~/Style/jquery.min.js",

                DebugPath = "~/Scripts/jquery.min.js",

                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",

                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",

                CdnSupportsSecureConnection = true,

                LoadSuccessExpression = "window.jQuery"

            });
        }
    }
}