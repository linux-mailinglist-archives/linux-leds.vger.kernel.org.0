Return-Path: <linux-leds+bounces-8452-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k92uBdmEH2oJmwAAu9opvQ
	(envelope-from <linux-leds+bounces-8452-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:35:21 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF6F63375C
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:35:20 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PE1A+olj;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8452-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8452-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B1593109BED
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0C934CFD6;
	Wed,  3 Jun 2026 01:28:57 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E618C349B19;
	Wed,  3 Jun 2026 01:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450136; cv=none; b=Uy5WxPB3dtpVJfnSJzt/XKn8lorMveAkxRd351ZcbEWfhhbs3EWkX8gkxDwEix0A2m30iLFOi8W1a26qErFba1qffbl6umfC/0OMr/e2otiIDBEbQUmm3EyTW4CavIC2O8hhXMRLXEiw+KQwlYt0eLOotEHWjs8VYOEFB2idvCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450136; c=relaxed/simple;
	bh=Bd/zzYgE//ACpCp6ESTTqB75nzpAce2Tolgu79aG7TU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uy5A99Hku4CzxYbe4QFulr0xgvKoMeMFLLR/RWfxOIo7SxxN3N7T82FI/shA313pJcP6ioo/aXr8b68MaDL6YDAD/B1YHe9f/MwGXoPEDRkZ11FQJMGtRpPZOIK+l6NImFWh1r5+yGigCyoZyqGwKvixyfUmjhZCaYniK/8AahM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PE1A+olj; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF97B1F00898;
	Wed,  3 Jun 2026 01:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450135;
	bh=q7MChu/y++LSvWxFejV8VTdOuAow4Mznfau6/I7QmBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PE1A+olj4rVT4OJ8tCJ7tdvBLP4EZS18WqWj6+0rNa8rUyxkaQsyIpzhijtA0Wmkm
	 VY+RTfLXk0GddedWDi7V2jRnD21r6uF/MjIxI6ShIiYsCgl3w9okIGT4HTq6+4aVfm
	 AT6gQKbPTCzogqPilZeR//ugg3J9lGf1tFfbz5ovkVGCCFpU9PQZ6wnSghc0ghRlxL
	 zFVGxOmVSRY5lAAVMlNFsFkbHo2t2RqHFxqAUIVGOOfWoh0OW1AWv9FKtV+iV0tDST
	 ei5fC1WhPq1bCDLTqjKlfxURuHBFapc/dBztX2XcHpD9ui66DaoVNM1mAAf0lurK36
	 QyFd70vr0S0VQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	jakub@cloudflare.com,
	maxime.chevallier@bootlin.com,
	nb@tipi-net.de,
	lee@kernel.org,
	linux-leds@vger.kernel.org,
	pavel@kernel.org,
	jv@jvosburgh.net,
	michael.chan@broadcom.com,
	jhs@mojatatu.com,
	vinicius.gomes@intel.com,
	idosch@nvidia.com,
	razor@blackwall.org,
	hare@suse.de,
	jhasan@marvell.com,
	danieller@nvidia.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 06/11] net: team: don't recurse on the port's netdev ops lock
Date: Tue,  2 Jun 2026 18:28:35 -0700
Message-ID: <20260603012840.2254293-7-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603012840.2254293-1-kuba@kernel.org>
References: <20260603012840.2254293-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-8452-lists,linux-leds=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:netdev@vger.kernel.org,m:edumazet@google.com,m:pabeni@redhat.com,m:andrew+netdev@lunn.ch,m:horms@kernel.org,m:jakub@cloudflare.com,m:maxime.chevallier@bootlin.com,m:nb@tipi-net.de,m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:pavel@kernel.org,m:jv@jvosburgh.net,m:michael.chan@broadcom.com,m:jhs@mojatatu.com,m:vinicius.gomes@intel.com,m:idosch@nvidia.com,m:razor@blackwall.org,m:hare@suse.de,m:jhasan@marvell.com,m:danieller@nvidia.com,m:kuba@kernel.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-leds@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5EF6F63375C

__team_port_change_send() calls __ethtool_get_link_ksettings() on
the port, which will soon take the port's ops lock. The notifier
caller already holds it while the slave-add/del callers do not,
so the function would either deadlock or run unprotected depending
on the path.

Make __team_port_change_send() expect the port's ops lock held and
switch to netif_get_link_ksettings(). team_device_event()'s NETDEV_UP /
NETDEV_CHANGE already arrive with the port's ops lock held.
team_port_add() now take it explicitly.

Note that NETDEV_DOWN and team_port_del() will pass false as @linkup
so they will not execute netif_get_link_ksettings(). This is fortunate
as NETDEV_DOWN has somewhat mixed locking right now.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/net/team/team_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/team/team_core.c b/drivers/net/team/team_core.c
index f51388d50307..feaa75fbf8fc 100644
--- a/drivers/net/team/team_core.c
+++ b/drivers/net/team/team_core.c
@@ -1375,7 +1375,9 @@ static int team_port_add(struct team *team, struct net_device *port_dev,
 	list_add_tail_rcu(&port->list, &team->port_list);
 	team_port_enable(team, port);
 	netdev_compute_master_upper_features(dev, true);
+	netdev_lock_ops(port_dev);
 	__team_port_change_port_added(port, !!netif_oper_up(port_dev));
+	netdev_unlock_ops(port_dev);
 	__team_options_change_check(team);
 
 	netdev_info(dev, "Port device %s added\n", portname);
@@ -3090,7 +3092,7 @@ static void __team_port_change_send(struct team_port *port, bool linkup)
 	if (linkup) {
 		struct ethtool_link_ksettings ecmd;
 
-		err = __ethtool_get_link_ksettings(port->dev, &ecmd);
+		err = netif_get_link_ksettings(port->dev, &ecmd);
 		if (!err) {
 			port->state.speed = ecmd.base.speed;
 			port->state.duplex = ecmd.base.duplex;
-- 
2.54.0


