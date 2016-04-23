(function($, window)
{

	$(window).on('load', function()
	{
		function fnInitCompleteCallback(that)
		{
			var p = that.parents('.dataTables_wrapper').first();
	    	var l = p.find('.row').find('label');

	    	l.each(function(index, el) {
	    		var iw = $("<div>").addClass('col-md-8').appendTo($(el).parent());
	    		$(el).parent().addClass('form-group margin-none').parent().addClass('form-horizontal');
	            $(el).find('input, select').addClass('form-control').removeAttr('size').appendTo(iw);
	            $(el).addClass('col-md-4 control-label');
	    	});

	    	var s = p.find('select');
	    	s.addClass('.selectpicker').select2();
		}

		/* DataTables */
		if ($('.dynamicTable').size() > 0)
		{
			$('.dynamicTable').each(function()
			{
				// DataTables with TableTools
				if ($(this).is('.tableTools'))
				{
					$(this).dataTable({
						"sPaginationType": "bootstrap",
						"sDom": "<'row separator bottom'<'col-md-5'T><'col-md-3'l><'col-md-4'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
						"oLanguage": {
							"sLengthMenu": "_MENU_ Show"
						},
						"oTableTools": {
							"sSwfPath": componentsPath + "modules/admin/tables/datatables/assets/lib/extras/TableTools/media/swf/copy_csv_xls_pdf.swf"
					    },
					    "aoColumnDefs": [
				          { 'bSortable': false, 'aTargets': [ 0 ] }
				       	],
				       	"sScrollX": "100%",
				       	"sScrollXInner": "100%",
				        "bScrollCollapse": true,
					    "fnInitComplete": function () {
					    	fnInitCompleteCallback(this);
				        }
					});
				}
				// colVis extras initialization
				else if ($(this).is('.colVis'))
				{
				var a =	$(this).dataTable({
						"sPaginationType": "bootstrap",
						"sDom": "<'row separator bottom'<'col-md-3'f><'col-md-3'l><'col-md-6'C>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
                        sAjaxSource     : $(this).data('source'),
                        aaSorting: [[0, 'desc']],
                        bProcessing: true,
                        bServerSide: true,
						"sScrollX": "100%",
				       	"sScrollXInner": "100%",
				        "bScrollCollapse": true,
                        "iDisplayLength": 100 * 10 * 1000,
                        "aLengthMenu": [[500, 300, 900, 1000, -1], [500, 300, 900, 1000, "All"]],
                        "fnServerParams": function ( aoData ) {
                            aoData.push( { "name": "lga", "value": $('.local-government').val() } );
                            aoData.push( { "name": "state", "value": $('.state').val() } );
                            aoData.push( { "name": "army_corp", "value": $('.army-corp').val() } );
                            aoData.push( { "name": "specialization", "value": $('.specialization').val() } );
                            aoData.push( { "name": "qualifications", "value": $('.qualifications').val() } );
                        },
						"fnInitComplete": function () {
					    	fnInitCompleteCallback(this);
				        }

					});

                    $('.advanced-filters').on("change", function() {
                        a.fnFilter();
                    })
				}
				else if ($(this).is('.scrollVertical'))
				{
					$(this).dataTable({
						"bPaginate": false,
						"sScrollY": "200px",
						"sScrollX": "100%",
				       	"sScrollXInner": "100%",
				        "bScrollCollapse": true,
				       	"sDom": "<'row separator bottom'<'col-md-12'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
				       	"fnInitComplete": function () {
					    	fnInitCompleteCallback(this);
				        }
					});
				}
				else if ($(this).is('.ajax'))
				{
					$(this).dataTable({
						"sPaginationType": "bootstrap",
						"bProcessing": true,
                        sAjaxSource     : $(this).data('source'),
				       	"sDom": "<'row separator bottom'<'col-md-12'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
				       	"sScrollX": "100%",
				       	"sScrollXInner": "100%",
				        "bScrollCollapse": true,
                        "iDisplayLength": 5,
                        "aLengthMenu": [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
				       	"fnInitComplete": function () {
					    	fnInitCompleteCallback(this);
				        }
					});
				}
				else if ($(this).is('.fixedHeaderColReorder'))
				{
					$(this).dataTable({
						"sPaginationType": "bootstrap",
				       	"sDom": "R<'clear'><'row separator bottom'<'col-md-12'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
				       	"sScrollX": "100%",
				       	"sScrollXInner": "100%",
				        "bScrollCollapse": true,
				       	"fnInitComplete": function () {
					    	fnInitCompleteCallback(this);
					    	var t = this;
					    	setTimeout(function(){
					    		new FixedHeader( t );
					    	}, 1000);
				        }
					});
				}
				// default initialization
				else
				{
					$(this).dataTable({
						"sPaginationType": "bootstrap",
						"sDom": "<'row separator bottom'<'col-md-5'T><'col-md-3'l><'col-md-4'f>r>t<'row'<'col-md-6'i><'col-md-6'p>>",
						"sScrollX": "100%",
				       	"sScrollXInner": "100%",
				        "bScrollCollapse": true,
						"oLanguage": {
							"sLengthMenu": "_MENU_ per page"
						},
						"fnInitComplete": function () {
					    	fnInitCompleteCallback(this);
				        }
					});
				}
			});
		}
	});
	
})(jQuery, window);