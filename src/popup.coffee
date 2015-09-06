addEventListener 'DOMContentLoaded', ->
  downloads = {}
  document.getElementById 'dl'
  .addEventListener 'click', ->
    chrome.cookies.set {
      url: 'http://www.oracle.com'
      name: 'oraclelicense'
      value: 'accept-securebackup-cookie'
      domain: '.oracle.com'
    }, ->
      chrome.downloads.download {
        url: document.getElementById 'platform'
             .value.replace 'otn', 'otn-pub'
      }
      return
    return
  document.getElementById 'version'
  .addEventListener 'change', ->
    xhr = new XMLHttpRequest
    xhr.open 'GET', 'http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html'
    xhr.responseType = 'document'
    xhr.addEventListener 'load', ->
      @.response.scripts[8].textContent.match /^downloads.*$/gm
      .forEach (element) ->
        eval element.replace 'new Array()', '{}'
        return
      update = document.getElementById 'update'
      update.innerHTML = ''
      for key of downloads
        option = document.createElement 'option'
        option.value = key
        option.textContent = key
        update.appendChild option
      return
    do xhr.send
    return
  document.getElementById 'update'
  .addEventListener 'change', ->
    platform = document.getElementById 'platform'
    platform.innerHTML = ''
    for key of downloads[@.value].files
      option = document.createElement 'option'
      option.value = downloads[@.value].files[key].filepath
      option.textContent = key
      platform.appendChild option
    return
  return
