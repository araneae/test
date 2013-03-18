# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
      window.running=false
      $('#txt_state').typeahead
          source: (query, process) ->
                    if (window.running) 
                        return
                    
                    window.running = true
                    $.ajax(
                        url: "/autocomplete/addresses",
                        type: 'get',
                        data: {query: query},
                        dataType: 'json',
                        success: (data) ->
                           console.log(data)
                           address_names = []
                           window.address_map = {}

                           $.each(data, 
                               (i, address) ->
                                  window.address_map[address.name] = address;
                                  address_names.push(address.name);
                               );
                           window.running=false
                           process(address_names)
                        )
          updater: (item) ->
                  window.selected_id = window.address_map[item].id;
                  item

