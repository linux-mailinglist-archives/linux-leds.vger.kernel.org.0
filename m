Return-Path: <linux-leds+bounces-8453-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id s1TXAfqEH2oMmwAAu9opvQ
	(envelope-from <linux-leds+bounces-8453-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:35:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB563376C
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:35:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=igCfpVZi;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8453-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8453-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B89F310B1C4
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5883634E754;
	Wed,  3 Jun 2026 01:28:58 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C238347FC8;
	Wed,  3 Jun 2026 01:28:57 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450138; cv=none; b=dmgmaWgvJnOOtj9WXH9jcEwd5HD6zMndJPt0z5YywT6xSE+C7GuzPY7gXSJ2lbatSFhA97sHKHenWAzfW3X7YU2iC3BOd1h4KDzJmHduYA5GAVOYQYUcZKsqOvBfyhQsKOuEbkvBXjzJzB0KZFnYYRnlAr0bs+lQwxbd+9fUzo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450138; c=relaxed/simple;
	bh=K9G47XIv5OzRXEX8XSq0tT+qRCKcfs5NjjXNDOvLDlo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrGVNzFDS0QhXRgjHyCnzNdi9iW99jqQa6cHoKWlaH+KfUq/tt7mf4DgAzClAxyvC8/JEc0EQ2mvwc31eDKfdUx0h7Zftd5PXVNSCyRAYTSGC0MWLbej+Fd/wd9B0arO2LzxIUDxP5HDegE+SM1Gdi5y/h4SWvvHOAk9hsLjxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=igCfpVZi; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0491B1F00899;
	Wed,  3 Jun 2026 01:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450136;
	bh=iIa161hU9SdUgF9rCFokyCi43tfBwnkoST4TjB6grTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=igCfpVZiyH79QWCaIxR7y0g3I0SEw4bOU23mlrzd6Y72ey6EKey4KJayHncVvtKNJ
	 pUK7r+O00sFQe/qqYre8aKEh20TNRGNT+VJL9SD2WFMHgR3Qs6EF4daCCbH1NJnjzL
	 FMN3J96IvGB5iKj6E+r5cv1LclrQWu2ackIiJ4PfDiUvvfGBF/rWcbOwdRZoFh41jN
	 w5Rf//XfpmqDLwSKpwj6wazXckVoZtHzRFukyEux/1qYfOlcBhOpZn0qZFivVTJWFf
	 hgZlK+L4Pl2B43F8Fo2RVYVrkJ0Ei70h0GmxyjZ2MAb7jwIQQU88USfysw3xhTy87n
	 MwcUdc89X16Aw==
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
Subject: [PATCH net-next v2 07/11] net: bridge: don't recurse on the port's netdev ops lock
Date: Tue,  2 Jun 2026 18:28:36 -0700
Message-ID: <20260603012840.2254293-8-kuba@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8453-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 88DB563376C

port_cost() calls __ethtool_get_link_ksettings() on the port device,
which will soon take the port's ops lock. br_port_carrier_check()
is reached via the NETDEV_CHANGE notifier from linkwatch, which
already holds the port's ops lock, so the call would deadlock.

Make port_cost() expect the port's ops lock held and switch to
netif_get_link_ksettings(). The only other caller is new_nbp(),
make sure it takes the lock explicitly.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 net/bridge/br_if.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
index d39571e13744..049d1d25bc26 100644
--- a/net/bridge/br_if.c
+++ b/net/bridge/br_if.c
@@ -19,6 +19,7 @@
 #include <linux/if_ether.h>
 #include <linux/slab.h>
 #include <net/dsa.h>
+#include <net/netdev_lock.h>
 #include <net/sock.h>
 #include <linux/if_vlan.h>
 #include <net/switchdev.h>
@@ -30,13 +31,13 @@
  * Determine initial path cost based on speed.
  * using recommendations from 802.1d standard
  *
- * Since driver might sleep need to not be holding any locks.
+ * Since driver might sleep, we need to not be holding any bridge spinlocks.
  */
 static int port_cost(struct net_device *dev)
 {
 	struct ethtool_link_ksettings ecmd;
 
-	if (!__ethtool_get_link_ksettings(dev, &ecmd)) {
+	if (!netif_get_link_ksettings(dev, &ecmd)) {
 		switch (ecmd.base.speed) {
 		case SPEED_10000:
 			return 2;
@@ -436,7 +437,9 @@ static struct net_bridge_port *new_nbp(struct net_bridge *br,
 	p->br = br;
 	netdev_hold(dev, &p->dev_tracker, GFP_KERNEL);
 	p->dev = dev;
+	netdev_lock_ops(dev);
 	p->path_cost = port_cost(dev);
+	netdev_unlock_ops(dev);
 	p->priority = 0x8000 >> BR_PORT_BITS;
 	p->port_no = index;
 	p->flags = BR_LEARNING | BR_FLOOD | BR_MCAST_FLOOD | BR_BCAST_FLOOD;
-- 
2.54.0


