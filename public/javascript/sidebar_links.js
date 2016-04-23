$(document).ready(function(){
        $("#post_complement").hide();
        $("#post_complaint").hide();
        $("#view_past_orders").hide();
        $("#edit_order").hide();
        $("#edit_shipping").hide();
        $("#edit_profile").hide();
        $("#view_next_order").hide();
        $("#vieworder_hist").hide();
        $("#view_action_complaints").hide();
        $("#view_approve_compliments").hide();
    });

// CUSTOMER PAGE

  $("#main_page").click(function(){
        $("#post_complement").hide();
        $("#post_complaint").hide();
        $("#view_past_orders").hide();
        $("#edit_order").hide();
        $("#edit_shipping").hide();
        $("#edit_profile").hide();
        $("#default_stuff").show();
    });

    $("#link_profile").click(function(){
        $("#post_complement").hide();
        $("#post_complaint").hide();
        $("#view_past_orders").hide();
        $("#edit_order").hide();
        $("#edit_shipping").hide();
        $("#edit_profile").show();
        $("#default_stuff").hide();
    });

    $("#edship").click(function(){
        $("#post_complement").hide();
        $("#post_complaint").hide();
        $("#view_past_orders").hide();
        $("#edit_order").hide();
        $("#edit_shipping").show();
        $("#edit_profile").hide();
        $("#default_stuff").hide();
    });
    $("#edorder").click(function(){
        $("#post_complement").hide();
        $("#post_complaint").hide();
        $("#view_past_orders").hide();
        $("#edit_order").show();
        $("#edit_shipping").hide();
        $("#edit_profile").hide();
        $("#default_stuff").hide();
    });
    $("#viewhist").click(function(){
        $("#post_complement").hide();
        $("#post_complaint").hide();
        $("#view_past_orders").show();
        $("#edit_order").hide();
        $("#edit_shipping").hide();
        $("#edit_profile").hide();
        $("#default_stuff").hide();
    });
    $("#sosorry").click(function(){
        $("#post_complement").hide();
        $("#post_complaint").show();
        $("#view_past_orders").hide();
        $("#edit_order").hide();
        $("#edit_shipping").hide();
        $("#edit_profile").hide();
        $("#default_stuff").hide();
    });
    $("#attaboy").click(function(){
        $("#post_complement").show();
        $("#post_complaint").hide();
        $("#view_past_orders").hide();
        $("#edit_order").hide();
        $("#edit_shipping").hide();
        $("#edit_profile").hide();
        $("#default_stuff").hide();
    });


//EMPLOYEE page

    $("#employee_welcome").click(function(){
      $("#default_view").show();
      $("#view_next_order").hide();
      $("#vieworder_hist").hide();
      $("#view_action_complaints").hide();
      $("#view_approve_compliments").hide();
    });

    $("#vieworder").click(function(){
      $("#default_view").hide();
      $("#view_next_order").show();
      $("#vieworder_hist").hide();
      $("#view_action_complaints").hide();
      $("#view_approve_compliments").hide();
    });

    $("#viewhist").click(function(){
      $("#default_view").hide();
      $("#view_next_order").hide();
      $("#vieworder_hist").show();
      $("#view_action_complaints").hide();
      $("#view_approve_compliments").hide();
    });

    $("#sosorry_admin").click(function(){
      $("#default_view").hide();
      $("#view_next_order").hide();
      $("#vieworder_hist").hide();
      $("#view_action_complaints").show();
      $("#view_approve_compliments").hide();
    });

    $("#attaboy_admin").click(function(){
      $("#default_view").hide();
      $("#view_next_order").hide();
      $("#vieworder_hist").hide();
      $("#view_action_complaints").hide();
      $("#view_approve_compliments").show();
    });





    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    $("#bs-example-navbar-collapse-1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
