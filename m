Return-Path: <linux-leds+bounces-8447-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id uP8lJ1aDH2rAmgAAu9opvQ
	(envelope-from <linux-leds+bounces-8447-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:28:54 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3866B6336C0
	for <lists+linux-leds@lfdr.de>; Wed, 03 Jun 2026 03:28:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=UytcsRi9;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8447-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8447-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 43CF23021985
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jun 2026 01:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F569346FC0;
	Wed,  3 Jun 2026 01:28:52 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68D2348875;
	Wed,  3 Jun 2026 01:28:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450132; cv=none; b=ltKerk/Ao6b3ciGXwBSjDksHaGNxM8rJPF3EsKnRZQWtOlF81S7mcVi9kMWMBy5TzwbxmTiUQ+xNSozTwWsNfrtFODHhZKU9HR1E1vvtn/zRX08tmWlEHw50wweFkuC7F67QoCxfFczHkGPPTcxDrEUNrkdcWnUVOlJ+JekXadQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450132; c=relaxed/simple;
	bh=dR4tYIsIpr9FNHrP4WFrgDStBqQIH61M92a/yuFyimU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n5fFB4T/dWw4zHYKLX34nEac1qaidtkRl1CLU6Fqkb6ysiy0UN/bjaL/RBPmQAYhLIch5ZECTEMxGKVgW2fngmcIn3TR7R8OfevC4ZI4UHgNRnX42N1rnJ8rrele3pj6cq0oqS+FdUX8AQSQ280whDbFrMAh7YAQvet8P8+//eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UytcsRi9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9879A1F00893;
	Wed,  3 Jun 2026 01:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450130;
	bh=Rw+6mZ0/tjDeyzOJ8+1T58zLZ2ET0XC60kE1DDDvSic=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UytcsRi9gcRW+gXvvSrxnUhlTfKjl5BvN4Q9RPmOImvfhMv1Oz73ocLUtYxUljfn3
	 h5GKA+ayK5i38CrzqIflYrS77lA6j/XEH2dfmSV9i1kFmgMxsK9R7nFODXSyFM6ECk
	 6HZjd7y6ErCpBoVAOIs1OVxX0JxMY6v4NX8H5fwsPGB+hyERGnMo5w1tf4fR8fcCDi
	 VWpekSzFY4KZSibf6LF3zIsavtXPgEFMtqPnitXjn6wKtQVHB8R0Qa30zHW+PiYqwU
	 0jhWwYHi5WEOzIYUp37EFGd9AOjCFd9F7ECOTTr0r0j9E8TB+BhpdOCbzQWAOp0TIV
	 etQqTBBxP9O/g==
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
Subject: [PATCH net-next v2 01/11] net: rename netdev_ops_assert_locked()
Date: Tue,  2 Jun 2026 18:28:30 -0700
Message-ID: <20260603012840.2254293-2-kuba@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_FROM(0.00)[bounces-8447-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3866B6336C0

Jakub suggests renaming the existing assert to match
the netdev_lock_ops_compat() semantics.

We want netdev_assert_locked_ops() to mean - if the driver
is ops locked - check that it's holding the device lock.

The existing helper check for either ops lock or rtnl_lock,
which is the locking behavior of netdev_lock_ops_compat().

The reason for naming divergence is likely that
netdev_ops_assert_locked() predated the _compat() helpers.

Suggested-by: Jakub Sitnicki <jakub@cloudflare.com>
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
v2:
 - new patch
---
 include/net/netdev_lock.h                 |  6 +++---
 drivers/net/ethernet/broadcom/bnxt/bnxt.c |  2 +-
 net/core/dev.c                            | 26 +++++++++++------------
 net/core/dev_addr_lists.c                 |  2 +-
 net/core/link_watch.c                     |  2 +-
 net/core/lock_debug.c                     |  2 +-
 net/core/netdev_queues.c                  |  2 +-
 net/ethtool/netlink.c                     |  4 ++--
 net/ipv6/addrconf.c                       |  2 +-
 net/xdp/xsk_buff_pool.c                   |  2 +-
 10 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/include/net/netdev_lock.h b/include/net/netdev_lock.h
index 3d3aef80beac..8e84d29b0bfb 100644
--- a/include/net/netdev_lock.h
+++ b/include/net/netdev_lock.h
@@ -64,7 +64,7 @@ static inline void netdev_unlock_full_to_ops(struct net_device *dev)
 		netdev_unlock(dev);
 }
 
-static inline void netdev_ops_assert_locked(const struct net_device *dev)
+static inline void netdev_assert_locked_ops_compat(const struct net_device *dev)
 {
 	if (netdev_need_ops_lock(dev))
 		lockdep_assert_held(&dev->lock);
@@ -73,11 +73,11 @@ static inline void netdev_ops_assert_locked(const struct net_device *dev)
 }
 
 static inline void
-netdev_ops_assert_locked_or_invisible(const struct net_device *dev)
+netdev_assert_locked_ops_compat_or_invisible(const struct net_device *dev)
 {
 	if (dev->reg_state == NETREG_REGISTERED ||
 	    dev->reg_state == NETREG_UNREGISTERING)
-		netdev_ops_assert_locked(dev);
+		netdev_assert_locked_ops_compat(dev);
 }
 
 static inline void netdev_lock_ops_compat(struct net_device *dev)
diff --git a/drivers/net/ethernet/broadcom/bnxt/bnxt.c b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
index d4f93e62f583..e27187ef6d63 100644
--- a/drivers/net/ethernet/broadcom/bnxt/bnxt.c
+++ b/drivers/net/ethernet/broadcom/bnxt/bnxt.c
@@ -16762,7 +16762,7 @@ int bnxt_restore_pf_fw_resources(struct bnxt *bp)
 {
 	int rc;
 
-	netdev_ops_assert_locked(bp->dev);
+	netdev_assert_locked_ops_compat(bp->dev);
 	bnxt_hwrm_func_qcaps(bp);
 
 	if (netif_running(bp->dev))
diff --git a/net/core/dev.c b/net/core/dev.c
index 804e8ad25010..1ecd5691992e 100644
--- a/net/core/dev.c
+++ b/net/core/dev.c
@@ -1593,7 +1593,7 @@ EXPORT_SYMBOL(netdev_features_change);
 
 void netif_state_change(struct net_device *dev)
 {
-	netdev_ops_assert_locked_or_invisible(dev);
+	netdev_assert_locked_ops_compat_or_invisible(dev);
 
 	if (dev->flags & IFF_UP) {
 		struct netdev_notifier_change_info change_info = {
@@ -1693,7 +1693,7 @@ static int __dev_open(struct net_device *dev, struct netlink_ext_ack *extack)
 
 	set_bit(__LINK_STATE_START, &dev->state);
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	if (ops->ndo_validate_addr)
 		ret = ops->ndo_validate_addr(dev);
@@ -1770,7 +1770,7 @@ static void __dev_close_many(struct list_head *head)
 		 *	event.
 		 */
 
-		netdev_ops_assert_locked(dev);
+		netdev_assert_locked_ops_compat(dev);
 
 		if (ops->ndo_stop)
 			ops->ndo_stop(dev);
@@ -3198,7 +3198,7 @@ int netif_set_real_num_tx_queues(struct net_device *dev, unsigned int txq)
 
 	if (dev->reg_state == NETREG_REGISTERED ||
 	    dev->reg_state == NETREG_UNREGISTERING) {
-		netdev_ops_assert_locked(dev);
+		netdev_assert_locked_ops_compat(dev);
 
 		rc = netdev_queue_update_kobjects(dev, dev->real_num_tx_queues,
 						  txq);
@@ -3247,7 +3247,7 @@ int netif_set_real_num_rx_queues(struct net_device *dev, unsigned int rxq)
 		return -EINVAL;
 
 	if (dev->reg_state == NETREG_REGISTERED) {
-		netdev_ops_assert_locked(dev);
+		netdev_assert_locked_ops_compat(dev);
 
 		rc = net_rx_queue_update_kobjects(dev, dev->real_num_rx_queues,
 						  rxq);
@@ -7294,7 +7294,7 @@ void netif_queue_set_napi(struct net_device *dev, unsigned int queue_index,
 
 	if (WARN_ON_ONCE(napi && !napi->dev))
 		return;
-	netdev_ops_assert_locked_or_invisible(dev);
+	netdev_assert_locked_ops_compat_or_invisible(dev);
 
 	switch (type) {
 	case NETDEV_QUEUE_TYPE_RX:
@@ -9589,7 +9589,7 @@ int __dev_set_promiscuity(struct net_device *dev, int inc, bool notify)
 	kuid_t uid;
 	kgid_t gid;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	promiscuity = dev->promiscuity + inc;
 	if (promiscuity == 0) {
@@ -9648,7 +9648,7 @@ int netif_set_allmulti(struct net_device *dev, int inc, bool notify)
 	unsigned int old_flags = dev->flags, old_gflags = dev->gflags;
 	unsigned int allmulti, flags;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	allmulti = dev->allmulti + inc;
 	if (allmulti == 0) {
@@ -9716,7 +9716,7 @@ int __dev_change_flags(struct net_device *dev, unsigned int flags,
 	unsigned int old_flags = dev->flags;
 	int ret;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	/*
 	 *	Set the flags on our device.
@@ -9864,7 +9864,7 @@ int netif_set_mtu_ext(struct net_device *dev, int new_mtu,
 {
 	int err, orig_mtu;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	if (new_mtu == dev->mtu)
 		return 0;
@@ -10317,7 +10317,7 @@ static int dev_xdp_install(struct net_device *dev, enum bpf_xdp_mode mode,
 	struct netdev_bpf xdp;
 	int err;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	if (dev->cfg->hds_config == ETHTOOL_TCP_DATA_SPLIT_ENABLED &&
 	    prog && !prog->aux->xdp_has_frags) {
@@ -10769,7 +10769,7 @@ u32 dev_get_min_mp_channel_count(const struct net_device *dev)
 {
 	int i;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	for (i = dev->real_num_rx_queues - 1; i >= 0; i--)
 		if (dev->_rx[i].mp_params.mp_priv)
@@ -10997,7 +10997,7 @@ int __netdev_update_features(struct net_device *dev)
 	int err = -1;
 
 	ASSERT_RTNL();
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	features = netdev_get_wanted_features(dev);
 
diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
index d73fcb0c6785..6b493af8dc8b 100644
--- a/net/core/dev_addr_lists.c
+++ b/net/core/dev_addr_lists.c
@@ -1260,7 +1260,7 @@ static void netif_rx_mode_run(struct net_device *dev)
 	int err;
 
 	might_sleep();
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	__hw_addr_init(&uc_snap);
 	__hw_addr_init(&mc_snap);
diff --git a/net/core/link_watch.c b/net/core/link_watch.c
index ff2c1d4538ef..9c35aac8b2e9 100644
--- a/net/core/link_watch.c
+++ b/net/core/link_watch.c
@@ -277,7 +277,7 @@ static bool linkwatch_clean_dev(struct net_device *dev)
 
 void __linkwatch_sync_dev(struct net_device *dev)
 {
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	if (linkwatch_clean_dev(dev)) {
 		linkwatch_do_dev(dev);
diff --git a/net/core/lock_debug.c b/net/core/lock_debug.c
index 9e9fb25314b9..14fd8fcdcd56 100644
--- a/net/core/lock_debug.c
+++ b/net/core/lock_debug.c
@@ -24,7 +24,7 @@ int netdev_debug_event(struct notifier_block *nb, unsigned long event,
 	case NETDEV_CHANGE:
 	case NETDEV_REGISTER:
 	case NETDEV_UP:
-		netdev_ops_assert_locked(dev);
+		netdev_assert_locked_ops_compat(dev);
 		fallthrough;
 	case NETDEV_DOWN:
 	case NETDEV_REBOOT:
diff --git a/net/core/netdev_queues.c b/net/core/netdev_queues.c
index 73fb28087a93..4d6864bb4f6b 100644
--- a/net/core/netdev_queues.c
+++ b/net/core/netdev_queues.c
@@ -40,7 +40,7 @@ struct device *netdev_queue_get_dma_dev(struct net_device *dev,
 	struct netdev_rx_queue *hw_rxq;
 	struct device *dma_dev;
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	/* Only RX side supports queue leasing today. */
 	if (type != NETDEV_QUEUE_TYPE_RX || !netif_rxq_is_leased(dev, idx))
diff --git a/net/ethtool/netlink.c b/net/ethtool/netlink.c
index 6cbd13b61bd1..25e22c48060a 100644
--- a/net/ethtool/netlink.c
+++ b/net/ethtool/netlink.c
@@ -98,7 +98,7 @@ int ethnl_ops_begin(struct net_device *dev)
 	if (dev->dev.parent)
 		pm_runtime_get_sync(dev->dev.parent);
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	if (!netif_device_present(dev) ||
 	    dev->reg_state >= NETREG_UNREGISTERING) {
@@ -1005,7 +1005,7 @@ static void ethnl_default_notify(struct net_device *dev, unsigned int cmd,
 		       ops->req_info_size - sizeof(*req_info));
 	}
 
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	ethnl_init_reply_data(reply_data, ops, dev);
 	ret = ops->prepare_data(req_info, reply_data, &info);
diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index d7b03196725f..968bb844b1b8 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -380,7 +380,7 @@ static struct inet6_dev *ipv6_add_dev(struct net_device *dev)
 	int err = -ENOMEM;
 
 	ASSERT_RTNL();
-	netdev_ops_assert_locked(dev);
+	netdev_assert_locked_ops_compat(dev);
 
 	if (dev->mtu < IPV6_MIN_MTU && dev != blackhole_netdev)
 		return ERR_PTR(-EINVAL);
diff --git a/net/xdp/xsk_buff_pool.c b/net/xdp/xsk_buff_pool.c
index d981cfdd8535..1f28a9641571 100644
--- a/net/xdp/xsk_buff_pool.c
+++ b/net/xdp/xsk_buff_pool.c
@@ -239,7 +239,7 @@ int xp_assign_dev(struct xsk_buff_pool *pool,
 	bpf.xsk.pool = pool;
 	bpf.xsk.queue_id = queue_id;
 
-	netdev_ops_assert_locked(netdev);
+	netdev_assert_locked_ops_compat(netdev);
 	err = netdev->netdev_ops->ndo_bpf(netdev, &bpf);
 	if (err)
 		goto err_unreg_pool;
-- 
2.54.0


