# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
      window.running=false
      window.last_query=''
      $('#txt_state').typeahead
          source: (query, process) ->
                    if (window.running)
                        if (window.address_names.length > 0) 
                          return process(window.address_names)

                    #if (window.last_query.length > 0)   
                      #regx = new RegExp('^'+window.last_query, 'i')
                      #n = query.match(regx)
                      #if (n)
                      #   process(window.address_names)
                      #   return
      
                    window.running = true
                    window.last_query = query
                    $.ajax(
                        url: "/autocomplete/addresses",
                        type: 'get',
                        data: {query: query},
                        dataType: 'json',
                        success: (data) ->
                           window.running=false
                           if (window.console && window.console.log)
                              window.console.log('received data from server, length:'+data.length)
                           window.address_names = []
                           window.address_map = {}

                           $.each(data, 
                               (i, address) ->
                                  window.address_map[address.name] = address;
                                  window.address_names.push(address.name);
                               );
                           process(window.address_names)
                        )
          updater: (item) ->
                  window.selected_id = window.address_map[item].id;
                  item

