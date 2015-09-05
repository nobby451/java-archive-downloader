addEventListener 'DOMContentLoaded', ->
  document.getElementById 'dl'
  .addEventListener 'click', ->
    chrome.cookies.set {
      url: 'http://www.oracle.com'
      name: 'oraclelicense'
      value: 'accept-securebackup-cookie'
      domain: '.oracle.com'
    }, ->
      chrome.downloads.download {
        url: 'http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz'
      }
      return
    return
  return
