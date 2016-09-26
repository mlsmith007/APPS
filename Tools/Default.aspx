<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Tools_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<form id="form1" runat="server">
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Server Lookup</h3>
					</div>
					<div class="panel-body">
						<div>
							<label class="control-label" for="ServerSearch"></label>
							<input class="form-control" id="ServerLookupSearchBox" placeholder="Enter Serve Name or IP" />
						</div>
						<div>
							<br /><br />
							<button type="button" class="btn btn-primary ServerLookupButton" id="ServerLookupButton"><i class="fa fa-search"></i>Search</button>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">AD Group Review</h3>
					</div>
					<div class="panel-body">
						Active Directory Domains/Groups
					</div>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Employee L10 Lookup</h3>
					</div>
					<div class="panel-body">
						<div>
							<label class="control-label" for="EmployeeL10Lookup"></label>
							<input class="form-control" id="EmployeeL10LookupSearchBox" placeholder="Enter Employee E-Number or Name" />
						</div>
						<div>
							<br />
							<br />
							<button type="button" class="btn btn-primary ServerLookupButton" id="ServerLookupButton"><i class="fa fa-search"></i>Search</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="BaseModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="BaseModalTitle">Modal title</h4>
				</div>
				<div class="modal-body" id="BaseModalBody">
					<p>Test content</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function () {
			$('#ServerLookupButton').prop('disabled', true).button('refresh');
			$('#BaseModal').modal('hide');
			$('#ServerLookupSearchBox').keyup(function () {
				if ($(this).val().length != 0) {
					$('#ServerLookupButton').prop('disabled', false).button('refresh');
				} else {
					$('#ServerLookupButton').prop('disabled', true).button('refresh');
				}
			});
			$('#ServerLookupButton').click(function () {
				$.ajax({
					type: 'POST',
					url: '/Tools/ToolsService.asmx/EmployeeL10AutoComplete',
					data: { 'InputString': $('#ServerLookupSearchBox').val() },
					complete: function (xData, status) {
						alert(xData.responseText, " Status:", status)
						$('#BaseModalBody').html(xData.responseText);
						$('#BaseModal').modal('show');
					}
				})
			})
		});
	</script>
	</form>
</asp:Content>

