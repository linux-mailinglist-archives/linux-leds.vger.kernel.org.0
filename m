Return-Path: <linux-leds+bounces-8457-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id L+8jEAuFH2oRmwAAu9opvQ
	(envelope-from <linux-leds+bounces-8457-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:36:11 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6889F633775
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:36:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=cZXgq3V9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8457-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8457-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2694304651F
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1EB35AC32;
	Wed,  3 Jun 2026 01:29:02 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE321357CF1;
	Wed,  3 Jun 2026 01:29:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450142; cv=none; b=nQjsAbbSZCyVyWH8poTKN5SVct/ntdbEEWBR0qDGowJ16aPw5C/6zQJu8V0R8kH3y5cieUc37gwP+WVSSriqiwP+LK2cA18RGbbZyXy++kxxvCyED6y7QQJX14eg8VxJy1Y+T81rm1RiSSGsSRTXFQGgwincSOTGg4Xcoa8MAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450142; c=relaxed/simple;
	bh=qR+d1VWBiA4VeEv+o88/LMzVJvseJ+wQgqh8TNfwwyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tPVPm2bnFeJFFo4QfjQFEWp1Mg1gkoiZ52rkWykkS6qImO4Hjanlw12Mhi0v0VOE1v8zVitSzR+YG1gjV8HLk4N8DUFW/3LM33eSI4A37qLidlqmrhpjXOc5HPSYjtygPnEuKY75JRJ1t/uXZvnlnw+VoVuteriGExztG2Pc2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cZXgq3V9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8731F00898;
	Wed,  3 Jun 2026 01:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450141;
	bh=MYyyDaT0hIZyG44+uZYAuskTw7SN+xIvPPQNmfCIYaY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cZXgq3V9dcE4yYtM840Rdb9Ip1rS0RX1Fqg/sC9vKbyvoxtnGzJT9k2HIlNd1opSr
	 g0ftqz7eGFm0pNmRX7CQQNkJGGgn9kZ9Wm1mduVSz4iLKzOvb8XI6Bf6oNMNPlvCtM
	 z5+rXwXe/3DEgtSD7cDOPJgTWAwcBpVVPTD3onKMXIVLK9tHYDNdBwG/W0nmGsR1DB
	 4rjAwnQ7y4p+z1GCqveVgARaN4skp8BOUsIeTLLcn4Eg1qTfVtqeZQeoKP7LiOjE7/
	 tjy1Ca4HNBXaMT7bRjgl7UeDJ026eeo+vGyW6Hnvd0soMLZKy51KZ6SQbqb5BHJWqs
	 x5iK6RS/7SHLA==
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
Subject: [PATCH net-next v2 11/11] net: ethtool: make sure __ethtool_get_link_ksettings() is ops-locked
Date: Tue,  2 Jun 2026 18:28:40 -0700
Message-ID: <20260603012840.2254293-12-kuba@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-8457-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6889F633775

All drivers which may call *_get_link_ksettings() on ops-locked
devices from paths already holding the ops lock are ready now.
Make __ethtool_get_link_ksettings() take the ops lock, and assert
that it's held in netif_get_link_ksettings().

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/ethtool/ioctl.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index 49da873b673d..a4b0cbae4063 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -439,7 +439,7 @@ struct ethtool_link_usettings {
 int netif_get_link_ksettings(struct net_device *dev,
 			     struct ethtool_link_ksettings *link_ksettings)
 {
-	/* once callers fixed - assert ops locked */
+	netdev_assert_locked_ops_compat(dev);
 
 	if (!dev->ethtool_ops->get_link_ksettings)
 		return -EOPNOTSUPP;
@@ -456,10 +456,14 @@ EXPORT_SYMBOL(netif_get_link_ksettings);
 int __ethtool_get_link_ksettings(struct net_device *dev,
 				 struct ethtool_link_ksettings *link_ksettings)
 {
+	int ret;
+
 	ASSERT_RTNL();
 
-	/* once callers fixed - take the ops lock around this call */
-	return netif_get_link_ksettings(dev, link_ksettings);
+	netdev_lock_ops(dev);
+	ret = netif_get_link_ksettings(dev, link_ksettings);
+	netdev_unlock_ops(dev);
+	return ret;
 }
 EXPORT_SYMBOL(__ethtool_get_link_ksettings);
 
-- 
2.54.0


