using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.UI.WebControls;

namespace Northwind_Newsletter_Moiz_Jamalia
{
    public partial class RegionsManagement : System.Web.UI.Page
    {
        private static readonly string connectionString = ConfigurationManager.ConnectionStrings["ConnStr"].ConnectionString;
        private readonly SqlConnection con = new SqlConnection(connectionString);
        private readonly Region region = new Region();
        protected void Page_Load(object sender, EventArgs e)
        {
            SelectCompleteRegionTable();
        }

        protected void OnBtnAdd_Click(object sender, EventArgs e)
        {
            if (tbRegion.Text == "") lbIfNotExist.Text = "Please enter a region";
            else
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("insertRegion", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add(new SqlParameter("@description", SqlDbType.NChar, 50));
                cmd.Parameters["@description"].Value = tbRegion.Text;

                int inserted = cmd.ExecuteNonQuery();

                con.Close();

                if (inserted < 0) lbIfNotExist.Text = "This region already exists in the database";
                else lbIfNotExist.Text = "";

                SelectCompleteRegionTable();
            }
        }

        protected void OnBtnDelete_Click(object sender, EventArgs e)
        {
            if (tbRegion.Text == "") lbIfNotExist.Text = "Please enter a region";
            else
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("deleteRegion", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add(new SqlParameter("@description", SqlDbType.NChar, 50));
                cmd.Parameters["@description"].Value = tbRegion.Text;

                int deleted = cmd.ExecuteNonQuery();

                con.Close();

                if (deleted == 0) lbIfNotExist.Text = "This region doesn't exist in the database";
                else
                {
                    SelectCompleteRegionTable();
                    lbIfNotExist.Text = "";
                }
            }
        }

        protected void OnBtnBigSmall_Click(object sender, EventArgs e)
        {
            if (tbRegion.Text == "") lbIfNotExist.Text = "Please enter a region";
            else
            {
                con.Open();

                SqlCommand cmd = new SqlCommand("selectRegionDescription", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.Add(new SqlParameter("@description", SqlDbType.NChar, 50));
                cmd.Parameters["@description"].Value = tbRegion.Text;

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    region.RegionID = int.Parse(reader[0].ToString());
                    region.RegionDescription = reader[1].ToString();
                }

                con.Close();

                if (region.RegionDescription != null)
                {
                    int regionID = int.Parse(region.RegionID.ToString());
                    string regionDescription = region.RegionDescription.ToString();
                    string updateRegionDescription = new string(regionDescription.Select(c => char.IsLetter(c) ? (char.IsUpper(c) ? char.ToLower(c) : char.ToUpper(c)) : c).ToArray());

                    con.Open();

                    cmd = new SqlCommand("updateRegion", con)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@ID", SqlDbType.Int));
                    cmd.Parameters.Add(new SqlParameter("@description", SqlDbType.NChar, 50));
                    cmd.Parameters["@ID"].Value = regionID;
                    cmd.Parameters["@description"].Value = updateRegionDescription;

                    int updated = cmd.ExecuteNonQuery();

                    con.Close();

                    if (updated == 0) lbIfNotExist.Text = "This region doesn't exist in the database";
                    else lbIfNotExist.Text = "";

                    SelectCompleteRegionTable();

                    lbIfNotExist.Text = "";
                }
                else lbIfNotExist.Text = "This region doesn't exist in the database";
            }
        }

        protected void GvRegion_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "Region ID";
                e.Row.Cells[1].Text = "Region";
            }
        }

        private void SelectCompleteRegionTable()
        {
            DataSet ds = new DataSet();

            con.Open();

            SqlCommand cmd = new SqlCommand("selectWholeRegionTable", con)
            {
                CommandType = CommandType.StoredProcedure
            };

            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(ds);

            gvRegion.DataSource = ds;
            gvRegion.DataBind();

            con.Close();
        }
    }
}