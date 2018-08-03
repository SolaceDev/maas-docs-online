(function(window) {
  // Get the minimally-qualified selector for this element. Will traverse from the given
  // element up the DOM tree to the <html> or <body> tag for a complete DOM traversal path, 
  // or will end early giving an element with an ID as root if possible.
  function getSelector(element) {
    var path = [];
    var walker = element;
    while (walker && walker.nodeType === 1) {
      var tag = walker.tagName.toLowerCase();
      if (tag === 'html' || tag === 'body') break;
      
      if (walker.id.length) {
        // Has an ID. Use that.
        path.push('#' + walker.id);
        break; // Stop traversal at this element.
      } else if (walker.classList.length) {
        path.push(Array.from(walker.classList).map(function(c) { return '.' + c; }).join(''));
      } else {
        // No classes or ID. Use a 'contains' selector.
        path.push(tag + (walker.childNodes.length ? '' : ":contains('" + walker.innerHTML + "')"));
      }
      walker = walker.parentNode;
    }
    return path.reverse().join(' ');
  }

  function makeTracker(domainLock, key, contextName) {
    if (document.location.hostname.endsWith(domainLock)) {
      mixpanel.init(key);
      mixpanel.register({ 
        context: contextName
      });
    } // else Mixpanel will silently reject events
    return mixpanel;
  };

  document.addEventListener('DOMContentLoaded', function onLoaded() {
    var $ = window.jQuery;

    // Modify all external links to open in a new window.
    $("a.external").attr('target','_blank');

    // Install Mixpanel and events.
    var tracker = makeTracker('solace.cloud', "6cd28db525bc99c11f46c628afb16740", 'Learn');

    tracker.track('Navigation Complete'); // every page

    $(document).on('click', 'a', function elementClick(event) {
      tracker.track('Click Element', { selector: getSelector(this) });
      return true;
    });
    $(document).on('submit', '#rtd-search-form', function onSearch(event) {
      var formData = $(this).serializeArray();
      var query = formData.find(function (el) { return el.name === 'q'; });
      tracker.track('Search Sidebar', { query: query && query.value || undefined });
      return true;
    });

  }, false);
}(window));
