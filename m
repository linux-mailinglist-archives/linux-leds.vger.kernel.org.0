Return-Path: <linux-leds+bounces-8259-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +FXXFtY5Dmqu8wUAu9opvQ
	(envelope-from <linux-leds+bounces-8259-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 00:46:46 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA359C43F
	for <lists+linux-leds@lfdr.de>; Thu, 21 May 2026 00:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EED1C3372D63
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 20:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 389FA3644C2;
	Wed, 20 May 2026 20:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjJ0gNnJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92B4362153
	for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 20:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779307428; cv=none; b=YcUrntZIRuar/ht9uLon/gVGHj+7gOPd4KArhqoej7w1Xmqchg5iy8ko8zdjGIO4PQW/7jak5pAly2JAxNRNsp2VhW0kk0P9x/TO0V7W3TWbVEEeEQioqTj8v1gK2UIhEP6tZXdOWVnKfoBVJ/FeKMj5Twd5Il1BSpalbhJyvSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779307428; c=relaxed/simple;
	bh=6cvUJBRsRmETKHLO52FmOFc//tiyQIlkClqq+i0qF9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oz066V0GGRsRh1tl+Y7GY3K3Mq/FRwppPbnyVvD7NK3d8gkB0ai4AIY7WgvEIIqfgzEItpPePmnX1cvM96QOJnFAWC6DvvuV85vPy+Ul2EVj0WJnWU/Ijb3OyFgBKHn96Wg4z06aVopDg3JXmxxZPSdCyQ5tAOEFh1w5HBVDEWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjJ0gNnJ; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50e5dbd8e0eso60701731cf.1
        for <linux-leds@vger.kernel.org>; Wed, 20 May 2026 13:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779307425; x=1779912225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1N4UB0YVLf3dldz+nPe+MFHXrscyQbdsHGnb1vXEfI4=;
        b=kjJ0gNnJT9h/Oubu9xgbGM8aa77fmvEU7lDhFGoenjhH7+DiFhFovu3K6xdPjcwhzh
         zVhqh7K00lzC2Z+jef4GJ4EqaZrOKUuA0pZdUH0yv7mB2XxM6VZz2w9E8j5STNRbWYWV
         2bGJqHqsVsFiI13sWRBvNb+SUWpNJr3/IukTmxSuUonmz/sQC7WrZurVM5yWFwZtCuiL
         /+CFhnNH36bmceHZ9/zSGZW9cBdwQPNla9BZto/k74v8/6h6L5atWTis/lOQJJQNAoLk
         EMGdqWpNb4vSJcx+ouMmyen5FJBBMeIqXP76xxL7z/nJUH2/7etd4fCiX0LwQ6f1395m
         xIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779307425; x=1779912225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1N4UB0YVLf3dldz+nPe+MFHXrscyQbdsHGnb1vXEfI4=;
        b=XY+0GxwTnuHoc3sXZ+KxyTHTM60afoO0Kt3598A3o3PePfbXeV68JgeYLsP29Tno6D
         CVwZNeuUPdEj0CHIr7g9BzevfCHbaAhTGv+CvEXVd++J5dc5CiOeyfH1xihKZ9bXls+A
         kZIQPAA4PW5/g6e/mzewSuK+06/W8dVjbdyWJAqTKSVdI72IlN1Vd+Ez825XP6+2rLhR
         x8FiFLcAxuDU0GzFr0Xqn7IYWzeEr5JqNbD82Y3JdFrYvCefx4Mln2fVow7KuFn7o/Ys
         zf0GE3O6cg0fVbj1aQvWdWyZyAA+3OJmeBQ6B/XQy+CmDqfxpzOZG6TrzD8j/+NkCAZu
         fCRw==
X-Forwarded-Encrypted: i=1; AFNElJ9etV3LBBI3P6mwOR61yrnjdxHazVkBdqKpNtJkqqSYZnklgdrmsQrjBhcmHPpup8krke4h02WRkxBJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwWP6ft/cyaPvPnA86sZ7p1mHwkWCNWQ0WfvwWW0/RgCxAwizrv
	/B/2+/SGD9HbEQoABdj0cuUZGuZdTRW0B/Td2rIjkhwX/CEpLcMgHV4K
X-Gm-Gg: Acq92OEjRocrWqmRzIJIvHuHidgWATA417UBGTeAicVDsy9O333nOeZqymZlTYsZx+B
	s9ry3Omh00+T1jPkNL1C+EQBFSFm9APa5WAvODWRnrpNv8iORybpglvorzL6fmAvwAwDJfIAGtf
	4u4iZlb0HiBoI7M+cIgVy61NupNqqpNF9kEtosLHLs6HpFPNVCPzAvZHCtw6I2zLUrjqU+ujv0x
	llYbeA1NJbUyatJpk/84f5e1VD2vgvEYEJFw/rI1Uf65wVqfmDN/bukU7KWnS0h/4IoLEcjuKZd
	c6TUTh2yJRvXZc5LwogCF+xIk77dTux+Wur/1rb54YPWrOIO9XA7YO+d1182ROgichml0DKBkXP
	du4d+RgF3tylU/qeU3D5XUrLxOHr3TOxz+MlOeaeMoi9WzvyFl/nxQdjCYsBBws2BWngU2B7h17
	0J085UyTY0yMBxQ1bqlWvW9yDrU3J21XzO/QhFxE5Lp3ZQEpl4GI/HNHUf
X-Received: by 2002:ac8:5f4b:0:b0:510:2506:1ba9 with SMTP id d75a77b69052e-5165a1f326bmr334535821cf.49.1779307424327;
        Wed, 20 May 2026 13:03:44 -0700 (PDT)
Received: from PF5YBGDS.localdomain ([163.114.130.1])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-516514e0b91sm188849301cf.15.2026.05.20.13.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 13:03:43 -0700 (PDT)
From: mike.marciniszyn@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Alexander Duyck <alexanderduyck@fb.com>,
	Jakub Kicinski <kuba@kernel.org>,
	kernel-team@meta.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Daniel Golle <daniel@makrotopia.org>,
	Kees Cook <kees@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Lee Trager <lee@trager.us>,
	Mohsin Bashir <mohsin.bashr@gmail.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Chengfeng Ye <dg573847474@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>
Cc: mike.marciniszyn@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next 3/3] net: eth: fbnic: Add led support
Date: Wed, 20 May 2026 16:03:37 -0400
Message-ID: <20260520200337.204431-4-mike.marciniszyn@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
References: <20260520200337.204431-1-mike.marciniszyn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,fb.com,meta.com,lunn.ch,davemloft.net,google.com,redhat.com,armlinux.org.uk,makrotopia.org,gmail.com,intel.com,trager.us,oracle.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-8259-lists,linux-leds=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikemarciniszyn@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B2FA359C43F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: "Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>

