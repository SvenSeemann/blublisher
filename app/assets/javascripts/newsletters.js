function new_next_employment_notices () {
    var old_element = document.getElementById('next-employment-notices');
    $(old_element).attr('id', 'en-insert-after');
    $('<div id="next-employment-notices"></div>').insertAfter('#en-insert-after');
    $(old_element).attr('id', '');
}

function get_emplyoment_notices(department_id) {
  $.ajax({
    url: '/departments/' + department_id + '/employment_notices'
  });
}

function get_newsletter_id() {
  return $('#newsletter_id').val();
}

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
  newsletter_id = get_newsletter_id();
  $.ajax({
    url : 'newsletter/element/save',
    data : {
      'element_type' : element_type,
      'target' : wrapper_id,
      'newsletter_id' : newsletter_id
    }
  });
}

function save_title (title) {
  $.ajax({
    url: '/newsletter/set_title',
    data: {
      'title' : title
    }
  });
}


function place_title() {
  var img = document.getElementById('newsletter-header-img');
  var img_width = img.clientWidth;
  var img_height = img.clientHeight;

  var title_field = document.getElementById('newsletter-title');
  var title_width = title_field.clientWidth;

  var top = Math.floor(img_height * 0.9);
  var left = Math.floor((img_width / 2) - (title_width / 2));
  var font_size = Math.floor(img_height * 0.1);

  $(title_field).css("top", top + "px");
  $(title_field).css("left", left + "px");
  $(title_field).css("font-size", font_size + "px");
}