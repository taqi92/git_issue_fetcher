class IssueResponse {
  final String? url;
  final String? repositoryUrl;
  final String? labelsUrl;
  final String? commentsUrl;
  final String? eventsUrl;
  final String? htmlUrl;
  final int? id;
  final String? nodeId;
  final int? number;
  final String? title;
  final User? user;
  final List<dynamic>? labels;
  final String? state;
  final bool? locked;
  final dynamic assignee;
  final List<dynamic>? assignees;
  final dynamic milestone;
  final int? comments;
  final String? createdAt;
  final String? updatedAt;
  final dynamic closedAt;
  final String? authorAssociation;
  final dynamic activeLockReason;
  final String? body;
  //final Reactions? reactions;
  final String? timelineUrl;
  final dynamic performedViaGithubApp;
  final dynamic stateReason;

  IssueResponse({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.labels,
    this.state,
    this.locked,
    this.assignee,
    this.assignees,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.activeLockReason,
    this.body,
    //this.reactions,
    this.timelineUrl,
    this.performedViaGithubApp,
    this.stateReason,
  });

  IssueResponse.fromJson(Map<String, dynamic> json)
      : url = json['url'] as String?,
        repositoryUrl = json['repository_url'] as String?,
        labelsUrl = json['labels_url'] as String?,
        commentsUrl = json['comments_url'] as String?,
        eventsUrl = json['events_url'] as String?,
        htmlUrl = json['html_url'] as String?,
        id = json['id'] as int?,
        nodeId = json['node_id'] as String?,
        number = json['number'] as int?,
        title = json['title'] as String?,
        user = (json['user'] as Map<String, dynamic>?) != null ? User.fromJson(
            json['user'] as Map<String, dynamic>) : null,
        labels = json['labels'] as List?,
        state = json['state'] as String?,
        locked = json['locked'] as bool?,
        assignee = json['assignee'],
        assignees = json['assignees'] as List?,
        milestone = json['milestone'],
        comments = json['comments'] as int?,
        createdAt = json['created_at'] as String?,
        updatedAt = json['updated_at'] as String?,
        closedAt = json['closed_at'],
        authorAssociation = json['author_association'] as String?,
        activeLockReason = json['active_lock_reason'],
        body = json['body'] as String?,
        /*reactions = (json['reactions'] as Map<String, dynamic>?) != null
            ? Reactions.fromJson(json['reactions'] as Map<String, dynamic>)
            : null,*/
        timelineUrl = json['timeline_url'] as String?,
        performedViaGithubApp = json['performed_via_github_app'],
        stateReason = json['state_reason'];

  Map<String, dynamic> toJson() =>
      {
        'url': url,
        'repository_url': repositoryUrl,
        'labels_url': labelsUrl,
        'comments_url': commentsUrl,
        'events_url': eventsUrl,
        'html_url': htmlUrl,
        'id': id,
        'node_id': nodeId,
        'number': number,
        'title': title,
        'user': user?.toJson(),
        'labels': labels,
        'state': state,
        'locked': locked,
        'assignee': assignee,
        'assignees': assignees,
        'milestone': milestone,
        'comments': comments,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'closed_at': closedAt,
        'author_association': authorAssociation,
        'active_lock_reason': activeLockReason,
        'body': body,
        //'reactions': reactions?.toJson(),
        'timeline_url': timelineUrl,
        'performed_via_github_app': performedViaGithubApp,
        'state_reason': stateReason
      };
}

class User {
  final String? login;
  final int? id;
  final String? nodeId;
  final String? avatarUrl;
  final String? gravatarId;
  final String? url;
  final String? htmlUrl;
  final String? followersUrl;
  final String? followingUrl;
  final String? gistsUrl;
  final String? starredUrl;
  final String? subscriptionsUrl;
  final String? organizationsUrl;
  final String? reposUrl;
  final String? eventsUrl;
  final String? receivedEventsUrl;
  final String? type;
  final bool? siteAdmin;

  User({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
  });

  User.fromJson(Map<String, dynamic> json)
      : login = json['login'] as String?,
        id = json['id'] as int?,
        nodeId = json['node_id'] as String?,
        avatarUrl = json['avatar_url'] as String?,
        gravatarId = json['gravatar_id'] as String?,
        url = json['url'] as String?,
        htmlUrl = json['html_url'] as String?,
        followersUrl = json['followers_url'] as String?,
        followingUrl = json['following_url'] as String?,
        gistsUrl = json['gists_url'] as String?,
        starredUrl = json['starred_url'] as String?,
        subscriptionsUrl = json['subscriptions_url'] as String?,
        organizationsUrl = json['organizations_url'] as String?,
        reposUrl = json['repos_url'] as String?,
        eventsUrl = json['events_url'] as String?,
        receivedEventsUrl = json['received_events_url'] as String?,
        type = json['type'] as String?,
        siteAdmin = json['site_admin'] as bool?;

  Map<String, dynamic> toJson() =>
      {
        'login': login,
        'id': id,
        'node_id': nodeId,
        'avatar_url': avatarUrl,
        'gravatar_id': gravatarId,
        'url': url,
        'html_url': htmlUrl,
        'followers_url': followersUrl,
        'following_url': followingUrl,
        'gists_url': gistsUrl,
        'starred_url': starredUrl,
        'subscriptions_url': subscriptionsUrl,
        'organizations_url': organizationsUrl,
        'repos_url': reposUrl,
        'events_url': eventsUrl,
        'received_events_url': receivedEventsUrl,
        'type': type,
        'site_admin': siteAdmin
      };
}