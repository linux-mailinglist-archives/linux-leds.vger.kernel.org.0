Return-Path: <linux-leds+bounces-8448-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nMJEEbWEH2oCmwAAu9opvQ
	(envelope-from <linux-leds+bounces-8448-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:34:45 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2EA633750
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:34:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=T0w52rbg;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8448-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-leds+bounces-8448-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB24330FCE2A
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE8BF347BAF;
	Wed,  3 Jun 2026 01:28:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93DCD346FAA;
	Wed,  3 Jun 2026 01:28:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450132; cv=none; b=mugWepn1+hth2sCFzXh+VM1RPuaFic91AI6J/Z1A88Fx6bkN/VbTELju9OP8m1UHzOFHyEVTTu3snO1Bt20GYdTYJa10X8Rh+gXCZhcfBI2QqEkfdCvt4YyYZQ50+rnaSJJQRhQl9NJpX05Rl887r4ljfX5Be9+6l+h0UtW6g00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450132; c=relaxed/simple;
	bh=XRTS00RW0LVqBuhLS2kxRPH9LaN0CrXBNdAh+iUm4s0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uHLaf2Ry3VDqx1hvRVkJF8YdDWdjSaIoK3oQNQFcLQYCFMhNiUzASYv5IUht1Nkc5+t97KEElDEFT2zCCK64o42DgLTkk+C6O1eEhCZJPt1VhUoY7gLfpfzuaRsZNcxivE+1+31KGcHffH7cB+RPs1iUlQIZEASVpkxl0jV9K9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T0w52rbg; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D4EF1F00898;
	Wed,  3 Jun 2026 01:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450131;
	bh=Wwz4ClbvomvXztDKWh5cElXY0yQyk4rOeuO+VXeZL7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T0w52rbgHxY0jpSUa+J0JMFklfZxQ49o2vAbb0Z1d8/+V498So6bXi7fY+2Zah2AI
	 poY6Wwthm+8HEtt+Yqe3tqCgNHGWIu/R4dH7qIWEAuniVxIVV9gPRjZkTTbqycn/AB
	 YU7F9nhNhcHg+rUhHZ8ZSsIuSijd2jGL1wyz4PbiuctSOyrO+xpn8yD0yWctITAPJ+
	 IjPpAHBI/KdLx2gC8ed5an5CpKuPISszPtdRN2bGQKFKTXIys3DqXs0dCl5Es4QiDU
	 O3Rdn7OYbpDe+9cVH+MCxDrsDYC+atQ8tRv6kwJpg2DM2zhkgvfGdnoxlxhZyK7uYZ
	 GoJnHZBxWY1fw==
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
Subject: [PATCH net-next v2 02/11] net: ethtool: cmis_cdb: hold instance lock for ops locked devices
Date: Tue,  2 Jun 2026 18:28:31 -0700
Message-ID: <20260603012840.2254293-3-kuba@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8448-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: DA2EA633750

FW module flashing was written so that the flashing happens
without holding rtnl_lock. This allows flashing multiple modules
at once. Current drivers can handle that well, but we should
let drivers depend on the netdev instance lock. Instance lock
is per netdev, and so is the module so we won't break parallel
updates.

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 include/net/netdev_lock.h    | 6 ++++++
 net/ethtool/cmis_cdb.c       | 3 +++
 net/ethtool/cmis_fw_update.c | 8 ++------
 net/ethtool/module.c         | 2 ++
 4 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/include/net/netdev_lock.h b/include/net/netdev_lock.h
index 8e84d29b0bfb..d3daec4e93f3 100644
--- a/include/net/netdev_lock.h
+++ b/include/net/netdev_lock.h
@@ -80,6 +80,12 @@ netdev_assert_locked_ops_compat_or_invisible(const struct net_device *dev)
 		netdev_assert_locked_ops_compat(dev);
 }
 
+static inline void netdev_assert_locked_ops(const struct net_device *dev)
+{
+	if (netdev_need_ops_lock(dev))
+		netdev_assert_locked(dev);
+}
+
 static inline void netdev_lock_ops_compat(struct net_device *dev)
 {
 	if (netdev_need_ops_lock(dev))
diff --git a/net/ethtool/cmis_cdb.c b/net/ethtool/cmis_cdb.c
index f3a53a984460..a4e8f4b3fb75 100644
--- a/net/ethtool/cmis_cdb.c
+++ b/net/ethtool/cmis_cdb.c
@@ -2,6 +2,7 @@
 
 #include <linux/ethtool.h>
 #include <linux/jiffies.h>
+#include <net/netdev_lock.h>
 
 #include "common.h"
 #include "module_fw.h"
@@ -179,6 +180,7 @@ cmis_cdb_validate_password(struct ethtool_cmis_cdb *cdb,
 
 	pe_pl = *((struct cmis_password_entry_pl *)page_data.data);
 	pe_pl.password = params->password;
+	netdev_assert_locked_ops(dev);
 	err = ops->set_module_eeprom_by_page(dev, &page_data, &extack);
 	if (err < 0) {
 		if (extack._msg)
@@ -546,6 +548,7 @@ __ethtool_cmis_cdb_execute_cmd(struct net_device *dev,
 	if (!page_data->data)
 		return -ENOMEM;
 
+	netdev_assert_locked_ops(dev);
 	err = ops->set_module_eeprom_by_page(dev, page_data, &extack);
 	if (err < 0) {
 		if (extack._msg)
diff --git a/net/ethtool/cmis_fw_update.c b/net/ethtool/cmis_fw_update.c
index 291d04d2776a..dff83807e975 100644
--- a/net/ethtool/cmis_fw_update.c
+++ b/net/ethtool/cmis_fw_update.c
@@ -435,13 +435,9 @@ cmis_fw_update_commit_image(struct ethtool_cmis_cdb *cdb,
 static int cmis_fw_update_reset(struct net_device *dev)
 {
 	__u32 reset_data = ETH_RESET_PHY;
-	int ret;
 
-	netdev_lock_ops(dev);
-	ret = dev->ethtool_ops->reset(dev, &reset_data);
-	netdev_unlock_ops(dev);
-
-	return ret;
+	netdev_assert_locked_ops(dev);
+	return dev->ethtool_ops->reset(dev, &reset_data);
 }
 
 void
diff --git a/net/ethtool/module.c b/net/ethtool/module.c
index ea4fb2a76650..c3388e6d7ec8 100644
--- a/net/ethtool/module.c
+++ b/net/ethtool/module.c
@@ -226,7 +226,9 @@ static void module_flash_fw_work(struct work_struct *work)
 	module_fw = container_of(work, struct ethtool_module_fw_flash, work);
 	dev = module_fw->fw_update.dev;
 
+	netdev_lock_ops(dev);
 	ethtool_cmis_fw_update(&module_fw->fw_update);
+	netdev_unlock_ops(dev);
 
 	module_flash_fw_work_list_del(&module_fw->list);
 
-- 
2.54.0


