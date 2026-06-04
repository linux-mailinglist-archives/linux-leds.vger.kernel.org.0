Return-Path: <linux-leds+bounces-8485-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tDM/HhKwIWoTLQEAu9opvQ
	(envelope-from <linux-leds+bounces-8485-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 19:04:18 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76F6422AB
	for <lists+linux-leds@lfdr.de>; Thu, 04 Jun 2026 19:04:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=NwjQBo5T;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8485-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8485-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 91F40304B70A
	for <lists+linux-leds@lfdr.de>; Thu,  4 Jun 2026 16:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71715481FA3;
	Thu,  4 Jun 2026 16:34:33 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4B047F2F0;
	Thu,  4 Jun 2026 16:34:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780590873; cv=none; b=MdqlBdPfHQlaDbHFj0oj0+mtNPd49GYbV0rUSHMg4HhVameGhf5OQNy9PM+O7H1Wr9l/G57dtCPbhI+TT+DdvqLhxH3DkKDPk3T3UDhQVk3DjCoeBgjwGvdJnXzNJAs+X4tx9srOhNWALnqSQfKl4c2IMlwaozCLmllp9bIq+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780590873; c=relaxed/simple;
	bh=hcqeidJ5DbC4DBI8iadUb+nu+0nnB7g5XsCgJJgRef8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ec4bitr4yZVPUXDyYh8b9YKVUwGb9VPB1tBBOxxBE6JGXfXeeUdAt7Tt+Rz+cGma57Pp4G1jZ/uRaSP2hyDcHfR1CX5JoMnJnK2fCITs0CaABzgzfQmkmfKpiMBu+GHxr/HoFpWAfRPP1RUCXb+5mrJVoptvY7xNcvaRH8oNPcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwjQBo5T; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 668751F00893;
	Thu,  4 Jun 2026 16:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780590872;
	bh=8lUX2LXHW7/8aXH/gaUcqbzEzjUbnWs6QP6IbJiKmfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NwjQBo5T3Y4uz0LJkadF0+KbR1MbZ5BJU5H69ODIpRz9yKSGP2QGIlMa0KcVIMRrP
	 rAp5DM52TDO2ypcDb3VpZNXZnOeFUc/4/abtVd0n4BVxCbEUFHp0GNVQwWifdM57z1
	 ikWOAq8IcOVEgGbTbbOGG4coigB2D9ZS7mSUwUTSn1lBewmpkZNHyjNOmKlEoJq26i
	 dC0dkMY2xZC72oF5YSu5OYgWaBAP/dRi7BfvIfYYNi4+bJLIeo0qRsKXIF91dtXVU+
	 jXAzeH+qmKHWR699Ric7GKsFn7YA7qJ1NY15X/37KPuM1KdEvQyRQVHdkC/zSGxkuY
	 auaHAB1qWM+KQ==
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260526103738.3389272-1-arnd@kernel.org>
References: <20260526103738.3389272-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] leds: fix CONFIG_OF dependency for
 LEDS_LP5860_CORE
Message-Id: <178059087016.108535.11067272954639479244.b4-ty@b4>
Date: Thu, 04 Jun 2026 17:34:30 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:trannamatk@gmail.com,m:lee@kernel.org,m:pavel@kernel.org,m:s.trumtrar@pengutronix.de,m:arnd@kernel.org,m:arnd@arndb.de,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,pengutronix.de];
	TAGGED_FROM(0.00)[bounces-8485-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6C76F6422AB

On Tue, 26 May 2026 12:37:32 +0200, Arnd Bergmann wrote:
> Building LEDS_LP5860_SPI wihtout CONFIG_OF leads to a build time warning:
> 
> WARNING: unmet direct dependencies detected for LEDS_LP5860_CORE
>   Depends on [n]: NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && LEDS_CLASS [=y] && OF [=n]
>   Selected by [y]:
>   - LEDS_LP5860_SPI [=y] && NEW_LEDS [=y] && LEDS_CLASS_MULTICOLOR [=y] && SPI [=y]
> 
> [...]

Applied, thanks!

[1/1] leds: fix CONFIG_OF dependency for LEDS_LP5860_CORE
      commit: a2263676302a4eec40af93b3829f1d3d5aade93c

--
Lee Jones [李琼斯]


