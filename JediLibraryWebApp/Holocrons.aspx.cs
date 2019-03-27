﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace JediLibraryWebApp
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection connectionSQL;
            string query = "select * from Holocrons where ClassID >=" + Session["ID"] + ";";
            connectionSQL = (SqlConnection)Session["Connection"];
            SqlCommand command = new SqlCommand(query, connectionSQL);
            SqlDataReader reader = null;
            try
            {
                if (Convert.ToInt32(Session["ID"].ToString()) < 4)
                {
                    AddButton.Visible = true;
                }
                connectionSQL.Open();
                reader = command.ExecuteReader();
                int j = 0;
                while (reader.Read())
                {
                    TableRow r = new TableRow();
                    for (int i = 1; i < 3; i++)
                    {
                        TableCell c = new TableCell();
                        c.Text = reader[i].ToString();

                        HyperLink link = new HyperLink();
                        link.NavigateUrl = "~/SelectedItem.aspx?name=Holocrons&id=" + reader[0];
                        link.Text = c.Text;
                        c.Controls.Add(link);

                        r.Cells.Add(c);

                        r.Controls.Add(c);
                    }
                    Table1.Rows.Add(r);
                    j++;
                }
                reader.Close();
                connectionSQL.Close();
            }
            catch (Exception)
            {

            }
        }

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/AddNewHolocron.aspx");
        }
    }
}