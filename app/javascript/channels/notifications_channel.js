import consumer from "./consumer";

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // console.log("Connected");
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // console.log("DisConnected");
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    data = data.content;
    var nobj = data.notification
    console.log(data);
    var ncount = parseInt($("#notify_count").text()) + 1;
    $("#notify_count").text(ncount);
    $("#notif_body")
      .find("tbody")
      .prepend(
        '<tr class="table-' +
          nobj.priority +
          '"><td>' +
          nobj.id +
          " </td><td>" +
          data.sender +
          "</td><td>" +
          nobj.message +
          "</td><td>" +
          nobj.created_at +
          "</td></tr>"
      );
  },
});
