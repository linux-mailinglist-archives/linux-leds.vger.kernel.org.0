Return-Path: <linux-leds+bounces-7916-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEDyLTt58mnjrgEAu9opvQ
	(envelope-from <linux-leds+bounces-7916-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 23:33:47 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD95449A9C5
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 23:33:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 102AB301B1DA
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 21:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E28813B38A0;
	Wed, 29 Apr 2026 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="SMTVCpcM"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017363B2FE1;
	Wed, 29 Apr 2026 21:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498386; cv=none; b=GfZWT+LgQg42w44XvENEeWwwRi8bOskCTuR/XBrv6Qr5D/KzcZhCAIKaAj+ByI6Z3vuqHWHy0c5oHZUmK+J1onxmLwIasqtrxh0ywr0p3EFG3rKH5OT4+IkCtUuM4NUce6phmXOmmCeWqCKE4xFrn7UsJV1HWQdOB5Nfb3dDkZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498386; c=relaxed/simple;
	bh=naMgGoPobYy3+Z53SE87atkPF93pxALNkBgCzwvHJRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s/HxOfLQ0xRCaLw1sragzLSZvi9ZeoJkrvC1fAo0OcvAEaOyrDspHQK9uQrOmnV3AnBfVUFk+pXRDpWQVNUGEp8Ys71Q++MsV58XUaVbj7BtVnr31RAWZs2QiKFAUC/W4fiu9U+Auxjj+jD72yOi/EFeDSyidW1CwXseqAcOujQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=SMTVCpcM; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 3B107E83563;
	Wed, 29 Apr 2026 23:33:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1777498383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CmPrjGiR21Cu6k9gRrkx6D5ePgbYzoL1rr4mVdnIeGg=;
	b=SMTVCpcMbdPV4aXOEgkzZ02ufnoMTtq0V5N2ADqyPxagaYEsqiSaLqM9IUDTuQEcTWAds9
	xxbY3QtAcQwPbBb+eEv7cZgY/Tcrqio8JrQuyf00ejdiQhGoaJnvt2WckMl+mtBt8M38hz
	P9v3bBhW73KtuliRhAoIl6akv7JZIp0Jsttkfifq9ttC1yyHx06sjBfsF1jyv3gjsqmOmZ
	8tu95+XD7267ysopLgXu3ofV18pB0HRvbSWtJ8HpmlyZgZOni9xt9wjqUD7o8Tc9hK+hvw
	XfkufW9R3HNvzG42vxRSErGdpRD6OpOujGauvwmcYQ7Jj7VVXyGCX/8tcwriMw==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id ltVUqJReRUGy; Wed, 29 Apr 2026 23:33:03 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 29 Apr 2026 23:33:01 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net-next v5 2/2] net: pse-pd: add LED trigger support via notification path
Date: Wed, 29 Apr 2026 23:32:24 +0200
Message-ID: <20260429213224.1747410-3-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260429213224.1747410-1-github@szelinsky.de>
References: <20260410124428.809943-1-github@szelinsky.de>
 <20260429213224.1747410-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: AD95449A9C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-7916-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_HAS_DN(0.00)[]

Add per-PI "delivering" and "enabled" LED triggers to the PSE core
subsystem. LED state is updated from the shared pse_handle_events()
function whenever the IRQ or poll path detects a state change, as well
as from the regulator enable/disable paths so that host-initiated
admin state changes via ethtool are immediately reflected.

Each trigger registers an .activate callback that syncs a freshly-bound
LED to the cached state, so an LED bound after pse_controller_register()
(e.g. via sysfs) does not stay dark until the next hardware event.

The post-registration initial-state pass is run under pcdev->lock,
matching pse_led_update()'s documented locking contract and avoiding
races with concurrent regulator_enable() paths that share last_delivering
/ last_enabled and the hardware ops.

If pse_led_triggers_register() fails partway through, the partially-
registered triggers are detached by clearing pcdev->pi_led_trigs, so the
existing early-return guard in pse_led_update() is the single point of
truth and a stale led_trigger.name cannot fool the dereference path
into touching an unregistered trigger.

The per-PI trigger struct lives outside the CONFIG_LEDS_TRIGGERS ifdef
to avoid forcing every reference site to be wrapped; the LED-specific
code paths remain ifdef'd.

