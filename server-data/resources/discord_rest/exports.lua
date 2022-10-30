--- Discord REST API export functions

local discordRest = DiscordRest:new(Config.botToken)

--- Channel
-- @section channel

--- Adds another member to a thread.
-- @function addThreadMember
-- @param channelId The ID of the thread channel.
-- @param userId The ID of the user to add to the thread.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:addThreadMember("[channel ID]", "[user ID]")
-- @see https://discord.com/developers/docs/resources/channel#add-thread-member
exports("addThreadMember", function(channelId, userId, botToken)
	return discordRest:addThreadMember(channelId, userId, botToken)
end)

--- Delete multiple messages in a single request.
-- @function bulkDeleteMessages
-- @param channelId The ID of the channel containing the messages.
-- @param messages A list of message IDs to delete (2-100).
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:bulkDeleteMessages("[channel ID]", {"[message ID 1]", "[message ID 2]", ...}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#bulk-delete-messages
exports("bulkDeleteMessages", function(channelId, messages, botToken)
	return discordRest:bulkDeleteMessages(channelId, messages, botToken)
end)

--- Create a new invite for a channel.
-- @function createChannelInvite
-- @param channelId The ID of the channel to create an invite for.
-- @param invite The invite settings.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with the newly created invite.
-- @usage exports.discord_rest:createChannelInvite("[channel ID]", {max_age = 3600, max_uses = 1})
-- @see https://discord.com/developers/docs/resources/channel#create-channel-invite
exports("createChannelInvite", function(channelId, invite, botToken)
	return discordRest:createChannelInvite(channelId, invite, botToken)
end)

--- Post a message.
-- @function createMessage
-- @param channelId The ID of the channel to post in.
-- @param message The message parameters.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved when the message is posted.
-- @usage exports.discord_rest:createMessage("[channel ID]", {content = "Hello, world!"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#create-message
exports("createMessage", function(channelId, message, botToken)
	return discordRest:createMessage(channelId, message, botToken)
end)

--- Create a reaction for a message.
-- @function createReaction
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to add a reaction to.
-- @param emoji The name of the emoji to react with.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved when the reaction is added to the message.
-- @usage exports.discord_rest:createReaction("[channel ID]", "[message ID]", "💗", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#create-reaction
exports("createReaction", function(channelId, messageId, emoji, botToken)
	return discordRest:createReaction(channelId, messageId, emoji, botToken)
end)

--- Crosspost a message in a News Channel to following channels.
-- @function crosspostMessage
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to crosspost.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the crossposted message.
-- @usage exports.discord_rest:crosspostMessage("[channel ID]", "[message ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#crosspost-message
exports("crosspostMessage", function(channelId, messageId, botToken)
	return discordRest:crosspostMessage(channelId, messageId, botToken)
end)

--- Deletes all reactions on a message.
-- @function deleteAllReactions
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message whose reactions will be deleted.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteAllReactions("[channel ID]", "[message ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#delete-all-reactions
exports("deleteAllReactions", function(channelId, messageId, botToken)
	return discordRest:deleteAllReactions(channelId, messageId, botToken)
end)

--- Deletes all the reactions for a given emoji on a message.
-- @function deleteAllReactionsForEmoji
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to delete reactions from.
-- @param emoji The emoji of the reaction to delete.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteAllReactionsForEmoji("[channel ID]", "[message ID]", "💗", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#delete-all-reactions-for-emoji
exports("deleteAllReactionsForEmoji", function(channelId, messageId, emoji, botToken)
	return discordRest:deleteAllReactionsForEmoji(channelId, messageId, emoji, botToken)
end)

--- Delete a channel.
-- @function deleteChannel
-- @param channelId The ID of the channel.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteChannel("[channel ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#deleteclose-channel
exports("deleteChannel", function(channelId, botToken)
	return discordRest:deleteChannel(channelId, botToken)
end)

--- Delete a channel permission overwrite for a user or role in a channel.
-- @function deleteChannelPermission
-- @param channelId The ID of the channel.
-- @param overwriteId The ID of the user or role to remove permissions for.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteChannelPermission("[channel ID]", "[overwrite ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#delete-channel-permission
exports("deleteChannelPermission", function(channelId, overwriteId, botToken)
	return discordRest:deleteChannelPermission(channelId, overwriteId, botToken)
end)

--- Delete a message from a channel.
-- @function deleteMessage
-- @param channelId The ID of the channel.
-- @param messageId The ID of the message.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteMessage("[channel ID]", "[message ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#delete-message
exports("deleteMessage", function(channelId, messageId, botToken)
	return discordRest:deleteMessage(channelId, messageId, botToken)
end)

--- Remove own reaction from a message.
-- @function deleteOwnReaction
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to remove the reaction from.
-- @param emoji The emoji of the reaction to remove.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteOwnReaction("[channel ID]", "[message ID]", "💗", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#delete-own-reaction
exports("deleteOwnReaction", function(channelId, messageId, emoji, botToken)
	return discordRest:deleteOwnReaction(channelId, messageId, emoji, botToken)
end)

--- Remove a user's reaction from a message.
-- @function deleteUserReaction
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to remove the reaction from.
-- @param emoji The emoji of the reaction to remove.
-- @param userId The ID of the user whose reaction will be removed.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteOwnReaction("[channel ID]", "[message ID]", "💗", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#delete-user-reaction
exports("deleteUserReaction", function(channelId, messageId, emoji, userId, botToken)
	return discordRest:deleteUserReaction(channelId, messageId, emoji, userId, botToken)
end)

--- Edit the channel permission overwrites for a user or role in a channel.
-- @function editChannelPermissions
-- @param channelId The ID of the channel to edit the permissions of.
-- @param overwriteId The ID of the user or role to edit permissions for.
-- @param permissions The permissions to set.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:editChannelPermissions("[channel ID]", "[overwrite ID]", {allow = 6, deny = 8, type = 0})
-- @see https://discord.com/developers/docs/resources/channel#edit-channel-permissions
exports("editChannelPermissions", function(channelId, overwriteId, permissions, botToken)
	return discordRest:editChannelPermissions(channelId, overwriteId, permissions, botToken)
end)

--- Edit a previously sent message.
-- @function editMessage
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to edit.
-- @param message The edited message.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise, which resolves with the edited message when the request is completed.
-- @usage exports.discord_rest:editMessage("[channel ID]", "[message ID]", {content = "I edited this message!"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#edit-message
exports("editMessage", function(channelId, messageId, message, botToken)
	return discordRest:editMessage(channelId, messageId, message, botToken)
end)

--- Follow a News Channel to send messages to a target channel.
-- @function followNewsChannel
-- @param channelId The ID of the news channel.
-- @param targetChannelId The ID of the target channel.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with a followed channel object.
-- @usage exports.discord_rest:followNewsChannel("[channel ID]", "[target channel ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#follow-news-channel
exports("followNewsChannel", function(channelId, targetChannelId, botToken)
	return discordRest:followNewsChannel(channelId, targetChannelId, botToken)
end)

--- Get channel information.
-- @function getChannel
-- @param channelId The ID of the channel.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:getChannel("[channel ID]", "[bot token]"):next(function(channel) ... end)
-- @see https://discord.com/developers/docs/resources/channel#get-channel
exports("getChannel", function(channelId, botToken)
	return discordRest:getChannel(channelId, botToken)
end)

--- Get a list of invites for a channel.
-- @function getChannelInvites
-- @param channelId The ID of the channel to get invites for.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with the list of invites.
-- @usage exports.discord_rest:getChannelInvites("[channel ID]", "[bot token]"):next(function(invites) ... end)
-- @see https://discord.com/developers/docs/resources/channel#get-channel-invites
exports("getChannelInvites", function(channelId, botToken)
	return discordRest:getChannelInvites(channelId, botToken)
end)

--- Get a specific message from a channel.
-- @function getChannelMessage
-- @param channelId The ID of the channel.
-- @param messageId The ID of the message.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:getChannelMessage("[channel ID]", "[messageId]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#get-channel-message
exports("getChannelMessage", function(channelId, messageId, botToken)
	return discordRest:getChannelMessage(channelId, messageId, botToken)
end)

--- Get messages from a channel.
-- @function getChannelMessages
-- @param channelId The ID of the channel.
-- @param options Options to tailor the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:getChannelMessages("[channel ID]", {limit = 1}, "[bot token]"):next(function(messages) ... end)
-- @see https://discord.com/developers/docs/resources/channel#get-channel-messages
exports("getChannelMessages", function(channelId, options, botToken)
	return discordRest:getChannelMessages(channelId, options, botToken)
end)

--- Returns all pinned messages in the channel.
-- @function getPinnedMessages
-- @param channelId The ID of the channel to get pinned messages from.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which resolves with a list of pinned messages.
-- @usage exports.discord_rest:getPinnedMessages("[channel ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#get-pinned-messages
exports("getPinnedMessages", function(channelId, botToken)
	return discordRest:getPinnedMessages(channelId, botToken)
end)

--- Get a list of users that reacted to a message with a specific emoji.
-- @function getReactions
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to get reactions from.
-- @param emoji The emoji of the reaction.
-- @param options Options to tailor the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:getReactions("[channel ID]", "[message ID]", "💗", nil, "[bot token]"):next(function(users) ... end)
-- @see https://discord.com/developers/docs/resources/channel#get-reactions
exports("getReactions", function(channelId, messageId, emoji, options, botToken)
	return discordRest:getReactions(channelId, messageId, emoji, options, botToken)
end)

--- Adds a recipient to a Group DM using their access token.
-- @function groupDmAddRecipient
-- @param channelId The ID of the group DM channel.
-- @param userId The ID of the user to add.
-- @param params Parameters for adding the user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:groupDmAddRecipient("[channel ID]", "[user ID]", {access_token = "..."}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#group-dm-add-recipient
exports("groupDmAddRecipient", function(channelId, userId, params, botToken)
	return discordRest:groupDmAddRecipient(channelId, userId, params, botToken)
end)

--- Removes a recipient from a Group DM.
-- @function groupDmRemoveRecipient
-- @param channelId The ID of the group DM channel.
-- @param userId The ID of the user to remove.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:groupDmRemoveRecipient("[channel ID]", "[user ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#group-dm-remove-recipient
exports("groupDmRemoveRecipient", function(channelId, userId, botToken)
	return discordRest:groupDmRemoveRecipient(channelId, userId, botToken)
end)

--- Adds the current user to a thread.
-- @function joinThread
-- @param channelId The ID of the thread channel to join.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:joinThread("[channel ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#join-thread
exports("joinThread", function(channelId, botToken)
	return discordRest:joinThread(channelId, botToken)
end)

--- Removes the current user from a thread.
-- @function leaveThread
-- @param channelId The ID of the thread channel to leave.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:leaveThread("[channel ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#leave-thread
exports("leaveThread", function(channelId, botToken)
	return discordRest:leaveThread(channelId, botToken)
end)

--- Returns all active threads in the channel, including public and private threads.
-- @function listActiveThreads
-- @param channelId The ID of the channel to get a list of active threads for.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of information on active threads.
-- @usage exports.discord_rest:listActiveThreads("[channel ID]"):next(function(data) ... end)
-- @see https://discord.com/developers/docs/resources/channel#list-active-threads
exports("listActiveThreads", function(channelId, botToken)
	return discordRest:listActiveThreads(channelId, botToken)
end)

--- Returns archived threads in the channel that are private, and the user has joined.
-- @function listJoinedPrivateArchivedThreads
-- @param channelId The ID of the channel to get a list of private archived threads from.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a table of information on private archived threads.
-- @usage exports.discord_rest:listJoinedPrivateArchivedThreads("[channel ID]", {limit = 5}, "[bot token]"):next(function(data) ... end)
-- @see https://discord.com/developers/docs/resources/channel#list-joined-private-archived-threads
exports("listJoinedPrivateArchivedThreads", function(channelId, options, botToken)
	return discordRest:listJoinedPrivateArchivedThreads(channelId, options, botToken)
end)

--- Returns archived threads in the channel that are private.
-- @function listPrivateArchivedThreads
-- @param channelId The ID of the channel to get a list of private archived threads from.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a table of information on private archived threads.
-- @usage exports.discord_rest:listPrivateArchivedThreads("[channel ID]", {limit = 5}, "[bot token]"):next(function(data) ... end)
-- @see https://discord.com/developers/docs/resources/channel#list-private-archived-threads
exports("listPrivateArchivedThreads", function(channelId, options, botToken)
	return discordRest:listPrivateArchivedThreads(channelId, options, botToken)
end)

--- Returns archived threads in the channel that are public.
-- @function listPublicArchivedThreads
-- @param channelId The ID of the channel to get a list of public archived threads for.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a table of information on public archived threads.
-- @usage exports.discord_rest:listPublicArchivedThreads("[channel ID]", {limit = 5}, "[bot token]"):next(function(data) ... end)
-- @see https://discord.com/developers/docs/resources/channel#list-public-archived-threads
exports("listPublicArchivedThreads", function(channelId, options, botToken)
	return discordRest:listPublicArchivedThreads(channelId, options, botToken)
end)

--- Get a list of members of a thread.
-- @function listThreadMembers
-- @param channelId The ID of the thread channel.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of members of the thread.
-- @usage exports.discord_rest:listThreadMembers("[channel ID]", "[bot token]"):next(function(members) ... end)
-- @see https://discord.com/developers/docs/resources/channel#list-thread-members
exports("listThreadMembers", function(channelId, botToken)
	return discordRest:listThreadMembers(channelId, botToken)
end)

--- Update a channel's settings.
-- @function modifyChannel
-- @param channelId The ID of the channel.
-- @param channel The new channel settings.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:modifyChannel("[channel ID]", {name = "new-name"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#modify-channel
exports("modifyChannel", function(channelId, channel, botToken)
	return discordRest:modifyChannel(channelId, channel, botToken)
end)

--- Pin a message in a channel.
-- @function pinMessage
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to pin.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:pinMessage("[channel ID]", "[message ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#pin-message
exports("pinMessage", function(channelId, messageId, botToken)
	return discordRest:pinMessage(channelId, messageId, botToken)
end)

--- Removes another member from a thread.
-- @function removeThreadMember
-- @param channelId The ID of the thread channel.
-- @param userId The ID of the user to remove from the thread.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removeThreadMember("[channel ID]", "[user ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#remove-thread-member
exports("removeThreadMember", function(channelId, userId, botToken)
	return discordRest:removeThreadMember(channelId, userId, botToken)
end)

--- Creates a new thread from an existing message.
-- @function startThreadWithMessage
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to start the thread from.
-- @param params Parameters for the thread.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with the new thread channel.
-- @usage exports.discord_rest:startThreadWithMessage("[channel ID]", "[message ID]", {name = "New thread"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#start-thread-with-message
exports("startThreadWithMessage", function(channelId, messageId, params, botToken)
	return discordRest:startThreadWithMessage(channelId, messageId, params, botToken)
end)

--- Creates a new thread that is not connected to an existing message.
-- @function startThreadWithoutMessage
-- @param channelId The ID of the channel to create the thread in.
-- @param params Parameters for the thread.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with the new thread channel.
-- @usage exports.discord_rest:startThreadWithoutMessage("[channel ID]", {name = "New thread"}, "[bot token]"):next(function(channel) ... end)
-- @see https://discord.com/developers/docs/resources/channel#start-thread-without-message
exports("startThreadWithoutMessage", function(channelId, params, botToken)
	return discordRest:startThreadWithoutMessage(channelId, params, botToken)
end)

--- Post a typing indicator for the specified channel.
-- @function triggerTypingIndicator
-- @param channelId The ID of the channel to show the typing indicator in.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:triggerTypingIndicator("[channel ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#trigger-typing-indicator
exports("triggerTypingIndicator", function(channelId, botToken)
	return discordRest:triggerTypingIndicator(channelId, botToken)
end)

--- Unpin a message in a channel.
-- @function unpinMessage
-- @param channelId The ID of the channel containing the message.
-- @param messageId The ID of the message to unpin.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:unpinMessage("[channel ID]", "[message ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/channel#unpin-message
exports("unpinMessage", function(channelId, messageId, botToken)
	return discordRest:unpinMessage(channelId, messageId, botToken)
end)

--- Emoji
-- @section emoji

--- Create a new emoji for the guild.
-- @function createGuildEmoji
-- @param guildId The ID of the guild to create the emoji for.
-- @param params Parameters for the new emoji.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise whih is resolved with the new emoji.
-- @usage exports.discord_rest:createGuildEmoji("[guild ID]", {name = "emojiname", image = "data:image/jpeg;base64,..."}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/emoji#create-guild-emoji
exports("createGuildEmoji", function(guildId, params, botToken)
	return discordRest:createGuildEmoji(guildId, params, botToken)
end)

--- Delete the given emoji.
-- @function deleteGuildEmoji
-- @param guildId The ID of the guild to delete the emoji from.
-- @param emojiId The ID of the emoji to delete.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteGuildEmoji("[guild ID]", "[emoji ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/emoji#delete-guild-emoji
exports("deleteGuildEmoji", function(guildId, emojiId, botToken)
	return discordRest:deleteGuildEmoji(guildId, emojiId, botToken)
end)

--- Get information on a guild emoji.
-- @function getGuildEmoji
-- @param guildId The ID of the guild where the emoji is from.
-- @param emojiId The ID of the emoji to get information about.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the information about the emoji.
-- @usage exports.discord_rest:getGuildEmoji("[guild ID]", "[emoji ID]"):next(function(emoji) ... end)
-- @see https://discord.com/developers/docs/resources/emoji#get-guild-emoji
exports("getGuildEmoji", function(guildId, emojiId, botToken)
	return discordRest:getGuildEmoji(guildId, emojiId, botToken)
end)

--- Return a list of emoji for the given guild.
-- @function listGuildEmojis
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the list of emoji.
-- @usage exports.discord_rest:listGuildEmojis("[guild ID]", "[bot token]"):next(function(emojis) ... end)
-- @see https://discord.com/developers/docs/resources/emoji#list-guild-emojis
exports("listGuildEmojis", function(guildId, botToken)
	return discordRest:listGuildEmojis(guildId, botToken)
end)

--- Modify the given emoji.
-- @function modifyGuildEmoji
-- @param guildId The ID of the guild where the emoji is from.
-- @param emojiId The ID of the emoji to modify.
-- @param params Modified parameters for the emoji.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the updated emoji.
-- @usage exports.discord_rest:modifyGuildEmoji("[guild ID]", "[emoji ID]", {name = "newemojiname"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/emoji#modify-guild-emoji
exports("modifyGuildEmoji", function(guildId, emojiId, params, botToken)
	return discordRest:modifyGuildEmoji(guildId, emojiId, params, botToken)
end)

--- Guild
-- @section guild

--- Adds a user to the guild.
-- @function addGuildMember
-- @param guildId The ID of the guild to add the user to.
-- @param userId The ID of the user to add to the guild.
-- @param param Parameters for adding the user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:addGuildMember("[guild ID]", "[user ID]", {access_token = "..."}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#add-guild-member
exports("addGuildMember", function(guildId, userId, params, botToken)
	return discordRest:addGuildMember(guildId, userId, params, botToken)
end)

--- Adds a role to a guild member.
-- @function addGuildMemberRole
-- @param guildId The ID of the guild.
-- @param userId The ID of the user to add the role to.
-- @param roleId The ID of the role to add to the member.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:addGuildMemberRole("[guild ID]", "[user ID]", "[role ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#add-guild-member-role
exports("addGuildMemberRole", function(guildId, userId, roleId, botToken)
	return discordRest:addGuildMemberRole(guildId, userId, roleId, botToken)
end)

--- Begin a prune operation.
-- @function beginGuildPrune
-- @param guildId The ID of the guild to prune.
-- @param params Parameters for pruning.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the number of members that were pruned.
-- @usage exports.discord_rest:beginGuildPrune("[guild ID]", nil, "[bot token]"):next(function(pruned) ... end)
-- @see https://discord.com/developers/docs/resources/guild#begin-guild-prune
exports("beginGuildPrune", function(guildId, params, botToken)
	return discordRest:beginGuildPrune(guildId, params, botToken)
end)

--- Create a new guild.
-- @function createGuild
-- @param params Parameters for the new guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the new guild.
-- @usage exports.discord_rest:createGuild({name = "My Guild"})
-- @see https://discord.com/developers/docs/resources/guild#create-guild
exports("createGuild", function(params, botToken)
	return discordRest:createGuild(params, botToken)
end)

--- Create a guild ban, and optionally delete previous messages sent by the banned user.
-- @function createGuildBan
-- @param guildId The ID of the guild to create the ban for.
-- @param userId The ID of the user to ban.
-- @param params Parameters for the ban.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:createGuildBan("[guild ID]", "[user ID]", {reason = "Not following the rules"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#create-guild-ban
exports("createGuildBan", function(guildId, userId, params, botToken)
	return discordRest:createGuildBan(guildId, userId, params, botToken)
end)

--- Create a new guild channel.
-- @function createGuildChannel
-- @param guildId The ID of the guild to create the channel in.
-- @param params Parameters for the new channel.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the new channel.
-- @usage exports.discord_rest:createGuildChannel(["guild ID"], {name = "new-channel"}, "[bot token]"):next(function(channel) ... end)
-- @see https://discord.com/developers/docs/resources/guild#create-guild-channel
exports("createGuildChannel", function(guildId, params, botToken)
	return discordRest:createGuildChannel(guildId, params, botToken)
end)

--- Create a new role for the guild.
-- @function createGuildRole
-- @param guildId The ID of the guild.
-- @param params Parameters for the new role.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the new role.
-- @usage exports.discord_rest:createGuildRole("[guild ID]", {name = "Moderator", ...}, "[bot token]"):next(function(role) ... end)
-- @see https://discord.com/developers/docs/resources/guild#create-guild-role
exports("createGuildRole", function(guildId, params, botToken)
	return discordRest:createGuildRole(guildId, params, botToken)
end)

--- Delete a guild permanently.
-- @function deleteGuild
-- @param guildId The ID of the guild to delete.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteGuild("[guild ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#delete-guild
exports("deleteGuild", function(guildId, botToken)
	return discordRest:deleteGuild(guildId, botToken)
end)

--- Delete an integration for a guild.
-- @function deleteGuildIntegration
-- @param guildId The ID of the guild
-- @param integrationId The ID of the integration to delete.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteGuildIntegration("[guild ID]", "[integration ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#delete-guild-integration
exports("deleteGuildIntegration", function(guildId, integrationId, botToken)
	return discordRest:deleteGuildIntegration(guildId, integrationId, botToken)
end)

--- Delete a guild role.
-- @function deleteGuildRole
-- @param guildId The ID of the guild.
-- @param roleId The ID of the role that will be deleted.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteGuildRole("[guild ID]", "[role ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#delete-guild-role
exports("deleteGuildRole", function(guildId, roleId, botToken)
	return discordRest:deleteGuildRole(guildId, roleId, botToken)
end)

--- Get info for a given guild.
-- @function getGuild
-- @param guildId The ID of the guild.
-- @param withCounts Whether to include approximate member and presence counts in the returned info.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the guild info.
-- @usage exports.discord_rest:getGuild("[guild ID]"):next(function(guild) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild
exports("getGuild", function(guildId, withCounts, botToken)
	return discordRest:getGuild(guildId, withCounts, botTokens)
end)

--- Return info on a ban for a specific user in a guild.
-- @function getGuildBan
-- @param guildId The ID of the guild.
-- @param userId The ID of the banned user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the ban info.
-- @usage exports.discord_rest:getGuildBan("[guild ID]", "[user ID]", "[bot token]"):next(function(ban) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-ban
exports("getGuildBan", function(guildId, userId, botToken)
	return discordRest:getGuildBan(guildId, userId, botToken)
end)

--- Get a list of bans for a guild.
-- @function getGuildBans
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of bans.
-- @usage exports.discord_get:getGuildBans("[guild ID]", "[bot token]"):next(function(bans) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-bans
exports("getGuildBans", function(guildId, botToken)
	return discordRest:getGuildBans(guildId, botToken)
end)

--- Get a list of guild channels.
-- @function getGuildChannels
-- @param guildId The ID of the guild to get a list of channels for.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the list of channels.
-- @usage exports.discord_rest:getGuildChannels("[guild ID]", "[bot token]"):next(function(channels) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-channels
exports("getGuildChannels", function(guildId, botToken)
	return discordRest:getGuildChannels(guildId, botToken)
end)

--- Get a list of integrations for a guild.
-- @function getGuildIntegrations
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the list of integrations.
-- @usage exports.discord_rest:getGuildIntegrations("[guild ID]", "[bot token]"):next(function(integrations) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-integrations
exports("getGuildIntegrations", function(guildId, botToken)
	return discordRest:getGuildIntegrations(guildId, botToken)
end)

--- Get a list of invites for a guild.
-- @function getGuildInvites
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the list of invites.
-- @usage exports.discord_rest:getGuildInvites("[guild ID]", "[bot token]"):next(function(invites) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-invites
exports("getGuildInvites", function(guildId, botToken)
	return discordRest:getGuildInvites(guildId, botToken)
end)

--- Get info for a member of a guild.
-- @function getGuildMember
-- @param guildId The ID of the guild.
-- @param userId The ID of the user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with the info of the member if they are in the guild.
-- @usage exports.discord_rest:getGuildMember("[guild ID]", "[user ID]", "[bot token]"):next(function(member) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-member
exports("getGuildMember", function(guildId, userId, botToken)
	return discordRest:getGuildMember(guildId, userId, botToken)
end)

--- Get preview information for a guild.
-- @function getGuildPreview
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the preview info for the guild.
-- @usage exports.discord_rest:getGuildPreview("[guild ID]", "[bot token]"):next(function(preview) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-preview
exports("getGuildPreview", function(guildId, botToken)
	return discordRest:getGuildPreview(guildId, botToken)
end)

--- Get the number of members that would be removed in a prune operation.
-- @function getGuildPruneCount
-- @param guildId The ID of the guild that would be pruned.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the number of users that would be pruned.
-- @usage exports.discord_rest:getGuildPruneCount("[guild ID]", nil, "[bot token]"):next(function(pruned) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-prune-count
exports("getGuildPruneCount", function(guildId, options, botToken)
	return discordRest:getGuildPruneCount(guildId, options, botToken)
end)

--- Get a list of roles for a guild.
-- @function getGuildRoles
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the list of roles.
-- @usage exports.discord_rest:getGuildRoles("[guild ID]"):next(function(roles) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-roles
exports("getGuildRoles", function(guildId, botToken)
	return discordRest:getGuildRoles(guildId, botToken)
end)

--- Get the vanity URL for a guild.
-- @function getGuildVanityUrl
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the vanity URL.
-- @usage exports.discord_rest:getGuildVanityUrl("[guild ID]", "[bot token]"):next(function(vanityUrl) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-vanity-url
exports("getGuildVanityUrl", function(guildId, botToken)
	return discordRest:getGuildVanityUrl(guildId, botToken)
end)

--- Get a list of voice regions for a guild.
-- @function getGuildVoiceRegions
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the list of voice regions.
-- @usage exports.discord_rest:getGuildVoiceRegions("[guild ID]", "[bot token]"):next(function(regions) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-voice-regions
exports("getGuildVoiceRegions", function(guildId, botToken)
	return discordRest:getGuildVoiceRegions(guildId, botToken)
end)

--- Get the welcome screen for a guild.
-- @function getGuildWelcomeScreen
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the welcome screen.
-- @usage exports.discord_rest:getGuildWelcomeScreen("[guild ID]", "[bot token]"):next(function(welcomeScreen) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-welcome-screen
exports("getGuildWelcomeScreen", function(guildId, botToken)
	return discordRest:getGuildWelcomeScreen(guildId, botToken)
end)

--- Get the widget for a guild.
-- @function getGuildWidget
-- @param guildId The ID of the guild.
-- @return A new promise which is resolved with the widget.
-- @usage exports.discord_rest:getGuildWidget("[guild ID]"):next(function(widget) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-widget
exports("getGuildWidget", function(guildId)
	return discordRest:getGuildWidget(guildId)
end)

--[[
This method can't be implemented as PerformHttpRequest does not work with binary data.

--- Get the widget image for a guild.
-- @function getGuildWidgetImage
-- @param guildId The ID of the guild.
-- @param style Style of the widget image returned.
-- @return A new promise which is resolved with the widget image.
-- @usage exports.discord_rest:getGuildWidgetImage("[guild ID]", "shield"):next(function(image) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-widget-image
exports("getGuildWidgetImage", function(guildId, style)
	return discordRest:getGuildWidgetImage(guildId, style)
end)
]]

--- Get guild widget settings.
-- @function getGuildWidgetSettings
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the widget settings.
-- @usage exports.discord_rest:getGuildWidgetSettings("[guild ID]", "[bot token]"):next(function(settings) ... end)
-- @see https://discord.com/developers/docs/resources/guild#get-guild-widget-settings
exports("getGuildWidgetSettings", function(guildId, botToken)
	return discordRest:getGuildWidgetSettings(guildId, botToken)
end)

--- Returns all active threads in the guild, including public and private threads.
-- @function listActiveGuildThreads
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the lists of threads and thread members.
-- @usage exports.discord_rest:listActiveGuildThreads("[guild ID]", "[bot token]"):next(function(data) ... end)
-- @see https://discord.com/developers/docs/resources/guild#list-active-threads
exports("listActiveGuildThreads", function(guildId, botToken)
	return discordRest:listActiveGuildThreads(guildId, botToken)
end)

--- Get a list of members in a guild.
-- @function listGuildMembers
-- @param guildId The ID of the guild to get a list of members for.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of guild members.
-- @usage exports.discord_rest:listGuildMembers("[guild ID]", {limit = 5}, "[bot token]"):next(function(members) ... end)
-- @see https://discord.com/developers/docs/resources/guild#list-guild-members
exports("listGuildMembers", function(guildId, options, botToken)
	return discordRest:listGuildMembers(guildId, options, botToken)
end)

--- Modifies the nickname of the current user in a guild.
-- @function modifyCurrentUserNick
-- @param guildId The ID of the guild.
-- @param nick The value to set the user's nickname to.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:modifyCurrentUserNick("[guild ID]", "New nickname")
-- @see https://discord.com/developers/docs/resources/guild#modify-current-user-nick
exports("modifyCurrentUserNick", function(guildId, nick, botToken)
	return discordRest:modifyCurrentUserNick(guildId, nick, botToken)
end)

--- Updates the current user's voice state.
-- @function modifyCurrentUserVoiceState
-- @param guildId The ID of the guild to modify voice state in.
-- @param params Parameters for modifying the voice state.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:modifyCurrentUserVoiceState("[guild ID]", {...}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-current-user-voice-state
exports("modifyCurrentUserVoiceState", function(guildId, params, botToken)
	return discordRest:modifyCurrentUserVoiceState(guildId, params, botToken)
end)

--- Modify a guild's settings.
-- @function modifyGuild
-- @param guildId The ID of the guild to modify.
-- @param settings The modified settings for the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the updated guild.
-- @usage exports.discord_rest:modifyGuild("[guild ID]", {name = "New guild name"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-guild
exports("modifyGuild", function(guildId, settings, botToken)
	return discordRest:modifyGuild(guildId, settings, botToken)
end)

--- Modify the positions of a set of channels.
-- @function modifyGuildChannelPositions
-- @param guildId The ID of the guild containing the channels.
-- @param channelPositions A set of channel position parameters.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:modifyGuildChannelPositions("[guild ID]", {{id = "[channel 1 ID]", position = 2}, {"[channel 2 ID]", position = 1}}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-guild-channel-positions
exports("modifyGuildChannelPositions", function(guildId, channelPositions, botToken)
	return discordRest:modifyGuildChannelPositions(guildId, channelPositions, botToken)
end)

--- Modify attributes of a guild member.
-- @function modifyGuildMember
-- @param guildId The ID of the guild.
-- @param userId The ID of the member to modify.
-- @param params The parameters to modify.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the modified guild member.
-- @usage exports.discord_rest:modifyGuildMember("[guild ID]", "[user ID]", {nick = "New nickname"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-guild-member
exports("modifyGuildMember", function(guildId, userId, params, botToken)
	return discordRest:modifyGuildMember(guildId, userId, params, botToken)
end)

--- Modify a guild role.
-- @function modifyGuildRole
-- @param guildId The ID of the guild.
-- @param roleId The ID of the role to modify.
-- @param params Parameters for modifications to the role.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the modified role.
-- @usage exports.discord_rest:modifyGuildRole("[guild ID]", "[role ID]", {name = "New role name"}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-guild-role
exports("modifyGuildRole", function(guildId, roleId, params, botToken)
	return discordRest:modifyGuildRole(guildId, roleId, params, botToken)
end)

--- Modify the positions of a set of roles for a guild.
-- @function modifyGuildRolePositions
-- @param guildId The ID of the guild.
-- @param params A list of roles and their new positions.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of all guild roles.
-- @usage exports.discord_rest:modifyGuildRolePositions("[guild ID]", {{"[role ID 1]", 2}, {"[role ID 2]", 3}, ...}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-guild-role-positions
exports("modifyGuildRolePositions", function(guildId, params, botToken)
	return discordRest:modifyGuildRolePositions(guildId, params, botToken)
end)

--- Modify a guild's welcome screen.
-- @function modifyGuildWelcomeScreen
-- @param guildId The ID of the guild.
-- @param params Parameters for modifying the welcome screen.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the updated welcome screen.
-- @usage exports.discord_rest:modifyGuildWelcomeScreen("[guild ID]", {enabled = true}, "[bot token]"):next(function(welcomeScreen) ... end)
-- @see https://discord.com/developers/docs/resources/guild#modify-guild-welcome-screen
exports("modifyGuildWelcomeScreen", function(guildId, params, botToken)
	return discordRest:modifyGuildWelcomeScreen(guildId, params, botToken)
end)

--- Modify a guild widget.
-- @function modifyGuildWidget
-- @param guildId The ID of the guild.
-- @param widget The modified widget attributes.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the updated widget.
-- @usage exports.discord_rest:modifyGuildWidget("[guild ID]", {...}, "[bot token]"):next(function(widget) ... end)
-- @see https://discord.com/developers/docs/resources/guild#modify-guild-widget
exports("modifyGuildWidget", function(guildId, widget, botToken)
	return discordRest:modifyGuildWidget(guildId, widget, botToken)
end)

--- Updates another user's voice state.
-- @function modifyUserVoiceState
-- @param guildId The ID of the guild.
-- @param userId The ID of the user.
-- @param params Parameters for modifying the voice state.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:modifyUserVoiceState("[guild ID]", "[user ID]", {...}, "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#modify-user-voice-state
exports("modifyUserVoiceState", function(guildId, userId, params, botToken)
	return discordRest:modifyUserVoiceState(guildId, userId, params, botToken)
end)

--- Remove the ban for a user.
-- @function removeGuildBan
-- @param guildId The ID of the guild to remove the ban for the user from.
-- @param userId The ID of the user to unban.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removeGuildBan("[guild ID]", "[user ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#remove-guild-ban
exports("removeGuildBan", function(guildId, userId, botToken)
	return discordRest:removeGuildBan(guildId, userId, botToken)
end)

--- Remove a member from a guild.
-- @function removeGuildMember
-- @param guildId The ID of the guild to remove the member from.
-- @param userId The ID of the member to remove from the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removeGuildMember("[guild ID]", "[user ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#remove-guild-member
exports("removeGuildMember", function(guildId, userId, botToken)
	return discordRest:removeGuildMember(guildId, userId, botToken)
end)

--- Removes a role from a guild member.
-- @function removeGuildMemberRole
-- @param guildId The ID of the guild.
-- @param userId The ID of the user to remove the role from.
-- @param roleId The ID of the role to remove from the member.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removeGuildMemberRole("[guild ID]", "[user ID]", "[role ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/guild#remove-guild-member-role
exports("removeGuildMemberRole", function(guildId, userId, roleId, botToken)
	return discordRest:removeGuildMemberRole(guildId, userId, roleId, botToken)
end)

--- Get a list of guild members whose username or nickname starts with a provided string.
-- @function searchGuildMembers
-- @param guildId The ID of the guild to search in.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of guild members that matched the query.
-- @usage exports.discord_rest:searchGuildMembers("[guild ID]", {query = "Po"}, "[bot token]"):next(function(members) ... end)
-- @see https://discord.com/developers/docs/resources/guild#search-guild-members
exports("searchGuildMembers", function(guildId, options, botToken)
	return discordRest:searchGuildMembers(guildId, options, botToken)
end)

--- Invite
-- @section invite

--- Delete an invite.
-- @function deleteInvite
-- @param inviteCode The code of the invite that will be deleted.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteInvite("[invite code]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/invite#delete-invite
exports("deleteInvite", function(inviteCode, botToken)
	return discordRest:deleteInvite(inviteCode, botToken)
end)

--- Return info for an invite.
-- @function getInvite
-- @param inviteCode The code of the invite.
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the invite info.
-- @usage exports.discord_rest:getInvite("[invite code]", {with_expiration = true}, "[bot token]"):next(function(invite) ... end)
-- @see https://discord.com/developers/docs/resources/invite#get-invite
exports("getInvite", function(inviteCode, options, botToken)
	return discordRest:getInvite(inviteCode, options, botToken)
end)

--- User
-- @section user

--- Create a new DM channel with a user.
-- @function createDm
-- @param recipientId The ID of the user to start the DM with.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that is resolved with the DM channel information.
-- @usage exports.discord_rest:createDm("[recipient ID]", "[bot token]"):next(function(channel) ... end)
-- @see https://discord.com/developers/docs/resources/user#create-dm
exports("createDm", function(recipientId, botToken)
	return discordRest:createDm(recipientId, botToken)
end)

--- Get the current user's information.
-- @function getCurrentUser
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the user's information.
-- @usage exports.discord_rest:getCurrentUser("[bot token]"):next(function(user) ... end)
-- @see https://discord.com/developers/docs/resources/user#get-current-user
exports("getCurrentUser", function(botToken)
	return discordRest:getCurrentUser(botToken)
end)

--- Get the current user's guilds.
-- @function getCurrentUserGuilds
-- @param options Options for the query.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of guilds.
-- @usage exports.discord_rest:getCurrentUserGuilds({limit = 10}, "[bot token]"):next(function(guilds) ... end)
-- @see https://discord.com/developers/docs/resources/user#get-current-user-guilds
exports("getCurrentUserGuilds", function(options, botToken)
	return discordRest:getCurrentUserGuilds(options, botToken)
end)

--- Get user information.
-- @function getUser
-- @param userId The ID of the user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:getUser("[user ID]", "[bot token]"):next(function(user) ... end)
-- @see https://discord.com/developers/docs/resources/user#get-user
exports("getUser", function(userId, botToken)
	return discordRest:getUser(userId, botToken)
end)

--- Get a list of the current user's connections.
-- @function getUserConnections
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of connections.
-- @usage exports.discord_rest:getUserConnections("[bot token]"):next(function(connections) ... end)
-- @see https://discord.com/developers/docs/resources/user#get-user-connections
exports("getUserConnections", function(botToken)
	return discordRest:getUserConnections(botToken)
end)

--- Leave a guild.
-- @function leaveGuild
-- @param guildId The ID of the guild to leave.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:leaveGuild("[guild ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/user#leave-guild
exports("leaveGuild", function(guildId, botToken)
	return discordRest:leaveGuild(guildId, botToken)
end)

--- Modify the requester's user account settings.
-- @function modifyCurrentUser
-- @param params Parameters to modify.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the modified user.
-- @usage exports.discord_rest:modifyCurrentUser({username = "New Username"}, "[bot token]"):next(function(user) ... end)
-- @see https://discord.com/developers/docs/resources/user#modify-current-user
exports("modifyCurrentUser", function(params, botToken)
	return discordRest:modifyCurrentUser(params, botToken)
end)

--- Webhook
-- @section Webhook

--- Delete a webhook.
-- @function deleteWebhook
-- @param webhookId The ID of the webhook.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deleteWebhook("[webhook ID]", "[bot token]")
-- @see https://discord.com/developers/docs/resources/webhook#delete-webhook
exports("deleteWebhook", function(webhookId, botToken)
	return discordRest:deleteWebhook(webhookId, botToken)
end)

--- Deletes a message that was created by the webhook.
-- @function deleteWebhookMessage
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @param messageId The ID of the message.
-- @return A new promise.
-- @usage exports.discord_rest:deleteWebhookMessage("[webhook ID]", "[webhook token]", "[message ID]")
-- @see https://discord.com/developers/docs/resources/webhook#delete-webhook-message
exports("deleteWebhookMessage", function(webhookId, webhookToken, messageId)
	return discordRest:deleteWebhookMessage(webhookId, webhookToken, messageId)
end)

--- Delete a webhook, using its token for authorization instead of a bot token.
-- @function deleteWebhookWithToken
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @return A new promise.
-- @usage exports.discord_rest:deleteWebhookWithToken("[webhook ID]", "[webhook token]")
-- @see https://discord.com/developers/docs/resources/webhook#delete-webhook-with-token
exports("deleteWebhookWithToken", function(webhookId, webhookToken)
	return discordRest:deleteWebhookWithToken(webhookId, webhookToken)
end)

--- Delete a webhook, using its full URL for authorization instead of a bot token.
-- @function deleteWebhookWithUrl
-- @param url The URL of the webhook.
-- @return A new promise.
-- @usage exports.discord_rest:deleteWebhookWithUrl("https://discord.com/api/webhooks/[webhook ID]/[webhook token]")
-- @see https://discord.com/developers/docs/resources/webhook#delete-webhook-with-token
exports("deleteWebhookWithUrl", function(url)
	return discordRest:deleteWebhookWithUrl(url)
end)

--- Edits a previously-sent webhook message from the same token.
-- @function editWebhookMessage
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @param messageId The ID of the message.
-- @param params Parameters to modify.
-- @return A new promise which is resolved with the updated message.
-- @usage exports.discord_rest:editWebhookMessage("[webhook ID]", "[webhook token]", "[message ID]", {content = "New content"}):next(function(message) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#edit-webhook-message
exports("editWebhookMessage", function(webhookId, webhookToken, messageId, params)
	return discordRest:editWebhookMessage(webhookId, webhookToken, messageId, params)
end)

--- Execute a GitHub webhook.
-- @function executeGitHubCompatibleWebhook
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @param data The data to send.
-- @param options Options for the webhook execution.
-- @return A new promise.
-- @usage exports.discord_rest:executeGitHubCompatibleWebhook("[webhook ID]", "[webhook token]", {...})
-- @see https://discord.com/developers/docs/resources/webhook#execute-githubcompatible-webhook
exports("executeGitHubCompatibleWebhook", function(webhookId, webhookToken, data, options)
	return discordRest:executeGitHubCompatibleWebhook(webhookId, webhookToken, data, options)
end)

--- Execute a GitHub webhook, using the full URL.
-- @function executeGitHubCompatibleWebhookUrl
-- @param url The URL of the webhook.
-- @param data The data to send.
-- @param options Options for the webhook execution.
-- @return A new promise.
-- @usage exports.discord_rest:executeGitHubCompatibleWebhookUrl("https://discord.com/api/webhooks/[webhook ID]/[webhook token]/github", {...})
-- @see https://discord.com/developers/docs/resources/webhook#execute-githubcompatible-webhook
exports("executeGitHubCompatibleWebhookUrl", function(url, data, options)
	return discordRest:executeGitHubCompatibleWebhookUrl(url, data, options)
end)

--- Execute a Slack webhook.
-- @function executeSlackCompatibleWebhook
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @param data The data to send.
-- @param options Options for the webhook execution.
-- @return A new promise.
-- @usage exports.discord_rest:executeSlackCompatibleWebhook("[webhook ID]", "[webhook token]", {text = "hello"})
-- @see https://discord.com/developers/docs/resources/webhook#execute-slackcompatible-webhook
exports("executeSlackCompatibleWebhook", function(webhookId, webhookToken, data, options)
	return discordRest:executeSlackCompatibleWebhook(webhookId, webhookToken, data, options)
end)

--- Execute a Slack webhook, using the full URL.
-- @function executeSlackCompatibleWebhookUrl
-- @param url The webhook URL.
-- @param data The data to send.
-- @param options Options for the webhook execution.
-- @return A new promise.
-- @usage exports.discord_rest:executeSlackCompatibleWebhookUrl("https://discord.com/api/webhooks/[webhook ID]/[webhook token]/slack", {text = "hello"})
-- @see https://discord.com/developers/docs/resources/webhook#execute-slackcompatible-webhook
exports("executeSlackCompatibleWebhookUrl", function(url, data, options)
	return discordRest:executeSlackCompatibleWebhookUrl(url, data, options)
end)

--- Execute a webhook.
-- @function executeWebhook
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token for the webhook.
-- @param data The data to send.
-- @param options Options for the webhook execution.
-- @return A new promise.
-- @usage exports.discord_rest:executeWebhook("[webhook ID]", "[webhook token]", {content = "Hello, world!"})
-- @see https://discord.com/developers/docs/resources/webhook#execute-webhook
exports("executeWebhook", function(webhookId, webhookToken, data, options)
	return discordRest:executeWebhook(webhookId, webhookToken, data, options)
end)

--- Execute a webhook, using the full URL.
-- @function executeWebhookUrl
-- @param url The webhook URL.
-- @param data The data to send.
-- @param options Options for the webhook execution.
-- @return A new promise.
-- @usage exports.discord_rest:executeWebhookUrl("https://discord.com/api/webhooks/[webhook ID]/[webhook token]", {content = "Hello, world!"})
-- @see https://discord.com/developers/docs/resources/webhook#execute-webhook
exports("executeWebhookUrl", function(url, data, options)
	return discordRest:executeWebhookUrl(url, data, options)
end)

--- Get a list of webhooks for a channel.
-- @function getChannelWebhooks
-- @param channelId The ID of the channel.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of webhooks.
-- @usage exports.discord_rest:getChannelWebhooks("[channel ID]", "[bot token]"):next(function(webhooks) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#get-channel-webhooks
exports("getChannelWebhooks", function(channelId, botToken)
	return discordRest:getChannelWebhooks(channelId, botToken)
end)

--- Get a list of webhooks for a guild.
-- @function getGuildWebhooks
-- @param guildId The ID of the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with a list of webhooks.
-- @usage exports.discord_rest:getGuildWebhooks("[guild ID]", "[bot token]"):next(function(webhooks) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#get-guild-webhooks
exports("getGuildWebhooks", function(guildId, botToken)
	return discordRest:getGuildWebhooks(guildId, botToken)
end)

--- Get information for a webhook.
-- @function getWebhook
-- @param webhookId The ID of the webhook.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the webhook.
-- @usage exports.discord_rest:getWebhook("[webhook ID]", "[bot token]"):next(function(webhook) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#get-webhook
exports("getWebhook", function(webhookId, botToken)
	return discordRest:getWebhook(webhookId, botToken)
end)

--- Returns a previously-sent webhook message from the same token.
-- @function getWebhookMessage
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @param messageId The ID of the message.
-- @return A new promise which is resolved with the message.
-- @usage exports.discord_rest:getWebhookMessage("[webhook ID]", "[webhook token]", "[message ID]"):next(function(message) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#get-webhook-message
exports("getWebhookMessage", function(webhookId, webhookToken, messageId)
	return discordRest:getWebhookMessage(webhookId, webhookToken, messageId)
end)

--- Get information for a webhook, using its token for authorization instead of a bot token.
-- @function getWebhookWithToken
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @return A new promise which is resolved with the webhook.
-- @usage exports.discord_rest:getWebhookWithToken("[webhook ID]", "[webhook token]"):next(function(webhook) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#get-webhook-with-token
exports("getWebhookWithToken", function(webhookId, webhookToken)
	return discordRest:getWebhookWithToken(webhookId, webhookToken)
end)

--- Get information for a webhook, using its full URL for authorization instead of a bot token.
-- @function getWebhookWithUrl
-- @param url The webhook URL.
-- @return A new promise which is resolved with the webhook.
-- @usage exports.discord_rest:getWebhookWithUrl("https://discord.com/api/webhooks/[webhook ID]/[webhook token]"):next(function(webhook) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#get-webhook-with-token
exports("getWebhookWithUrl", function(url)
	return discordRest:getWebhookWithUrl(url)
end)

--- Modify a webhook.
-- @function modifyWebhook
-- @param webhookId The ID of the webhook.
-- @param params Parameters to modify.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the updated webhook.
-- @usage exports.discord_rest:modifyWebhook("[webhook ID]", {name = "New name"}, "[bot token]"):next(function(webhook) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#modify-webhook
exports("modifyWebhook", function(webhookId, params, botToken)
	return discordRest:modifyWebhook(webhookId, params, botToken)
end)

--- Modify a webhook, using its token for authorization instead of a bot token.
-- @function modifyWebhookWithToken
-- @param webhookId The ID of the webhook.
-- @param webhookToken The token of the webhook.
-- @param params Parameters to modify.
-- @return A new promise which is resolved with the updated webhook.
-- @usage exports.discord_rest:modifyWebhookWithToken("[webhook ID]", "[webhook token]", {name = "New name"}):next(function(webhook) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#modify-webhook-with-token
exports("modifyWebhookWithToken", function(webhookId, webhookToken, params)
	return discordRest:modifyWebhookWithToken(webhookId, webhookToken, params)
end)

--- Modify a webhook, using its full URL for authorization instead of a bot token.
-- @function modifyWebhookWithUrl
-- @param url The URL of the webhook.
-- @param params Parameters to modify.
-- @return A new promise which is resolved with the updated webhook.
-- @usage exports.discord_rest:modifyWebhookWithUrl("https://discord.com/api/webhooks/[webhook ID]/[webhook token]", {name = "New name"}):next(function(webhook) ... end)
-- @see https://discord.com/developers/docs/resources/webhook#modify-webhook-with-token
exports("modifyWebhookWithUrl", function(url, params)
	return discordRest:modifyWebhookWithUrl(url, params)
end)

--- Player.
-- Wrapper functions that allow you to use a player's server ID in place of a Discord user ID.
-- @section player

--- Adds a guild role to a player.
-- @function addGuildMemberRoleToPlayer
-- @param guildId The ID of the guild.
-- @param player The server ID of the player to add the role to.
-- @param roleId The ID of the role to add to the member.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:addGuildMemberRoleToPlayer("[guild ID]", 1, "[role ID]", "[bot token]")
-- @see addGuildMemberRole
exports("addGuildMemberRoleToPlayer", function(guildId, player, roleId, botToken)
        return discordRest:addGuildMemberRoleToPlayer(guildId, player, roleId, botToken)
end)

--- Adds a player to a guild.
-- @function addPlayerToGuild
-- @param guildId The ID of the guild to add the user to.
-- @param player The server ID of the player to add to the guild.
-- @param params Parameters for adding the user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:addPlayerToGuild("[guild ID]", 1, {access_token = "..."}, "[bot token]")
-- @see addGuildMember
exports("addPlayerToGuild", function(guildId, player, params, botToken)
        return discordRest:addPlayerToGuild(guildId, player, params, botToken)
end)

--- Adds a player to a thread.
-- @function addPlayerToThread
-- @param channelId The ID of the thread channel.
-- @param player The server ID of the player to add to the thread.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:addPlayerToThread("[channel ID]", 1, "[bot token]")
-- @see addThreadMember
exports("addPlayerToThread", function(channelId, player, botToken)
        return discordRest:addPlayerToThread(channelId, player, botToken)
end)

--- Create a guild ban for a player.
-- @function createGuildBanForPlayer
-- @param guildId The ID of the guild to create the ban for.
-- @param player The server ID of the player to ban.
-- @param params Parameters for the ban.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:createGuildBanForPlayer("[guild ID]", 1, {reason = "Not following the rules"}, "[bot token]")
-- @see createGuildBan
exports("createGuildBanForPlayer", function(guildId, player, params, botToken)
        return discordRest:createGuildBanForPlayer(guildId, player, params, botToken)
end)

--- Remove a player's reaction from a message.
-- @function deletePlayerReaction
-- @param channelId The ID of the channel containing the message.
-- @param messageId The message to remove the reaction from.
-- @param emoji The emoji of the reaction to remove.
-- @param player The server ID of the player whose reaction will be removed.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:deletePlayerReaction("[channel ID]", "[message ID]", "💗", 1, "[bot token]")
-- @see deleteUserReaction
exports("deletePlayerReaction", function(channelId, messageId, emoji, player, botToken)
        return discordRest:deletePlayerReaction(channelId, messageId, emoji, player, botToken)
end)

--- Return info on a ban for a player in a guild.
-- @function getGuildBanForPlayer
-- @param guildId The ID of the guild.
-- @param player The server ID of the banned player.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the ban info.
-- @usage exports.discord_rest:getGuildBanForPlayer("[guild ID]", 1, "[bot token]"):next(function(ban) ... end)
-- @see getGuildBan
exports("getGuildBanForPlayer", function(guildId, player, botToken)
        return discordRest:getGuildBanForPlayer(guildId, player, botToken)
end)

--- Get guild membership info for a player.
-- @function getGuildMemberForPlayer
-- @param guildId The ID of the guild.
-- @param player The server ID of the player.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise that resolves with the info of the member if they are in the guild.
-- @usage exports.discord_rest:getGuildMemberForPlayer("[guild ID]", 1, "[bot token]"):next(function(member) ... end)
-- @see getGuildMember
exports("getGuildMemberForPlayer", function(guildId, player, botToken)
        return discordRest:getGuildMemberForPlayer(guildId, player, botToken)
end)

--- Get user information for a player.
-- @function getUserForPlayer
-- @param player The server ID of the player.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:getUserForPlayer(1, "[bot token]"):next(function(user) ... end)
-- @see getUser
exports("getUserForPlayer", function(player, botToken)
        return discordRest:getUserForPlayer(player, botToken)
end)

--- Get the Discord user ID of a player.
-- @function getUserId
-- @param player The server ID of the player.
-- @return A new promise which is resolved with the player's Discord user ID, if they have one.
-- @usage exports.discord_rest:getUserId(1):next(function(userId) ... end)
exports("getUserId", function(player)
        return discordRest:getUserId(player)
end)

--- Adds a player to a Group DM.
-- @function groupDmAddPlayer
-- @param channelId The ID of the group DM channel.
-- @param player The server ID of the player to add.
-- @param params Parameters for adding the user.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:groupDmAddPlayer("[channel ID]", 1, {access_token = "..."}, "[bot token]")
-- @see groupDmAddRecipient
exports("groupDmAddPlayer", function(channelId, player, params, botToken)
        return discordRest:groupDmAddPlayer(channelId, player, params, botToken)
end)

--- Removes a player from a Group DM.
-- @function groupDmRemovePlayer
-- @param channelId The ID of the group DM channel.
-- @param player The server ID of the player to remove.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:groupDmRemovePlayer("[channel ID]", 1, "[bot token]")
-- @see groupDmRemoveRecipient
exports("groupDmRemovePlayer", function(channelId, player, botToken)
        return discordRest:groupDmRemovePlayer(channelId, player, botToken)
end)

--- Modify guild membership attributes of a player.
-- @function modifyGuildMemberForPlayer
-- @param guildId The ID of the guild.
-- @param player The server ID of the player.
-- @param params The parameters to modify.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise which is resolved with the modified guild member.
-- @usage exports.discord_rest:modifyGuildMemberForPlayer("[guild ID]", 1, {nick = "New nickname"}, "[bot token]")
-- @see modifyGuildMember
exports("modifyGuildMemberForPlayer", function(guildId, player, params, botToken)
        return discordRest:modifyGuildMemberForPlayer(guildId, player, params, botToken)
end)

--- Updates a player's voice state.
-- @function modifyPlayerVoiceState
-- @param guildId The ID of the guild.
-- @param player The server ID of the player.
-- @param params Parameters for modifying the voice state.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:modifyPlayerVoiceState("[guild ID]", 1, {...}, "[bot token]")
-- @see modifyUserVoiceState
exports("modifyPlayerVoiceState", function(guildId, player, params, botToken)
	return discordRest:modifyPlayerVoiceState(guildId, player, params, botToken)
end)

--- Remove a guild ban for a player.
-- @function removeGuildBanForPlayer
-- @param guildId The ID of the guild to remove the ban for the user from.
-- @param player The server ID of the user to unban.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removeGuildBanForPlayer("[guild ID]", 1, "[bot token]")
-- @see removeGuildBan
exports("removeGuildBanForPlayer", function(guildId, player, botToken)
        return discordRest:removeGuildBanForPlayer(guildId, player, botToken)
end)

--- Removes a guild role from a player.
-- @function removeGuildMemberRoleFromPlayer
-- @param guildId The ID of the guild.
-- @param player The server ID of the player to remove the role from.
-- @param roleId The ID of the role to remove from the member.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removeGuildMemberRoleFromPlayer("[guild ID]", 1, "[role ID]", "[bot token]")
-- @see removeGuildMemberRole
exports("removeGuildMemberRoleFromPlayer", function(guildId, player, roleId, botToken)
        return discordRest:removeGuildMemberRoleFromPlayer(guildId, player, roleId, botToken)
end)

--- Remove a player from a guild.
-- @function removePlayerFromGuild
-- @param guildId The ID of the guild to remove the member from.
-- @param player The server ID of the player to remove from the guild.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removePlayerFromGuild("[guild ID]", 1, "[bot token]")
-- @see removeGuildMember
exports("removePlayerFromGuild", function(guildId, player, botToken)
        return discordRest:removePlayerFromGuild(guildId, player, botToken)
end)

--- Remove a player from a thread.
-- @function removePlayerFromThread
-- @param channelId The ID of the thread channel.
-- @param player The server ID of the player to remove from the thread.
-- @param botToken Optional bot token to use for authorization.
-- @return A new promise.
-- @usage exports.discord_rest:removePlayerFromThread("[channel ID]", 1, "[bot token]")
-- @see removeThreadMember
exports("removePlayerFromThread", function(channelId, player, botToken)
        return discordRest:removePlayerFromThread(channelId, player, botToken)
end)
