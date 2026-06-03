Return-Path: <linux-leds+bounces-8456-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vDVOB+yEH2oKmwAAu9opvQ
	(envelope-from <linux-leds+bounces-8456-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:35:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD4A633761
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:35:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=k3W+K8Pp;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8456-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8456-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9C073113384
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D20B4357CF5;
	Wed,  3 Jun 2026 01:29:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF65351C26;
	Wed,  3 Jun 2026 01:29:00 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450141; cv=none; b=urHtoAcPecCNxXYEdk7pDNxquaiOFH556UJGNJniBhfY43odtAGKIOnUj2tAjgJYCO5pvDQTNb8tJ4sBnjNYB7p2eAtGEOB7DDVqklHq+YpUY9cfoGDIN7/LEzBrxXDQa/vqLz1XRyBPJbCmfSwC/S3fi4CKH9PKp7iApPB84ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450141; c=relaxed/simple;
	bh=p61Lac/Pntz160REqqzoTPVBlenzEOGpU0J+KBZ+cx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GkSQV0sZOwylR/N28yhox7+ydmiMNAxRbU5lo5XQsXFDrbmt047wgbP1om5ycJIgykuMab5jlcO850oVXCZdFOIA2bKyj6NSEuzr/HX8ktCWvG9u/E6s4FlRdD/Qxjo6RGOLPIqrhp0OWlX/SUmeI2trEAt8tuz1nSknkp10rp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3W+K8Pp; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50DFE1F00893;
	Wed,  3 Jun 2026 01:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450140;
	bh=VsZXkkEMNm2wxRoC0j0UqMhrJaPjz3OizoEiAzsqfAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=k3W+K8PptrRpq4igUo7e9pFq2sHzeb/c6rD7oXmah4b493KdKA/D3xail5LMd/HBH
	 GQl19tMrX05LVMxAQ8w6pOXEohViDJSi7qPs7i1ytycDuDnyvEU2oHzrEXRgpUqt9/
	 8efpV08/7LIoTu1IFTnrV4sgXpDIkkpwoes9+iLY6lyDeehhMyHURq9I+X19nHQWvp
	 lfe9MZJC+gSFxlE9QjtI8qyF7mRdBnvOO2Mri1JCh/oSEsOjXSYv7u014MLUUj0xuv
	 wEuc8UU9OzR8nHKWqNP9W7IdnkqlzE1e6xFssEC+k7NpzuYpZDoaHD2CmQL2reSII+
	 oB0L6Hb8IEblg==
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
Subject: [PATCH net-next v2 10/11] scsi: fcoe: don't recurse on the netdev's ops lock
Date: Tue,  2 Jun 2026 18:28:39 -0700
Message-ID: <20260603012840.2254293-11-kuba@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-8456-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 8FD4A633761

fcoe_link_speed_update() calls __ethtool_get_link_ksettings() on the
lport's netdev, which will soon take the dev's ops lock. Some notifier
callers already arrive with this lock held. Switch to
netif_get_link_ksettings() and adjust the explicit call sites to take
the netdev lock explicitly.

Within fcoe_device_notification() try to only query the link speed
from notifiers which announce link state change (UP / CHANGE),
DOWN / GOING_DOWN notifiers are slightly sketchy when it comes
to ops locking right now, and the code already special-cases
those by maintaining the local link_possible variable.

Also take the lock in bnx2fc_net_config(), even though I think
that bnx2fc call sites are largely irrelevant since it's not
an ops-locked driver.

Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c  | 3 +++
 drivers/scsi/fcoe/fcoe.c           | 6 ++++--
 drivers/scsi/fcoe/fcoe_transport.c | 4 +++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index 26e0ff380860..c95b084cad69 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -17,6 +17,7 @@
 #include "bnx2fc.h"
 
 #include <linux/ethtool.h>
+#include <net/netdev_lock.h>
 
 static struct list_head adapter_list;
 static struct list_head if_list;
@@ -815,7 +816,9 @@ static int bnx2fc_net_config(struct fc_lport *lport, struct net_device *netdev)
 	port->fcoe_pending_queue_active = 0;
 	timer_setup(&port->timer, fcoe_queue_timer, 0);
 
+	netdev_lock_ops(netdev);
 	fcoe_link_speed_update(lport);
+	netdev_unlock_ops(netdev);
 
 	if (!lport->vport) {
 		if (fcoe_get_wwn(netdev, &wwnn, NETDEV_FCOE_WWNN))
diff --git a/drivers/scsi/fcoe/fcoe.c b/drivers/scsi/fcoe/fcoe.c
index 534596c6d76c..438ac7c3a9e3 100644
--- a/drivers/scsi/fcoe/fcoe.c
+++ b/drivers/scsi/fcoe/fcoe.c
@@ -25,6 +25,7 @@
 #include <scsi/scsicam.h>
 #include <scsi/scsi_transport.h>
 #include <scsi/scsi_transport_fc.h>
+#include <net/netdev_lock.h>
 #include <net/rtnetlink.h>
 
 #include <scsi/fc/fc_encaps.h>
@@ -737,7 +738,9 @@ static int fcoe_netdev_config(struct fc_lport *lport, struct net_device *netdev)
 	port->fcoe_pending_queue_active = 0;
 	timer_setup(&port->timer, fcoe_queue_timer, 0);
 
+	netdev_lock_ops(netdev);
 	fcoe_link_speed_update(lport);
+	netdev_unlock_ops(netdev);
 
 	if (!lport->vport) {
 		if (fcoe_get_wwn(netdev, &wwnn, NETDEV_FCOE_WWNN))
@@ -1841,6 +1844,7 @@ static int fcoe_device_notification(struct notifier_block *notifier,
 		break;
 	case NETDEV_UP:
 	case NETDEV_CHANGE:
+		fcoe_link_speed_update(lport);
 		break;
 	case NETDEV_CHANGEMTU:
 		if (netdev->fcoe_mtu)
@@ -1871,8 +1875,6 @@ static int fcoe_device_notification(struct notifier_block *notifier,
 				"from netdev netlink\n", event);
 	}
 
-	fcoe_link_speed_update(lport);
-
 	cdev = fcoe_ctlr_to_ctlr_dev(ctlr);
 
 	if (link_possible && !fcoe_link_ok(lport)) {
diff --git a/drivers/scsi/fcoe/fcoe_transport.c b/drivers/scsi/fcoe/fcoe_transport.c
index 88d85fc9a52a..2bbb9a38e61d 100644
--- a/drivers/scsi/fcoe/fcoe_transport.c
+++ b/drivers/scsi/fcoe/fcoe_transport.c
@@ -111,6 +111,8 @@ static inline u32 eth2fc_speed(u32 eth_port_speed)
  * fcoe_link_speed_update() - Update the supported and actual link speeds
  * @lport: The local port to update speeds for
  *
+ * Caller must hold the netdev's ops lock.
+ *
  * Returns: 0 if the ethtool query was successful
  *          -1 if the ethtool query failed
  */
@@ -119,7 +121,7 @@ int fcoe_link_speed_update(struct fc_lport *lport)
 	struct net_device *netdev = fcoe_get_netdev(lport);
 	struct ethtool_link_ksettings ecmd;
 
-	if (!__ethtool_get_link_ksettings(netdev, &ecmd)) {
+	if (!netif_get_link_ksettings(netdev, &ecmd)) {
 		lport->link_supported_speeds &= ~(FC_PORTSPEED_1GBIT  |
 		                                  FC_PORTSPEED_10GBIT |
 		                                  FC_PORTSPEED_20GBIT |
-- 
2.54.0


