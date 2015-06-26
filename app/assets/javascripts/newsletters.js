function append_new_element_wrapper() {
  current_wrapper = document.getElementById('new_element_wrapper');
  $(current_wrapper).attr("id", "insert-after");
  $('<div id="new_element_wrapper">New one</div>').insertAfter( "#insert-after" );
  $(current_wrapper).attr("id","");
}


function add_element(element_type) {
  $.ajax({
    url: '/newsletter/element/new',
    data: { 'element_type' : element_type  }
  });
}

function save_element (params) {
  // body...
}

function delete_element (element_id) {
  // body...
}