Link: https://lore.kernel.org/oe-kbuild-all/202603251254.o5PqMBRU-lkp@intel.com/
Link: https://lore.kernel.org/oe-kbuild-all/202603251250.cuMCk5Yv-lkp@intel.com/
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 200 +++++++++++++++++++++++++++++++++-
 include/linux/pse-pd/pse.h    |  18 +++
 2 files changed, 217 insertions(+), 1 deletion(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index b7ffec0c942c..bff97211ae22 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/ethtool.h>
 #include <linux/ethtool_netlink.h>
+#include <linux/leds.h>
 #include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/pse-pd/pse.h>
@@ -669,6 +670,168 @@ static int _pse_pi_delivery_power_sw_pw_ctrl(struct pse_controller_dev *pcdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
+/**
+ * pse_pi_get_states - Fetch current delivering/enabled state for a PI
+ * @pcdev: PSE controller device
+ * @id: PI index
+ * @delivering: out, set to true if PI is currently delivering power
+ * @enabled: out, set to true if PI is administratively enabled
+ *
+ * Queries hardware via the controller ops. Caller must hold pcdev->lock.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+static int pse_pi_get_states(struct pse_controller_dev *pcdev, int id,
+			     bool *delivering, bool *enabled)
+{
+	struct pse_pw_status pw_status = {};
+	struct pse_admin_state admin_state = {};
+	int ret;
+
+	ret = pcdev->ops->pi_get_pw_status(pcdev, id, &pw_status);
+	if (ret)
+		return ret;
+	ret = pcdev->ops->pi_get_admin_state(pcdev, id, &admin_state);
+	if (ret)
+		return ret;
+
+	*delivering = pw_status.c33_pw_status ==
+		ETHTOOL_C33_PSE_PW_D_STATUS_DELIVERING ||
+		pw_status.podl_pw_status ==
+		ETHTOOL_PODL_PSE_PW_D_STATUS_DELIVERING;
+	*enabled = admin_state.c33_admin_state ==
+		ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED ||
+		admin_state.podl_admin_state ==
+		ETHTOOL_PODL_PSE_ADMIN_STATE_ENABLED;
+
+	return 0;
+}
+
+/**
+ * pse_led_update - Update LED triggers for a PI based on current state
+ * @pcdev: PSE controller device
+ * @id: PI index
+ *
+ * Queries the current power status and admin state of the PI and
+ * fires LED trigger events on state changes. Called from the
+ * notification path and the regulator enable/disable paths.
+ *
+ * Must be called with pcdev->lock held.
+ */
+static void pse_led_update(struct pse_controller_dev *pcdev, int id)
+{
+	struct pse_pi_led_triggers *trigs;
+	bool delivering, enabled;
+
+	if (!pcdev->pi_led_trigs)
+		return;
+
+	trigs = &pcdev->pi_led_trigs[id];
+	if (!trigs->delivering.name)
+		return;
+
+	if (pse_pi_get_states(pcdev, id, &delivering, &enabled))
+		return;
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
+/* Sync a freshly-bound LED to the cached trigger state. Without these
+ * .activate callbacks, an LED bound to the trigger after
+ * pse_controller_register() (e.g. via sysfs) would stay dark until the
+ * next hardware event toggles state.
+ */
+static int pse_led_delivering_activate(struct led_classdev *led_cdev)
+{
+	struct pse_pi_led_triggers *trigs =
+		container_of(led_cdev->trigger, struct pse_pi_led_triggers,
+			     delivering);
+
+	led_set_brightness(led_cdev,
+			   trigs->last_delivering ? LED_FULL : LED_OFF);
+	return 0;
+}
+
+static int pse_led_enabled_activate(struct led_classdev *led_cdev)
+{
+	struct pse_pi_led_triggers *trigs =
+		container_of(led_cdev->trigger, struct pse_pi_led_triggers,
+			     enabled);
+
+	led_set_brightness(led_cdev,
+			   trigs->last_enabled ? LED_FULL : LED_OFF);
+	return 0;
+}
+
+static int pse_led_triggers_register(struct pse_controller_dev *pcdev)
+{
+	struct device *dev = pcdev->dev;
+	const char *dev_id;
+	int i, ret;
+
+	dev_id = dev_name(dev);
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
+							"pse-%s:port%d:delivering",
+							dev_id, i);
+		if (!trigs->delivering.name)
+			return -ENOMEM;
+		trigs->delivering.activate = pse_led_delivering_activate;
+
+		ret = devm_led_trigger_register(dev, &trigs->delivering);
+		if (ret) {
+			trigs->delivering.name = NULL;
+			return ret;
+		}
+
+		trigs->enabled.name = devm_kasprintf(dev, GFP_KERNEL,
+						     "pse-%s:port%d:enabled",
+						     dev_id, i);
+		if (!trigs->enabled.name)
+			return -ENOMEM;
+		trigs->enabled.activate = pse_led_enabled_activate;
+
+		ret = devm_led_trigger_register(dev, &trigs->enabled);
+		if (ret) {
+			trigs->enabled.name = NULL;
+			return ret;
+		}
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
 static int pse_pi_enable(struct regulator_dev *rdev)
 {
 	struct pse_controller_dev *pcdev = rdev_get_drvdata(rdev);
@@ -694,6 +857,7 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 			pcdev->pi[id].admin_state_enabled = 1;
 			ret = 0;
 		}
+		pse_led_update(pcdev, id);
 		mutex_unlock(&pcdev->lock);
 		return ret;
 	}
@@ -701,6 +865,7 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 	ret = ops->pi_enable(pcdev, id);
 	if (!ret)
 		pcdev->pi[id].admin_state_enabled = 1;
+	pse_led_update(pcdev, id);
 	mutex_unlock(&pcdev->lock);
 
 	return ret;
@@ -718,6 +883,7 @@ static int pse_pi_disable(struct regulator_dev *rdev)
 	ret = _pse_pi_disable(pcdev, id);
 	if (!ret)
 		pi->admin_state_enabled = 0;
+	pse_led_update(pcdev, id);
 
 	mutex_unlock(&pcdev->lock);
 	return 0;
@@ -1107,6 +1273,31 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	if (ret)
 		return ret;
 
+	ret = pse_led_triggers_register(pcdev);
+	if (ret) {
+		/* LED triggers are non-essential for power delivery; warn
+		 * and continue. NULL out the array so pse_led_update()'s
+		 * early-return guard short-circuits any later calls onto
+		 * partially-registered triggers.
+		 */
+		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
+			 ret);
+		pcdev->pi_led_trigs = NULL;
+	}
+
+	/* Query initial LED state for all PIs so already-active ports
+	 * are reflected immediately without waiting for a hardware event.
+	 * Hold pcdev->lock: regulators are already exposed and a
+	 * concurrent regulator_enable() would race on the hw callbacks
+	 * and on last_delivering / last_enabled.
+	 */
+	mutex_lock(&pcdev->lock);
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
+			pse_led_update(pcdev, i);
+	}
+	mutex_unlock(&pcdev->lock);
+
 	mutex_lock(&pse_list_mutex);
 	list_add(&pcdev->list, &pse_controller_list);
 	mutex_unlock(&pse_list_mutex);
