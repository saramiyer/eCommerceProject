﻿<%@ Page Title="Product" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="CourseDetail.aspx.vb" Inherits="CourseDetail" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container" style="margin-top: 20px">
      <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-default">
          <div class="panel-heading"><h3 class="panel-title">Course Information</h3></div>
          <div class="panel-body">
            <div class="col-xs-3">
              <img src="assets/vince.jpg" alt="140x140" class="img-thumbnail">
            </div>

            <div class="col-xs-9">
              <h2 style="margin-top: 0;">  <asp:label ID="PlaceHolder" runat="server" ></asp:label> </h2>
              <h5>Topic: <asp:Label ID="Topic" runat="server" ></asp:Label></h5>
              <h5>Instructor:<asp:Label ID="Instructor" runat="server" ></asp:Label></h5>
              <h5>Location:<asp:Label ID="Location" runat="server" ></asp:Label></h5>
              <h5>City:<asp:Label ID="City" runat="server" ></asp:Label></h5>
              <h5>Schedule: <asp:Label ID="Schedule" runat="server" ></asp:Label></h5>
              <hr>
              <p>Description: <asp:Label ID="Description" runat="server" ></asp:Label></p>
            </div>
              <!-- We did not use the category information because we combined it with the style table -->
              
              <asp:SqlDataSource ID="workshopSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:M418_group3ConnectionString %>" SelectCommand="SELECT workshopID, city, location, dateTime, topicID, firmID, instructorID FROM platformWorkshop WHERE (workshopID = @workshopID)">
                  <SelectParameters>
                      <asp:QueryStringParameter DefaultValue="1" Name="workshopID" QueryStringField="workshopID" />
                  </SelectParameters>
              </asp:SqlDataSource>
              
          </div>
           <div class="panel-footer">
            <div class="text-right">
              <form class="form-inline">
                <h4>Course Price:<asp:Label ID="Price" runat="server" ></asp:Label></h4>
                <div class="form-group">
              
                </div>
                <button type="submit" class="btn btn-primary">Add to Cart</button>
              </form>
            </div>
          </div>
        </div>
      
      </div>
    </div>
</asp:Content>