Return-Path: <linux-leds+bounces-7446-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gGtlIg2iwWknUQQAu9opvQ
	(envelope-from <linux-leds+bounces-7446-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:26:53 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE02B2FD306
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 21:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 450943037EDF
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2026 20:16:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAC1F3E5EC0;
	Mon, 23 Mar 2026 20:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="hjjdUcgo"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFC43E4C6D;
	Mon, 23 Mar 2026 20:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774296894; cv=none; b=iYRYRfUqovHNfexpPPEFQ9D5zxO6KtgG8dfV+XMUCDy1P+M06F9dYWQAajGVJa/BuEIjm/6wOe95dxx6UQgHkXhQISJzhYF0m7RgJOTM8+YW/kqnzE/gedBI1RB+r9TNysgFflImHyV5u1FKx+g2ghzmibLVDO0LlYBfYOPJSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774296894; c=relaxed/simple;
	bh=xIuyFFYzrTGav19cDx4U+PygV5HR+bfaBfS9E+y36FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o/bDLF08vfgQ2/d2B1GUkzmU92QCzlYdiYYXh+Q0Bu1azAfRw2hJSUFcW79Q0NlH9kOLFPAuEldAWpaWN+un8g23h2m30RlBGZiVYDHbowNg9I0DPvfa0/1aqUtxun4G5OMa+CrUHWBP7+z7TexTFEQq3ogcDGpk+TYoCqZfGgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=hjjdUcgo; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 692E7E8311E;
	Mon, 23 Mar 2026 21:14:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774296889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFC9cutiEgKCUXhdtLKt/3r1EejqZ5VsK2QaVFyuwJE=;
	b=hjjdUcgo17e3SupyKvT6jIvgJB4QQZ6EworLob3jzb3lkqbbUPVuuqcc1Bf8Y8BA/9o9h0
	5lTels3ZyuoJTHtqS5q42th1PtBWYREfhEqhqHUchF8FwkUoYARMqwFAcudiWE/SBn1B/s
	YQNMtPomnHbjBiT6Y2O8uNUqWNhQa/Axn0+tQRmAhYSz4i1aHchTI27cb2Z1aDa3mh05XH
	W3Rf1AeG7O3f9++Ax0A9ZiU+lQx9Sp0gJjcpMOVenc/UcqdvRBuDdkAP+APGI+PSBIRF0i
	mMoBaVmatrKWmEUjZkxe1WLI6GEf09Mi49lb0W+mM9XfacQvMqcMJYHhxUsuYw==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id tQGYwVGxNtok; Mon, 23 Mar 2026 21:14:49 +0100 (CET)
Received: from p14sgen5.fritz.box (dslb-002-205-089-065.002.205.pools.vodafone-ip.de [2.205.89.65])
	by szelinsky.de (Postfix) with ESMTPSA;
	Mon, 23 Mar 2026 21:14:49 +0100 (CET)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH v2 3/3] net: pse-pd: add LED trigger support via notification path
Date: Mon, 23 Mar 2026 21:12:25 +0100
Message-ID: <20260323201225.1836561-4-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323201225.1836561-1-github@szelinsky.de>
References: <20260323201225.1836561-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-7446-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,szelinsky.de:dkim,szelinsky.de:email,szelinsky.de:mid]
X-Rspamd-Queue-Id: EE02B2FD306
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add per-PI "delivering" and "enabled" LED triggers to the PSE core
subsystem. Instead of polling from LED-specific code, LED state is
updated from the shared pse_handle_events() function whenever the
IRQ or poll path detects a state change.

This ensures LED triggers react to the same events that drive netlink
notifications and regulator callbacks, without duplicating the polling
logic.

Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 119 +++++++++++++++++++++++++++++++++-
 include/linux/pse-pd/pse.h    |  22 +++++++
 2 files changed, 140 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 3202c19ef602..0e96c22493a4 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -12,6 +12,7 @@
 #include <linux/phy.h>
 #include <linux/pse-pd/pse.h>
 #include <linux/regulator/driver.h>
+#include <linux/leds.h>
 #include <linux/regulator/machine.h>
 #include <linux/rtnetlink.h>
 #include <net/net_trackers.h>