@@ -1267,7 +1458,14 @@ static void pse_handle_events(struct pse_controller_dev *pcdev,
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
index 4b5d5b11a084..ba321e669642 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -10,6 +10,7 @@
 #include <linux/kfifo.h>
 #include <uapi/linux/ethtool.h>
 #include <uapi/linux/ethtool_netlink_generated.h>
+#include <linux/leds.h>
 #include <linux/regulator/driver.h>
 
 /* Maximum current in uA according to IEEE 802.3-2022 Table 145-1 */
@@ -266,6 +267,21 @@ struct pse_pi {
 	int pw_allocated_mW;
 };
 
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
+
 /**
  * struct pse_ntf - PSE notification element
  *
@@ -304,6 +320,7 @@ struct pse_ntf {
  * @ntf_work: workqueue for PSE notification management
  * @ntf_fifo: PSE notifications FIFO
  * @ntf_fifo_lock: protect @ntf_fifo writer
+ * @pi_led_trigs: per-PI LED trigger state array
  */
 struct pse_controller_dev {
 	const struct pse_controller_ops *ops;
@@ -329,6 +346,7 @@ struct pse_controller_dev {
 	struct work_struct ntf_work;
 	DECLARE_KFIFO_PTR(ntf_fifo, struct pse_ntf);
 	spinlock_t ntf_fifo_lock; /* Protect @ntf_fifo writer */
+	struct pse_pi_led_triggers *pi_led_trigs;
 };
 
 /**
-- 
2.43.0


