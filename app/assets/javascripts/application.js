// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$(window).load(function(){
var tabs = $("#tabs");
var tabPanesContainer = $("ul#tabPanes");
var tabPanesAll = tabPanesContainer.find("li").css("position", "absolute");
var tabMenuLinks = $("ul#tabMenu .dropdown");
var regularLinks = $("ul#tabMenu .regular");
var dropDownSpeed = 200;
var dropUpSpeed   = 200;
var menuHeight = '240px';
/*Handle menu links - display the form panel on hover*/
tabMenuLinks.hover(function()
{
    var thisMenuItem = $(this);
    /*get the offset of this item in respect to the page*/
    var thisMargin   = thisMenuItem.offset().left;
    /*get the offset of the navigation bar in respect to the page*/
    var tabsOffset   = tabs.offset().left;
    var thisIndex = thisMenuItem.index();
    thisMargin = Math.floor(thisMargin - tabsOffset);
    /*correct the offset*/
    var thisOffset = thisMargin - 52;
    tabPanesContainer.css('margin-left', thisOffset);
    /*begin animateing the drop down*/
    tabPanesContainer.stop().animate({
        height: menuHeight
    }, dropDownSpeed);
    /*remove the active class from other menu items*/
    tabMenuLinks.removeClass('activeTab');
    /*add the active class to the current menu item*/
    thisMenuItem.addClass('activeTab');
    /*detect and switch to the current form panel*/
    var thisHash = thisMenuItem.find("a").attr('href');
    var tabClicked = tabPanesAll.filter(thisHash);
    tabClicked.appendTo(tabPanesContainer).show();
    return false;
}, function() {
   $(this).stop();
});
/*Close the currently open menu*/
function closeMenu()
{
tabMenuLinks.removeClass('activeTab');
    tabPanesContainer.stop().animate({
        height: '0px'
    }, dropUpSpeed);
}
/*Handle non tab-menu links*/
regularLinks.hover(function()
{
    tabPanesContainer.stop().animate({
        height: '0px'
    });
    tabMenuLinks.removeClass('activeTab');
    $(this).addClass('activeTab');
}, function() {
    $(this).removeClass('activeTab');

});