@@ -1037,6 +1038,107 @@ static void pse_send_ntf_worker(struct work_struct *work)
 	}
 }
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
+/**
+ * pse_led_update - Update LED triggers for a PI based on current state
+ * @pcdev: PSE controller device
+ * @id: PI index
+ *
+ * Queries the current power status and admin state of the PI and
+ * fires LED trigger events on state changes. Called from the
+ * notification path whenever any event occurs for this PI.
+ *
+ * Must be called with pcdev->lock held.
+ */
+static void pse_led_update(struct pse_controller_dev *pcdev, int id)
+{
+	struct pse_pi_led_triggers *trigs;
+	struct pse_pw_status pw_status = {};
+	struct pse_admin_state admin_state = {};
+	bool delivering, enabled;
+
+	if (!pcdev->pi_led_trigs)
+		return;
+
+	trigs = &pcdev->pi_led_trigs[id];
+	if (!trigs->delivering.name)
+		return;
+
+	if (pcdev->ops->pi_get_pw_status(pcdev, id, &pw_status))
+		return;
+	if (pcdev->ops->pi_get_admin_state(pcdev, id, &admin_state))
+		return;
+
+	delivering = pw_status.c33_pw_status ==
+		ETHTOOL_C33_PSE_PW_D_STATUS_DELIVERING;
+	enabled = admin_state.c33_admin_state ==
+		ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED;
+
+	if (trigs->last_delivering != delivering) {
+		trigs->last_delivering = delivering;
+		led_trigger_event(&trigs->delivering,
+				  delivering ? LED_FULL : LED_OFF);
+	}
+
+	if (trigs->last_enabled != enabled) {
+		trigs->last_enabled = enabled;
+		led_trigger_event(&trigs->enabled,
+				  enabled ? LED_FULL : LED_OFF);
+	}
+}
+
+static int pse_led_triggers_register(struct pse_controller_dev *pcdev)
+{
+	struct device *dev = pcdev->dev;
+	const char *node_name;
+	int i, ret;
+
+	node_name = dev->of_node ? dev->of_node->name : dev_name(dev);
+
+	pcdev->pi_led_trigs = devm_kcalloc(dev, pcdev->nr_lines,
+					   sizeof(*pcdev->pi_led_trigs),
+					   GFP_KERNEL);
+	if (!pcdev->pi_led_trigs)
+		return -ENOMEM;
+
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		struct pse_pi_led_triggers *trigs = &pcdev->pi_led_trigs[i];
+
+		/* Skip PIs not described in device tree */
+		if (!pcdev->no_of_pse_pi && !pcdev->pi[i].np)
+			continue;
+
+		trigs->delivering.name = devm_kasprintf(dev, GFP_KERNEL,
+							"%s:port%d:delivering",
+							node_name, i);
+		if (!trigs->delivering.name)
+			return -ENOMEM;
+
+		ret = devm_led_trigger_register(dev, &trigs->delivering);
+		if (ret)
+			return ret;
+
+		trigs->enabled.name = devm_kasprintf(dev, GFP_KERNEL,
+						     "%s:port%d:enabled",
+						     node_name, i);
+		if (!trigs->enabled.name)
+			return -ENOMEM;
+
+		ret = devm_led_trigger_register(dev, &trigs->enabled);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+#else
+static inline void pse_led_update(struct pse_controller_dev *pcdev, int id) {}
+static int pse_led_triggers_register(struct pse_controller_dev *pcdev)
+{
+	return 0;
+}
+#endif /* CONFIG_LEDS_TRIGGERS */
+
 /**
  * pse_controller_register - register a PSE controller device
  * @pcdev: a pointer to the initialized PSE controller device
@@ -1111,6 +1213,14 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	list_add(&pcdev->list, &pse_controller_list);
 	mutex_unlock(&pse_list_mutex);
 
+	ret = pse_led_triggers_register(pcdev);
+	if (ret) {
+		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
+			 ret);
+		/* Ensure pse_led_update() is a no-op on partial failure */
+		pcdev->pi_led_trigs = NULL;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(pse_controller_register);
@@ -1266,7 +1376,14 @@ static void pse_handle_events(struct pse_controller_dev *pcdev,
 		struct pse_ntf ntf = {};
 		int ret;
 
-		/* Do nothing PI not described */
+		/* Update LEDs for described PIs regardless of consumer state.
+		 * LED triggers are registered at controller init, before any
+		 * PHY claims a PSE control, so rdev may still be NULL here.
+		 */
+		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
+			pse_led_update(pcdev, i);
+
+		/* Skip regulator/netlink path for PIs without consumers */
 		if (!pcdev->pi[i].rdev)
 			continue;
 
diff --git a/include/linux/pse-pd/pse.h b/include/linux/pse-pd/pse.h
index 44d5d10e239d..0058636a6299 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -10,6 +10,7 @@
 #include <linux/kfifo.h>
 #include <uapi/linux/ethtool.h>
 #include <uapi/linux/ethtool_netlink_generated.h>
+#include <linux/leds.h>
 #include <linux/regulator/driver.h>
 
 /* Maximum current in uA according to IEEE 802.3-2022 Table 145-1 */
@@ -266,6 +267,23 @@ struct pse_pi {
 	int pw_allocated_mW;
 };
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
+/**
+ * struct pse_pi_led_triggers - LED trigger state for a PSE PI
+ *
+ * @delivering: LED trigger for power delivering state
+ * @enabled: LED trigger for admin enabled state
+ * @last_delivering: cached delivering state for change detection
+ * @last_enabled: cached enabled state for change detection
+ */
+struct pse_pi_led_triggers {
+	struct led_trigger delivering;
+	struct led_trigger enabled;
+	bool last_delivering;
+	bool last_enabled;
+};
+#endif
+
 /**
  * struct pse_ntf - PSE notification element
  *
@@ -303,6 +321,7 @@ struct pse_ntf {
  * @ntf_work: workqueue for PSE notification management
  * @ntf_fifo: PSE notifications FIFO
  * @ntf_fifo_lock: protect @ntf_fifo writer
+ * @pi_led_trigs: per-PI LED trigger state array
  */
 struct pse_controller_dev {
 	const struct pse_controller_ops *ops;
@@ -327,6 +346,9 @@ struct pse_controller_dev {
 	struct work_struct ntf_work;
 	DECLARE_KFIFO_PTR(ntf_fifo, struct pse_ntf);
 	spinlock_t ntf_fifo_lock; /* Protect @ntf_fifo writer */
+#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
+	struct pse_pi_led_triggers *pi_led_trigs;
+#endif
 };
 
 /**
-- 
2.43.0