This patch adds the LED support for fbnic and adds the
user /sys/class/leds interfaces based on CONFIG_FBNIC_LEDS.

Signed-off-by: Mike Marciniszyn (Meta) <mike.marciniszyn@gmail.com>
---
 drivers/net/ethernet/meta/Kconfig             |   8 +
 drivers/net/ethernet/meta/fbnic/Makefile      |   2 +
 drivers/net/ethernet/meta/fbnic/fbnic.h       |  13 +
 drivers/net/ethernet/meta/fbnic/fbnic_csr.h   |  15 ++
 .../net/ethernet/meta/fbnic/fbnic_devlink.c   |   4 +
 .../net/ethernet/meta/fbnic/fbnic_ethtool.c   |  59 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_led.c   | 228 +++++++++++++++++
 drivers/net/ethernet/meta/fbnic/fbnic_mac.c   | 239 ++++++++++++++++++
 drivers/net/ethernet/meta/fbnic/fbnic_mac.h   |  62 +++++
 drivers/net/ethernet/meta/fbnic/fbnic_pci.c   |   8 +
 .../net/ethernet/meta/fbnic/fbnic_phylink.c   |   2 +
 11 files changed, 640 insertions(+)
 create mode 100644 drivers/net/ethernet/meta/fbnic/fbnic_led.c

diff --git a/drivers/net/ethernet/meta/Kconfig b/drivers/net/ethernet/meta/Kconfig
index ca5c7ac2a5bc..a8ca2aaf798a 100644
--- a/drivers/net/ethernet/meta/Kconfig
+++ b/drivers/net/ethernet/meta/Kconfig
@@ -35,4 +35,12 @@ config FBNIC
 	  To compile this driver as a module, choose M here. The module
 	  will be called fbnic.  MSI-X interrupt support is required.
 
+config FBNIC_LEDS
+	def_bool LEDS_TRIGGER_NETDEV
+	depends on FBNIC && LEDS_CLASS
+	depends on LEDS_CLASS=y || FBNIC=m
+	help
+	  Optional support for controlling the NIC LEDs with the netdev
+	  LED trigger.
+
 endif # NET_VENDOR_META
diff --git a/drivers/net/ethernet/meta/fbnic/Makefile b/drivers/net/ethernet/meta/fbnic/Makefile
index 72c41af65364..7f3b70a1f444 100644
--- a/drivers/net/ethernet/meta/fbnic/Makefile
+++ b/drivers/net/ethernet/meta/fbnic/Makefile
@@ -26,3 +26,5 @@ fbnic-y := fbnic_csr.o \
 	   fbnic_tlv.o \
 	   fbnic_txrx.o \
 # End of objects
