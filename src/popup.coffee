addEventListener 'DOMContentLoaded', ->
  urls = {
    8: 'http://www.oracle.com/technetwork/java/javase/downloads/java-archive-javase8-2177648.html'
    7: 'http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase7-521261.html'
    6: 'http://www.oracle.com/technetwork/java/javase/downloads/java-archive-downloads-javase6-419409.html'
  }
  downloads = {}
  update = document.getElementById 'update'
  platform = document.getElementById 'platform'
  document.getElementById 'dl'
  .addEventListener 'click', ->
    chrome.cookies.set {
      url: 'http://www.oracle.com'
      name: 'oraclelicense'
      value: 'accept-securebackup-cookie'
      domain: '.oracle.com'
    }, ->
      chrome.downloads.download {
        url: platform.value.replace 'otn', 'otn-pub'
      }
      return
    return
  document.getElementById 'version'
  .addEventListener 'change', ->
    xhr = new XMLHttpRequest
    xhr.open 'GET', urls[@.value]
    xhr.responseType = 'document'
    xhr.addEventListener 'load', ->
      @.response.scripts[8].textContent.match /^downloads.*$/gm
      .forEach (element) ->
        eval element.replace 'new Array()', '{}'
        return
      update.innerHTML = ''
      for key of downloads
        update.add new Option key, key
      return
    do xhr.send
    return
  update.addEventListener 'change', ->
    platform.innerHTML = ''
    for key of downloads[@.value].files
      platform.add new Option key, downloads[@.value].files[key].filepath
    return
  return
