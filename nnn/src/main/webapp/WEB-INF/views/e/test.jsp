<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      display: flex;
    }

    #sidebar {
      width: 200px;
      height: 100vh;
      background-color: #333;
      color: #fff;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 20px;
    }

    #tabs {
      display: flex;
      flex-direction: row;
    }

    .tab {
      background-color: #444;
      color: #fff;
      padding: 10px 20px;
      cursor: pointer;
      transition: background-color 0.3s;
      position: relative;
      margin-bottom: 5px;
    }

    .tab:hover {
      background-color: #555;
    }

    .tab.active {
      background-color: #007BFF;
    }

    .content-tab {
      display: inline-block;
      padding: 20px;
      border: 1px solid #ddd;
      flex-grow: 1;
      height: 22px;
      width: 200px;
      
    }
    .remove-button {
    background-color: #ff0000;
    color: #fff;
    padding: 5px 10px;
    cursor: pointer;
    position: relative;
    top: -21px;
    width: 10px;
    right: -175px;
}
    }
  </style>
</head>
<body>

<div id="sidebar">
  <div class="tab" onclick="showContent('tab1')">Tab 1</div>
  <div class="tab" onclick="showContent('tab2')">Tab 2</div>
  <div class="tab" onclick="showContent('tab3')">Tab 3</div>
</div>

<div id="tabs"></div>


<script>
  function showContent(tabId) {
    // Check if the tab is already open
    var existingTab = document.getElementById(tabId + '-tab');
    if (!existingTab) {
      // Create a new tab
      var newTab = document.createElement('div');
      newTab.className = 'content-tab';
      newTab.id = tabId + '-tab';
      newTab.innerHTML = 'Content for ' + tabId;

      // Add remove button
      var removeButton = document.createElement('div');
      removeButton.className = 'remove-button';
      removeButton.innerHTML = 'X';
      removeButton.onclick = function() {
        removeTab(tabId);
      };
      newTab.appendChild(removeButton);

      // Display the new tab
      document.getElementById('tabs').appendChild(newTab);

      // Deactivate all tabs
      var tabs = document.querySelectorAll('.tab');
      tabs.forEach(function(tab) {
        tab.classList.remove('active');
      });

      // Activate the selected tab
      var activeTab = document.querySelector('.tab[data-tab="' + tabId + '"]');
      if (activeTab) {
        activeTab.classList.add('active');
      }
    }
  }

  function removeTab(tabId) {
    // Remove the corresponding content tab
    var contentTab = document.getElementById(tabId + '-tab');
    if (contentTab) {
      contentTab.remove();
    }

    // Remove the tab from the sidebar
    var sidebarTab = document.querySelector('.tab[data-tab="' + tabId + '"]');
    if (sidebarTab) {
      sidebarTab.remove();
    }
  }
</script>
</body>
</html>