+
+fbnic-$(CONFIG_FBNIC_LEDS) += fbnic_led.o
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic.h b/drivers/net/ethernet/meta/fbnic/fbnic.h
index d0715695c43e..cf98beca53d3 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic.h
@@ -97,6 +97,11 @@ struct fbnic_dev {
 
 	struct fbnic_fw_log fw_log;
 
+	/* Used to synchronize updates to LED state and CSR */
+	struct mutex led_mutex;
+	bool led_link_up;
+	struct fbnic_led_cdev leds[FBNIC_NUM_LEDS];
+
 	/* MDIO bus for PHYs */
 	struct mii_bus *mdio_bus;
 
@@ -243,6 +248,14 @@ void fbnic_dbg_exit(void);
 
 void fbnic_rpc_reset_valid_entries(struct fbnic_dev *fbd);
 
+#if IS_ENABLED(CONFIG_FBNIC_LEDS)
+int fbnic_led_init(struct fbnic_dev *fbd);
+void fbnic_led_exit(struct fbnic_dev *fbd);
+#else
+static inline int fbnic_led_init(struct fbnic_dev *fbd) { return 0; }
+static inline void fbnic_led_exit(struct fbnic_dev *fbd) {}
+#endif
+
 int fbnic_mdiobus_create(struct fbnic_dev *fbd);
 
 void fbnic_csr_get_regs(struct fbnic_dev *fbd, u32 *data, u32 *regs_version);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_csr.h b/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
index 64b958df7774..6f4ae091652b 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_csr.h
@@ -857,6 +857,21 @@ enum {
 #define FBNIC_SIG_PCS_INTR_LINK_DOWN		CSR_BIT(1)
 #define FBNIC_SIG_PCS_INTR_LINK_UP		CSR_BIT(0)
 #define FBNIC_SIG_PCS_INTR_MASK		0x11816		/* 0x46058 */
+#define FBNIC_SIG_LED			0x11820		/* 0x46080 */
+#define FBNIC_SIG_LED_OVERRIDE_EN		CSR_GENMASK(2, 0)
+#define FBNIC_SIG_LED_OVERRIDE_VAL		CSR_GENMASK(6, 4)
+
+enum {
+	FBNIC_SIG_LED_OVERRIDE_ACTIVITY	= 0x1,
+	FBNIC_SIG_LED_OVERRIDE_AMBER	= 0x2,
+	FBNIC_SIG_LED_OVERRIDE_BLUE	= 0x4,
+};
+
+#define FBNIC_SIG_LED_BLINK_RATE_MASK		CSR_GENMASK(11, 8)
+enum {
+	FBNIC_SIG_LED_BLINK_RATE_5HZ	= 0xf,
+};
+
 #define FBNIC_CSR_END_SIG		0x1184e /* CSR section delimiter */
 
 #define FBNIC_CSR_START_MAC_STAT	0x11a00
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c b/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c
index 546e1c12d287..8aabec5143cd 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_devlink.c
@@ -622,6 +622,8 @@ void fbnic_devlink_free(struct fbnic_dev *fbd)
 {
 	struct devlink *devlink = priv_to_devlink(fbd);
 
+	mutex_destroy(&fbd->led_mutex);
+
 	devlink_free(devlink);
 }
 
@@ -651,6 +653,8 @@ struct fbnic_dev *fbnic_devlink_alloc(struct pci_dev *pdev)
 
 	fbd->mac_addr_boundary = FBNIC_RPC_TCAM_MACDA_DEFAULT_BOUNDARY;
 
+	mutex_init(&fbd->led_mutex);
+
 	return fbd;
 }
 
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
index f14de2366854..3904081e24f9 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_ethtool.c
@@ -2005,6 +2005,64 @@ fbnic_get_rmon_stats(struct net_device *netdev,
 	*ranges = fbnic_rmon_ranges;
 }
 
+/**
+ * fbnic_set_phys_id - Used to strobe the MAC LEDs in a recognizable pattern
+ * @netdev: Interface/port to strobe the LEDs for
+ * @phys_id_state: State requested by the call
+ *
+ * This function can really be broken down into two parts. There are the
+ * ACTIVE/INACTIVE states which really are meant to be defining the start
+ * and stop of the LED strobing. There is also the ON/OFF states which are
+ * used to provide us with a way of telling us that we should be turning
+ * the LED on and/or off.
+ *
+ * We translate these calls and pass them off to the MAC layer. They will
+ * be used to initialize a strobe, then on and off will be used to cycle
+ * between the patterns, and finally we will restore the original LED state.
+ *
+ * We will return 2 when we are requested to go active. This will tell the
+ * call that it will need to call back to turn on/off the LED twice every
+ * second.
+ *
+ * Return: blink in half second intervals on success, negative value on failure
+ */
+static int fbnic_set_phys_id(struct net_device *netdev,
+			     enum ethtool_phys_id_state phys_id_state)
+{
+	struct fbnic_net *fbn = netdev_priv(netdev);
+	struct fbnic_dev *fbd = fbn->fbd;
+	const struct fbnic_mac *mac;
+	int cycle_interval = 0;
+	int state;
+
+	mac = fbd->mac;
+
+	if (!mac || !mac->set_led_state)
+		return -EOPNOTSUPP;
+
+	switch (phys_id_state) {
+	case ETHTOOL_ID_ACTIVE:
+		state = FBNIC_LED_STROBE_INIT;
+		cycle_interval = 2;
+		break;
+	case ETHTOOL_ID_INACTIVE:
+		state = FBNIC_LED_RESTORE;
+		break;
+	case ETHTOOL_ID_ON:
+		state = FBNIC_LED_ON;
+		break;
+	case ETHTOOL_ID_OFF:
+		state = FBNIC_LED_OFF;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	mac->set_led_state(fbd, state);
+
+	return cycle_interval;
+}
+
 static void fbnic_get_link_ext_stats(struct net_device *netdev,
 				     struct ethtool_link_ext_stats *stats)
 {
@@ -2062,6 +2120,7 @@ static const struct ethtool_ops fbnic_ethtool_ops = {
 	.get_eth_mac_stats		= fbnic_get_eth_mac_stats,
 	.get_eth_ctrl_stats		= fbnic_get_eth_ctrl_stats,
 	.get_rmon_stats			= fbnic_get_rmon_stats,
+	.set_phys_id			= fbnic_set_phys_id,
 };
 
 void fbnic_set_ethtool_ops(struct net_device *dev)
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_led.c b/drivers/net/ethernet/meta/fbnic/fbnic_led.c
new file mode 100644
index 000000000000..44d0dc1be448
--- /dev/null
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_led.c
@@ -0,0 +1,228 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) Meta Platforms, Inc. and affiliates. */
+#include <linux/netdevice.h>
+#include <linux/pci.h>
+#include <uapi/linux/uleds.h>
+
+#include "fbnic.h"
+#include "fbnic_csr.h"
+#include "fbnic_mac.h"
+#include "fbnic_netdev.h"
+
+#define led_classdev_to_fbnic_led(cdev)  \
+	container_of(cdev, struct fbnic_led_cdev, led)
+
+static const char *fbnic_led_names[FBNIC_NUM_LEDS] = {
+	"activity",
+	"link-amber",
+	"link-blue"
+};
+
+static void fbnic_led_get_name(struct fbnic_dev *fbd,
+			       int led_idx, char *name)
+{
+	snprintf(name, LED_MAX_NAME_SIZE, "%s-%s",
+		 fbd->netdev->name, fbnic_led_names[led_idx]);
+}
+
+static int fbnic_led_get_idx(struct fbnic_dev *fbd,
+			     struct fbnic_led_cdev *ldev)
+{
+	return ldev - &fbd->leds[0];
+}
+
+static struct fbnic_dev *led_cdev_to_fbd(struct led_classdev *led_cdev)
+{
+	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
+
+	return ldev->fbd;
+}
+
+static u32 fbnic_led_get_supported_modes(struct fbnic_dev *fbd, int led_idx)
+{
+	u32 modes = 0;
+
+	if (led_idx == FBNIC_LED_ACTIVITY) {
+		modes = BIT(TRIGGER_NETDEV_TX) | BIT(TRIGGER_NETDEV_RX);
+
+		return modes;
+	}
+
+	/* Set modes for link LEDs - note 40G not supported */
+	modes = BIT(TRIGGER_NETDEV_LINK) |
+		BIT(TRIGGER_NETDEV_LINK_25000) |
+		BIT(TRIGGER_NETDEV_LINK_50000) |
+		BIT(TRIGGER_NETDEV_LINK_100000);
+
+	return modes;
+}
+
+static int fbnic_led_hw_ctl_set(struct led_classdev *led_cdev,
+				unsigned long flags)
+{
+	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
+	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
+	int led_idx = fbnic_led_get_idx(fbd, ldev);
+	u32 supported_modes;
+
+	supported_modes = fbnic_led_get_supported_modes(fbd, led_idx);
+
+	if (flags & ~supported_modes)
+		return -EINVAL;
+
+	/* Turn on activity LED only when both the TX and RX flags are set. */
+	if (led_idx == FBNIC_LED_ACTIVITY && (flags & supported_modes) &&
+	    flags != supported_modes) {
+		dev_warn(fbd->dev,
+			 "Invalid activity LED mode(s): 0x%lx\n", flags);
+		return -EINVAL;
+	}
+
+	/* Preserve the configured modes for restoration after LED strobe */
+	mutex_lock(&fbd->led_mutex);
+	ldev->enabled_modes = flags;
+
+	if (ldev->strobe_mode)
+		dev_warn(fbd->dev,
+			 "LED config takes effect after strobe completes.\n");
+
+	fbnic_led_update_csr(fbd);
+	mutex_unlock(&fbd->led_mutex);
+
+	return 0;
+}
+
+static int fbnic_led_hw_ctl_get(struct led_classdev *led_cdev,
+				unsigned long *flags)
+{
+	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
+	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
+
+	mutex_lock(&fbd->led_mutex);
+
+	*flags = ldev->enabled_modes;
+
+	mutex_unlock(&fbd->led_mutex);
+
+	return 0;
+}
+
+static struct device *fbnic_led_hw_ctl_get_device(struct led_classdev *led_cdev)
+{
+	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
+	struct net_device *netdev = fbd->netdev;
+
+	return &netdev->dev;
+}
+
+static int fbnic_led_hw_ctl_is_supported(struct led_classdev *led_cdev,
+					 unsigned long flags)
+{
+	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
+	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
+	int led_idx = fbnic_led_get_idx(fbd, ldev);
+	u32 modes;
+
+	modes = fbnic_led_get_supported_modes(fbd, led_idx);
+
+	if (led_idx == FBNIC_LED_ACTIVITY && (flags & modes) && flags != modes)
+		return -EOPNOTSUPP;
+	if (flags & ~modes)
+		return -EOPNOTSUPP;
+
+	return 0;
+}
+
+static int fbnic_led_brightness_set_blocking(struct led_classdev *led_cdev,
+					     enum led_brightness brightness)
+{
+	struct fbnic_led_cdev *ldev = led_classdev_to_fbnic_led(led_cdev);
+	struct fbnic_dev *fbd = led_cdev_to_fbd(led_cdev);
+	int led_idx = fbnic_led_get_idx(fbd, ldev);
+
+	mutex_lock(&fbd->led_mutex);
+	if (!brightness) {
+		fbd->leds[led_idx].enabled_modes = 0;
+		fbd->leds[led_idx].strobe_mode = 0;
+	} else {
+		u32 mode;
+
+		switch (led_idx) {
+		case FBNIC_LED_ACTIVITY:
+			fbd->leds[led_idx].enabled_modes =
+				BIT(TRIGGER_NETDEV_TX) | BIT(TRIGGER_NETDEV_RX);
+			break;
+		default:
+			mode = fbnic_led_get_link_speed_mode(fbd);
+			fbd->leds[led_idx].enabled_modes = mode;
+			break;
+		}
+	}
+
+	fbnic_led_update_csr(fbd);
+
+	mutex_unlock(&fbd->led_mutex);
+
+	return 0;
+}
+
+static int fbnic_led_setup(struct fbnic_dev *fbd, int led_idx)
+{
+	struct pci_dev *pdev = to_pci_dev(fbd->dev);
+	struct led_classdev *led_cdev;
+
+	fbd->leds[led_idx].fbd = fbd;
+	led_cdev = &fbd->leds[led_idx].led;
+	led_cdev->name = fbd->leds[led_idx].name;
+	fbnic_led_get_name(fbd, led_idx, fbd->leds[led_idx].name);
+	led_cdev->max_brightness = 1;
+	led_cdev->hw_control_trigger = "netdev";
+	led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
+	led_cdev->hw_control_set = fbnic_led_hw_ctl_set;
+	led_cdev->hw_control_get = fbnic_led_hw_ctl_get;
+	led_cdev->hw_control_get_device = fbnic_led_hw_ctl_get_device;
+	led_cdev->hw_control_is_supported = fbnic_led_hw_ctl_is_supported;
+	led_cdev->brightness_set_blocking = fbnic_led_brightness_set_blocking;
+
+	return led_classdev_register(&pdev->dev, led_cdev);
+}
+
+/**
+ * fbnic_led_init - initialize the linux led interface for fbnic
+ *
+ * @fbd: FBNIC device structure
+ *
+ * Return: zero on success, negative value on failure
+ *
+ * This function creates three led devices for the fbnic device. One for the
+ * activity LED and two for the color LEDs. The successful initialization
+ * creates <netdev>-activity, <netdev>-link-amber and <netdev>-link-blue
+ * under /sys/class/leds/
+ */
+int fbnic_led_init(struct fbnic_dev *fbd)
+{
+	int i, ret;
+
+	for (i = 0; i < FBNIC_NUM_LEDS; i++) {
+		ret = fbnic_led_setup(fbd, i);
+
+		if (ret)
+			goto err_led_setup;
+	}
+
+	return 0;
+
+err_led_setup:
+	while (i--)
+		led_classdev_unregister(&fbd->leds[i].led);
+
+	return ret;
+}
+
+void fbnic_led_exit(struct fbnic_dev *fbd)
+{
+	int i;
+
+	for (i = 0; i < FBNIC_NUM_LEDS; i++)
+		led_classdev_unregister(&fbd->leds[i].led);
+}
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
index 53b7a938b4c2..c6b1130f9159 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.c
@@ -623,6 +623,53 @@ static bool fbnic_pmd_update_state(struct fbnic_dev *fbd, bool signal_detect)
 	return false;
 }
 
+u32 fbnic_get_link_speed(u8 link_speed)
+{
+	switch (link_speed) {
+	case FBNIC_FW_LINK_MODE_25CR:
+		return SPEED_25000;
+	case FBNIC_FW_LINK_MODE_50CR2:
+	case FBNIC_FW_LINK_MODE_50CR:
+		return SPEED_50000;
+	case FBNIC_FW_LINK_MODE_100CR2:
+		return SPEED_100000;
+	default:
+		return 0;
+	}
+}
+
+static void fbnic_set_led_state(struct fbnic_dev *fbd, int state)
+{
+	mutex_lock(&fbd->led_mutex);
+
+	/* alternating amber,blue IDs device every half second */
+	switch (state) {
+	case FBNIC_LED_OFF: /* amber on, blue off */
+		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_ON;
+		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_OFF;
+		break;
+	case FBNIC_LED_ON: /* amber off, blue on */
+		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode = FBNIC_STROBE_OFF;
+		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode = FBNIC_STROBE_ON;
+		break;
+	case FBNIC_LED_RESTORE:
+		fbd->leds[FBNIC_LED_LINK_AMBER].strobe_mode =
+			FBNIC_STROBE_DISABLED;
+		fbd->leds[FBNIC_LED_LINK_BLUE].strobe_mode =
+			FBNIC_STROBE_DISABLED;
+		break;
+	case FBNIC_LED_STROBE_INIT: /* a no-op */
+		/* Initialization is a no-op; LED toggling happens on ON/OFF */
+		goto out_unlock;
+	default:
+		goto out_unlock;
+	}
+
+	fbnic_led_update_csr(fbd);
+out_unlock:
+	mutex_unlock(&fbd->led_mutex);
+}
+
 static bool fbnic_mac_get_link(struct fbnic_dev *fbd, u8 aui, u8 fec)
 {
 	bool link;
@@ -967,6 +1014,7 @@ static const struct fbnic_mac fbnic_mac_asic = {
 	.link_down = fbnic_mac_link_down_asic,
 	.link_up = fbnic_mac_link_up_asic,
 	.get_sensor = fbnic_mac_get_sensor_asic,
+	.set_led_state = fbnic_set_led_state,
 };
 
 /**
@@ -987,6 +1035,197 @@ int fbnic_mac_init(struct fbnic_dev *fbd)
 	return 0;
 }
 
+/**
+ * __fbnic_led_get_link_speed_mode - Get link speed mode
+ * @curr_speed: ethtool speed
+ *
+ * Return: netdev trigger bit on success, 0 if link speed is not supported
+ *
+ * Convert ethtool speed to mode bit using parameter
+ */
+static u32
+__fbnic_led_get_link_speed_mode(u32 curr_speed)
+{
+	switch (curr_speed) {
+	case SPEED_25000:
+		return BIT(TRIGGER_NETDEV_LINK_25000);
+	case SPEED_50000:
+		return BIT(TRIGGER_NETDEV_LINK_50000);
+	case SPEED_100000:
+		return BIT(TRIGGER_NETDEV_LINK_100000);
+	default:
+		return 0;
+	}
+}
+
+/**
+ * fbnic_led_get_link_speed_mode - Get link speed mode
+ * @fbd: FBNIC Device pointer
+ *
+ * Return: Link speed mode on success, 0 if link speed is not supported
+ *
+ * For the current link speed, this function returns trigger mode bit
+ */
+u32 fbnic_led_get_link_speed_mode(struct fbnic_dev *fbd)
+{
+	u32 curr_speed = fbnic_get_link_speed(fbd->fw_cap.link_speed);
+
+	return __fbnic_led_get_link_speed_mode(curr_speed);
+}
+
+/**
+ * fbnic_led_set_modes_ocp - Set LED state based on OCP link speed
+ * @fbd: FBNIC Device pointer
+ *
+ * Set LED state based on OCP link speed. This function sets up the
+ * LED state based on the current link speed while accounting for the
+ * OCP specs. Called from fbnic_led_link_up() on link state changes.
+ */
+void fbnic_led_set_modes_ocp(struct fbnic_dev *fbd)
+{
+	u32 speed_mode, curr_speed, max_speed;
+
+	lockdep_assert_held(&fbd->led_mutex);
+
+	/* Turn on the activity LED independent of the link speed */
+	fbd->leds[FBNIC_LED_ACTIVITY].enabled_modes = BIT(TRIGGER_NETDEV_TX) |
+						      BIT(TRIGGER_NETDEV_RX);
+	fbd->leds[FBNIC_LED_LINK_BLUE].enabled_modes = 0;
+	fbd->leds[FBNIC_LED_LINK_AMBER].enabled_modes = 0;
+
+	curr_speed = fbnic_get_link_speed(fbd->fw_cap.link_speed);
+	if (!curr_speed) {
+		dev_warn(fbd->dev,
+			 "Unsupported link speed detected.\n");
+		goto bail;
+	}
+
+	/* can't be zero */
+	speed_mode = __fbnic_led_get_link_speed_mode(curr_speed);
+
+	/* need max_speed for amber/blue leds values */
+	max_speed = fbnic_get_link_speed(fbd->fw_cap.max_link_speed);
+	if (!max_speed) {
+		dev_warn(fbd->dev,
+			 "Unsupported max link speed detected.\n");
+		goto bail;
+	}
+
+	/* Set the LED modes according to OCP specs */
+	if (curr_speed < max_speed)
+		fbd->leds[FBNIC_LED_LINK_AMBER].enabled_modes = speed_mode;
+	else
+		fbd->leds[FBNIC_LED_LINK_BLUE].enabled_modes = speed_mode;
+
+bail:
+	/* sync csr with above changes */
+	fbnic_led_update_csr(fbd);
+}
+
+static u32 fbnic_led_get_current_mode(struct fbnic_dev *fbd)
+{
+	u32 modes = BIT(TRIGGER_NETDEV_RX) | BIT(TRIGGER_NETDEV_TX);
+
+	if (fbd->led_link_up) {
+		modes |= BIT(TRIGGER_NETDEV_LINK);
+		modes |= fbnic_led_get_link_speed_mode(fbd);
+	}
+
+	return modes;
+}
+
+/**
+ * fbnic_led_get_state - Get current LED state
+ * @fbd: FBNIC Device pointer
+ * @led_idx: LED index
+ *
+ * Get current LED state. This function returns the current LED state
+ * based on the currently configured enabled modes. If current configured
+ * modes are not set, it returns LED_OFF.
+ */
+static int fbnic_led_get_state(struct fbnic_dev *fbd, int led_idx)
+{
+	u8 strobe_mode = fbd->leds[led_idx].strobe_mode;
+	int led_state = LED_OFF;
+	u32 mask;
+
+	if (strobe_mode == FBNIC_STROBE_ON)
+		return LED_ON;
+	if (strobe_mode == FBNIC_STROBE_OFF)
+		return LED_OFF;
+
+	mask = fbnic_led_get_current_mode(fbd);
+	led_state = (mask & fbd->leds[led_idx].enabled_modes) ?
+			LED_ON : LED_OFF;
+
+	return led_state;
+}
+
+/**
+ * fbnic_led_update_csr - Update LED CSR
+ * @fbd: FBNIC Device pointer
+ *
+ * This function updates the LED CSR. This should be called every time
+ * the link speed changes, or when the enabled modes are changed via
+ * the linux LED API.
+ */
+void fbnic_led_update_csr(struct fbnic_dev *fbd)
+{
+	u32 led_csr = FBNIC_SIG_LED_ACTIVITY_OFF;
+	int led_state;
+
+	lockdep_assert_held(&fbd->led_mutex);
+
+	led_state = fbnic_led_get_state(fbd, FBNIC_LED_ACTIVITY);
+	if (led_state == LED_ON)
+		led_csr = FBNIC_SIG_LED_ACTIVITY_DEFAULT;
+
+	led_state = fbnic_led_get_state(fbd, FBNIC_LED_LINK_AMBER);
+	if (led_state == LED_ON)
+		led_csr |= FBNIC_SIG_LED_AMBER_ON;
+
+	led_state = fbnic_led_get_state(fbd, FBNIC_LED_LINK_BLUE);
+	if (led_state == LED_ON)
+		led_csr |= FBNIC_SIG_LED_BLUE_ON;
+
+	dev_dbg(fbd->dev, "writing led_csr %x\n", led_csr);
+	wr32(fbd, FBNIC_SIG_LED, led_csr);
+}
+
+/**
+ * fbnic_led_link_up - Update LED state on link up
+ * @fbd: FBNIC Device pointer
+ *
+ * Called from phylink mac_link_up callback. Sets the internal link state
+ * and configures LED modes according to OCP specs based on current link speed.
+ */
+void fbnic_led_link_up(struct fbnic_dev *fbd)
+{
+	mutex_lock(&fbd->led_mutex);
+
+	fbd->led_link_up = true;
+	fbnic_led_set_modes_ocp(fbd);
+
+	mutex_unlock(&fbd->led_mutex);
+}
+
+/**
+ * fbnic_led_link_down - Update LED state on link down
+ * @fbd: FBNIC Device pointer
+ *
+ * Called from phylink mac_link_down callback. Clears the internal link state
+ * and updates the LED CSR to reflect link-down condition.
+ */
+void fbnic_led_link_down(struct fbnic_dev *fbd)
+{
+	mutex_lock(&fbd->led_mutex);
+
+	fbd->led_link_up = false;
+	fbnic_led_update_csr(fbd);
+
+	mutex_unlock(&fbd->led_mutex);
+}
+
 int fbnic_mac_ps_protect_to_config(struct fbnic_dev *fbd, u16 timeout_ms)
 {
 	u16 old_timeout_ms = fbd->ps_timeout;
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_mac.h b/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
index 10f30e0e8f69..089afdde7b55 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_mac.h
@@ -5,6 +5,8 @@
 #define _FBNIC_MAC_H_
 
 #include <linux/types.h>
+#include <linux/leds.h>
+#include <uapi/linux/uleds.h>
 
 struct fbnic_dev;
 
@@ -33,6 +35,27 @@ struct fbnic_dev;
 	FBNIC_MAC_RXB_PS_TO_MS(FIELD_MAX(FBNIC_RXB_PAUSE_STORM_THLD_TIME))
 
 #define FBNIC_MAX_JUMBO_FRAME_SIZE	9742
+#define FBNIC_NUM_LEDS			3
+
+struct fbnic_led_cdev {
+	char name[LED_MAX_NAME_SIZE];
+	struct led_classdev led;
+	struct fbnic_dev *fbd;
+	u32 enabled_modes;
+	u8 strobe_mode;
+};
+
+enum {
+	FBNIC_STROBE_DISABLED = 0,
+	FBNIC_STROBE_ON = 1,
+	FBNIC_STROBE_OFF = 2,
+};
+
+enum {
+	FBNIC_LED_ACTIVITY = 0,
+	FBNIC_LED_LINK_AMBER,
+	FBNIC_LED_LINK_BLUE,
+};
 
 /* States loosely based on section 136.8.11.7.5 of IEEE 802.3-2022 Ethernet
  * Standard.  These are needed to track the state of the PHY as it has a delay
@@ -58,6 +81,13 @@ enum {
 	FBNIC_LINK_EVENT_DOWN	= 2,
 };
 
+enum {
+	FBNIC_LED_STROBE_INIT,
+	FBNIC_LED_ON,
+	FBNIC_LED_OFF,
+	FBNIC_LED_RESTORE,
+};
+
 /* Treat the FEC bits as a bitmask laid out as follows:
  * Bit 0: RS Enabled
  * Bit 1: BASER(Firecode) Enabled
@@ -91,6 +121,29 @@ enum fbnic_sensor_id {
 	FBNIC_SENSOR_VOLTAGE,		/* Voltage in millivolts */
 };
 
+#define FBNIC_SIG_LED_ACTIVITY_DEFAULT			\
+	FIELD_PREP(FBNIC_SIG_LED_BLINK_RATE_MASK,	\
+		   FBNIC_SIG_LED_BLINK_RATE_5HZ)
+#define FBNIC_SIG_LED_ACTIVITY_ON			\
+	FIELD_PREP(FBNIC_SIG_LED_OVERRIDE_EN,		\
+		   FBNIC_SIG_LED_OVERRIDE_ACTIVITY)
+/* override_en=1 with override_val=0 forces the activity LED off
+ * while preserving the default blink rate setting
+ */
+#define FBNIC_SIG_LED_ACTIVITY_OFF			\
+	(FBNIC_SIG_LED_ACTIVITY_DEFAULT |		\
+	FBNIC_SIG_LED_ACTIVITY_ON)
+#define FBNIC_SIG_LED_AMBER_ON				\
+	(FIELD_PREP(FBNIC_SIG_LED_OVERRIDE_EN,		\
+		    FBNIC_SIG_LED_OVERRIDE_AMBER) |	\
+	FIELD_PREP(FBNIC_SIG_LED_OVERRIDE_VAL,		\
+		    FBNIC_SIG_LED_OVERRIDE_AMBER))
+#define FBNIC_SIG_LED_BLUE_ON				\
+	(FIELD_PREP(FBNIC_SIG_LED_OVERRIDE_EN,		\
+		    FBNIC_SIG_LED_OVERRIDE_BLUE) |	\
+	FIELD_PREP(FBNIC_SIG_LED_OVERRIDE_VAL,		\
+		    FBNIC_SIG_LED_OVERRIDE_BLUE))
+
 /* This structure defines the interface hooks for the MAC. The MAC hooks
  * will be configured as a const struct provided with a set of function
  * pointers.
@@ -112,6 +165,8 @@ enum fbnic_sensor_id {
  *	Configure MAC for link down event
  * void (*link_up)(struct fbnic_dev *fbd, bool tx_pause, bool rx_pause);
  *	Configure MAC for link up event;
+ * void (*set_led_state)(struct fbnic_dev *fbd, int state);
+ *	Configure MAC for physical identification states
  *
  */
 struct fbnic_mac {
@@ -139,10 +194,17 @@ struct fbnic_mac {
 	void (*link_up)(struct fbnic_dev *fbd, bool tx_pause, bool rx_pause);
 
 	int (*get_sensor)(struct fbnic_dev *fbd, int id, long *val);
+	void (*set_led_state)(struct fbnic_dev *fbd, int state);
 };
 
 int fbnic_mac_init(struct fbnic_dev *fbd);
 void fbnic_mac_get_fw_settings(struct fbnic_dev *fbd, u8 *aui, u8 *fec);
+u32 fbnic_led_get_link_speed_mode(struct fbnic_dev *fbd);
+u32 fbnic_get_link_speed(u8 link_speed);
+void fbnic_led_set_modes_ocp(struct fbnic_dev *fbd);
+void fbnic_led_update_csr(struct fbnic_dev *fbd);
+void fbnic_led_link_up(struct fbnic_dev *fbd);
+void fbnic_led_link_down(struct fbnic_dev *fbd);
 int fbnic_mac_ps_protect_to_config(struct fbnic_dev *fbd, u16 timeout);
 void fbnic_mac_ps_protect_handler(struct fbnic_dev *fbd);
 bool fbnic_mac_check_tx_pause(struct fbnic_dev *fbd);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_pci.c b/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
index 7e85b480203c..06a40081f603 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_pci.c
@@ -368,9 +368,16 @@ static int fbnic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		dev_err(&pdev->dev, "Netdev registration failed: %d\n", err);
 		goto ifm_destroy_ptp;
 	}
+	err = fbnic_led_init(fbd);
+	if (err) {
+		dev_err(&pdev->dev, "led init failed: %d\n", err);
+		goto led_init_fail;
+	}
 
 	return 0;
 
+led_init_fail:
+	fbnic_netdev_unregister(netdev);
 ifm_destroy_ptp:
 	fbnic_ptp_destroy(fbd);
 ifm_free_netdev:
@@ -408,6 +415,7 @@ static void fbnic_remove(struct pci_dev *pdev)
 	if (!fbnic_init_failure(fbd)) {
 		struct net_device *netdev = fbd->netdev;
 
+		fbnic_led_exit(fbd);
 		fbnic_netdev_unregister(netdev);
 		cancel_delayed_work_sync(&fbd->service_task);
 		fbnic_ptp_destroy(fbd);
diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c b/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
index 09c5225111be..86fccef901cc 100644
--- a/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
+++ b/drivers/net/ethernet/meta/fbnic/fbnic_phylink.c
@@ -154,6 +154,7 @@ fbnic_phylink_mac_link_down(struct phylink_config *config, unsigned int mode,
 	struct fbnic_dev *fbd = fbn->fbd;
 
 	fbd->mac->link_down(fbd);
+	fbnic_led_link_down(fbd);
 
 	fbn->link_down_events++;
 }
@@ -172,6 +173,7 @@ fbnic_phylink_mac_link_up(struct phylink_config *config,
 	fbnic_config_drop_mode(fbn, tx_pause);
 
 	fbd->mac->link_up(fbd, tx_pause, rx_pause);
+	fbnic_led_link_up(fbd);
 }
 
 static const struct phylink_mac_ops fbnic_phylink_mac_ops = {
-- 
2.43.0


