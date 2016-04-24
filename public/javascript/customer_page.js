function initPage(){
  $("#post_compliment").hide();
  $("#post_complaint").hide();
  $("#view_past_orders").hide();
  $("#edit_order").hide();
  $("#edit_shipping").hide();
  $("#edit_profile").hide();
  $("#view_next_order").hide();
  $("#vieworder_hist").hide();
  $("#view_action_complaints").hide();
  $("#view_approve_compliments").hide();
}

function showCustomerLanding() {
  $("#post_compliment").hide();
  $("#post_complaint").hide();
  $("#view_past_orders").hide();
  $("#edit_order").hide();
  $("#edit_shipping").hide();
  $("#edit_profile").hide();
  $("#default_stuff").show();              // The function returns the product of p1 and p2
}

function showProfile(){
  $("#post_compliment").hide();
  $("#post_complaint").hide();
  $("#view_past_orders").hide();
  $("#edit_order").hide();
  $("#edit_shipping").hide();
  $("#edit_profile").show();
  $("#default_stuff").hide();
}

function showEditShipping(){
  $("#post_compliment").hide();
  $("#post_complaint").hide();
  $("#view_past_orders").hide();
  $("#edit_order").hide();
  $("#edit_shipping").show();
  $("#edit_profile").hide();
  $("#default_stuff").hide();
}

function showEditOrder(){
  $("#post_compliment").hide();
  $("#post_complaint").hide();
  $("#view_past_orders").hide();
  $("#edit_order").show();
  $("#edit_shipping").hide();
  $("#edit_profile").hide();
  $("#default_stuff").hide();
}
function showViewOrderHistory(){
  $("#post_compliment").hide();
  $("#post_complaint").hide();
  $("#view_past_orders").show();
  $("#edit_order").hide();
  $("#edit_shipping").hide();
  $("#edit_profile").hide();
  $("#default_stuff").hide();
}

function showMakeAComplaint(){
  $("#post_compliment").hide();
  $("#post_complaint").show();
  $("#view_past_orders").hide();
  $("#edit_order").hide();
  $("#edit_shipping").hide();
  $("#edit_profile").hide();
  $("#default_stuff").hide();
}

function showMakeACompliment(){
  $("#post_compliment").show();
  $("#post_complaint").hide();
  $("#view_past_orders").hide();
  $("#edit_order").hide();
  $("#edit_shipping").hide();
  $("#edit_profile").hide();
  $("#default_stuff").hide();
}

function showEmployeeLanding(){
  $("#default_view").show();
  $("#view_next_order").hide();
  $("#vieworder_hist").hide();
  $("#view_action_complaints").hide();
  $("#view_approve_compliments").hide();
}

function showUpcomingOrder(){
  $("#default_view").hide();
  $("#view_next_order").show();
  $("#vieworder_hist").hide();
  $("#view_action_complaints").hide();
  $("#view_approve_compliments").hide();
}

function showAllPastOrders(){
  $("#default_view").hide();
  $("#view_next_order").hide();
  $("#vieworder_hist").show();
  $("#view_action_complaints").hide();
  $("#view_approve_compliments").hide();
}

function showAndActionComplaints(){
  $("#default_view").hide();
  $("#view_next_order").hide();
  $("#vieworder_hist").hide();
  $("#view_action_complaints").show();
  $("#view_approve_compliments").hide();
}
function showAndApproveCompliments(){
  $("#default_view").hide();
  $("#view_next_order").hide();
  $("#vieworder_hist").hide();
  $("#view_action_complaints").hide();
  $("#view_approve_compliments").show();
}



$(document).ready(function(){
  initPage();
  });

// CUSTOMER PAGE

  $("#main_page").click(function(){
      showCustomerLanding();
    });

    $("#link_profile").click(function(){
      showProfile();
    });

    $("#edship").click(function(){
      showEditShipping();
    });
    $("#edorder").click(function(){
      showEditOrder();
    });
    $("#viewhist").click(function(){
      showViewOrderHistory();
    });
    $("#sosorry").click(function(){
      showMakeAComplaint();
    });
    $("#attaboy").click(function(){
      showMakeACompliment();
    });


//EMPLOYEE page

    $("#employee_welcome").click(function(){
      showEmployeeLanding();
    });

    $("#vieworder").click(function(){
      showUpcomingOrder();
    });

    $("#viewhist").click(function(){
      showAllPastOrders();
    });

    $("#sosorry_admin").click(function(){
      showAndActionComplaints();
    });

    $("#attaboy_admin").click(function(){
      showAndApproveCompliments();
    });

    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    $("#bs-example-navbar-collapse-1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
