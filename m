Return-Path: <linux-leds+bounces-8450-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cvkpJV+DH2rFmgAAu9opvQ
	(envelope-from <linux-leds+bounces-8450-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:29:03 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 542176336CC
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=doZxfMJT;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8450-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-leds+bounces-8450-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 76A4930422F3
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 304A734B194;
	Wed,  3 Jun 2026 01:28:55 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6B534AAE3;
	Wed,  3 Jun 2026 01:28:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450135; cv=none; b=ckwZRQcs+yofqO2wRiBFbcyqA4eFJhjbTlpud3WKjDsVaNK1rTBAk8CpMGtZRX7yssH8iX26VKDaCCVJZTEU2WJTtQXZgta5O8JtsR2BJGHTUisoV06vN+fuU8TEFpeelvhz3xMy624MIH/EvFUiZc5IXT2NtIp58AR0KDPW7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450135; c=relaxed/simple;
	bh=ocjZMBRuihFd6lZhbm6qK1YS3+rzZgEZ+EXCBvKPFLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=omKxQUatS2n6mShXs0YCMvx3DTmxyU35GX+8NWd+MQ6rP2N6eX70CVOR05cxbdgTN7zmSB1vQxIIxv+RUEZpA9LYBZEP/ERGehlyFeM7Z4XEeZtp+gyVrhv794AznWmgHkJwy7+XVMXJ2ObnfQkA+ycazd3yVM818agOR1W3V3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=doZxfMJT; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFC2E1F00893;
	Wed,  3 Jun 2026 01:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450133;
	bh=RyVOkumICH9vv3sRP+0E6Xi9FVcOYl8Mdk3WunMYftc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=doZxfMJTot5Z1azajjwuY7tmuoHkz/qRbKCWeamcE968Q16ZWoVZ4D0FDVuqpoNll
	 qpJHLT/H7oAybHoXlLU55HsekzNJW/D7xP8EvQSqrGMfsgRL2FO4dQTQjqg7i7fO+1
	 jCkEgAbl+xgzdBtokIgiyEyYq6JUkwAFgeJc/XW2hy75wRw3gJVXtfpSJgKYBQE4rf
	 r++dML7AZnVMZ1HUoI7M0ixLsN0MrNx4I7KEnc4iy27T2EXqaSm2IoY2jROSkThAbW
	 rVJtuSgmahRFdxXBrTAKdPA5QQwelj6IiPgaTb0qUQqXPHVSTqqh/PZo+dd1UH8wGf
	 IINH/GcuqSL7w==
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
Subject: [PATCH net-next v2 04/11] net: ethtool: add netif_get_link_ksettings() for correct ops-locked use
Date: Tue,  2 Jun 2026 18:28:33 -0700
Message-ID: <20260603012840.2254293-5-kuba@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-8450-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 542176336CC

__ethtool_get_link_ksettings() is exported and called from sysfs
and many drivers. It invokes ethtool_ops->get_link_ksettings
so by our own docs it should be holding netdev lock for ops locked
devices. Looks like commit 2bcf4772e45a ("net: ethtool:
try to protect all callback with netdev instance lock")
missed adding the ops lock here.

There's a number of callers we need to fix up so let's add the
netif_get_link_ksettings() helper first, without any actual
locking changes (this commit is a nop).

Not treating this as a fix because I don't think any driver cares
at this point, but if we want to remove the rtnl_lock protection
this will become critical.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - split into multiple patches
---
 include/linux/ethtool.h |  2 ++
 net/ethtool/ioctl.c     | 17 ++++++++++++++---
 net/ethtool/linkinfo.c  |  4 ++--
 net/ethtool/linkmodes.c |  4 ++--
 4 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
index 1cb0740ba331..f51346a6a686 100644
--- a/include/linux/ethtool.h
+++ b/include/linux/ethtool.h
@@ -325,6 +325,8 @@ struct ethtool_link_ksettings {
 extern int
 __ethtool_get_link_ksettings(struct net_device *dev,
 			     struct ethtool_link_ksettings *link_ksettings);
+int netif_get_link_ksettings(struct net_device *dev,
+			     struct ethtool_link_ksettings *link_ksettings);
 
 struct ethtool_keee {
 	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported);
diff --git a/net/ethtool/ioctl.c b/net/ethtool/ioctl.c
index bd97f9b9bf18..49da873b673d 100644
--- a/net/ethtool/ioctl.c
+++ b/net/ethtool/ioctl.c
@@ -436,10 +436,10 @@ struct ethtool_link_usettings {
 };
 
 /* Internal kernel helper to query a device ethtool_link_settings. */
-int __ethtool_get_link_ksettings(struct net_device *dev,
-				 struct ethtool_link_ksettings *link_ksettings)
+int netif_get_link_ksettings(struct net_device *dev,
+			     struct ethtool_link_ksettings *link_ksettings)
 {
-	ASSERT_RTNL();
+	/* once callers fixed - assert ops locked */
 
 	if (!dev->ethtool_ops->get_link_ksettings)
 		return -EOPNOTSUPP;
@@ -450,6 +450,17 @@ int __ethtool_get_link_ksettings(struct net_device *dev,
 	memset(link_ksettings, 0, sizeof(*link_ksettings));
 	return dev->ethtool_ops->get_link_ksettings(dev, link_ksettings);
 }
+EXPORT_SYMBOL(netif_get_link_ksettings);
+
+/* Convenience helper for callers that hold only rtnl_lock(). */
+int __ethtool_get_link_ksettings(struct net_device *dev,
+				 struct ethtool_link_ksettings *link_ksettings)
+{
+	ASSERT_RTNL();
+
+	/* once callers fixed - take the ops lock around this call */
+	return netif_get_link_ksettings(dev, link_ksettings);
+}
 EXPORT_SYMBOL(__ethtool_get_link_ksettings);
 
 /* convert ethtool_link_usettings in user space to a kernel internal
diff --git a/net/ethtool/linkinfo.c b/net/ethtool/linkinfo.c
index 244ff92e2ff9..d5b3dbc53c5f 100644
--- a/net/ethtool/linkinfo.c
+++ b/net/ethtool/linkinfo.c
@@ -34,7 +34,7 @@ static int linkinfo_prepare_data(const struct ethnl_req_info *req_base,
 	ret = ethnl_ops_begin(dev);
 	if (ret < 0)
 		return ret;
-	ret = __ethtool_get_link_ksettings(dev, &data->ksettings);
+	ret = netif_get_link_ksettings(dev, &data->ksettings);
 	if (ret < 0)
 		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
 	ethnl_ops_complete(dev);
@@ -104,7 +104,7 @@ ethnl_set_linkinfo(struct ethnl_req_info *req_info, struct genl_info *info)
 	bool mod = false;
 	int ret;
 
-	ret = __ethtool_get_link_ksettings(dev, &ksettings);
+	ret = netif_get_link_ksettings(dev, &ksettings);
 	if (ret < 0) {
 		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
 		return ret;
diff --git a/net/ethtool/linkmodes.c b/net/ethtool/linkmodes.c
index 30d703531652..a6d32f0d9fcc 100644
--- a/net/ethtool/linkmodes.c
+++ b/net/ethtool/linkmodes.c
@@ -39,7 +39,7 @@ static int linkmodes_prepare_data(const struct ethnl_req_info *req_base,
 	if (ret < 0)
 		return ret;
 
-	ret = __ethtool_get_link_ksettings(dev, &data->ksettings);
+	ret = netif_get_link_ksettings(dev, &data->ksettings);
 	if (ret < 0) {
 		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
 		goto out;
@@ -324,7 +324,7 @@ ethnl_set_linkmodes(struct ethnl_req_info *req_info, struct genl_info *info)
 	bool mod = false;
 	int ret;
 
-	ret = __ethtool_get_link_ksettings(dev, &ksettings);
+	ret = netif_get_link_ksettings(dev, &ksettings);
 	if (ret < 0) {
 		GENL_SET_ERR_MSG(info, "failed to retrieve link settings");
 		return ret;
-- 
2.54.0


