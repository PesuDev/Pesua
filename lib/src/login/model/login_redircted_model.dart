class ReDirectModel {
  String? remoteAddr;
  String? connection;
  String? xPoweredBy;
  String? setCookie;
  String? location;
  String? date;
  String? contentLength;
  String? server;
  String? xRemoteIp;

  ReDirectModel(
      {this.remoteAddr,
        this.connection,
        this.xPoweredBy,
        this.setCookie,
        this.location,
        this.date,
        this.contentLength,
        this.server,
        this.xRemoteIp});

  ReDirectModel.fromJson(Map<String, dynamic> json) {
    remoteAddr = json['remote_addr'];
    connection = json['connection'];
    xPoweredBy = json['x-powered-by'];
    setCookie = json['set-cookie'];
    location = json['location'];
    date = json['date'];
    contentLength = json['content-length'];
    server = json['server'];
    xRemoteIp = json['x-remote-ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['remote_addr'] = this.remoteAddr;
    data['connection'] = this.connection;
    data['x-powered-by'] = this.xPoweredBy;
    data['set-cookie'] = this.setCookie;
    data['location'] = this.location;
    data['date'] = this.date;
    data['content-length'] = this.contentLength;
    data['server'] = this.server;
    data['x-remote-ip'] = this.xRemoteIp;
    return data;
  }
}
