function append_new_element_wrapper() {
  current_wrapper = document.getElementById('new_element_wrapper');
  $(current_wrapper).attr("id", "insert-after");
  $('<div id="new_element_wrapper"></div>').insertAfter( "#insert-after" );
  $(current_wrapper).attr("id","");
}

function set_parent_to_modify (element) {
  var parent_element = $(element).parent();
  parent_element.attr("id", "to-modify");
}

function remove_to_modify(element) {
  element.attr("id", "");
}

function add_element(element_type) {
  $.ajax({
    url: '/newsletter/element/new',
    data: { 'element_type' : element_type  }
  });
}

function save_element (element_type, wrapper_id) {
  $.ajax({
    url : 'newsletter/element/save',
    data : {
      'element_type' : element_type,
      'target' : wrapper_id
    }
  });
}

function delete_element (element_id) {
  // body...
}