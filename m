Return-Path: <linux-leds+bounces-7679-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKyxDmP02GmskAgAu9opvQ
	(envelope-from <linux-leds+bounces-7679-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 15:00:19 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16F3D7CF8
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 15:00:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1251D3091BA6
	for <lists+linux-leds@lfdr.de>; Fri, 10 Apr 2026 12:45:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125DE20459A;
	Fri, 10 Apr 2026 12:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="DOEv11Si"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4B1E5B9A;
	Fri, 10 Apr 2026 12:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825114; cv=none; b=adpAbRa35vIEo2k5NDTuRPQT9IGO0ApX9SJxgvGRQpvOqjKAr7y/xkjvozgGqDJhaCvC52NdfQqFpe05F44sAkO9Jo0zDnZlSHGxDYJYSgqTmbHIWYyyhTgul/hUAb1RD89wqJKYuHFNGOCR5w57KRku1vvCyvROJfKzob4wwO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825114; c=relaxed/simple;
	bh=JVKCIjSEjXkoIs2Kc7tpybTuPn45OutIXF3Wz7khgX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csLBuVPNI4NVDM1G979Rc5ZTM7GyJ791enr/1U9QbGZud5IM/txyjShcK9JyIQs0bIjz5/v28TYlS42GylF1rmJKGaKFQ5Wd9IvxR814lefzZEfYERGj11hUWsjEwQ3KtJSM1egTlJELKsbWLZzw4fmhN8/W7+a3BkI42+2h4zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=DOEv11Si; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id EC23CE839FB;
	Fri, 10 Apr 2026 14:45:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1775825109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azwLzJpT42EVMDaAK406Ouw+675VeRplpbKZU+nYqBk=;
	b=DOEv11SibUH+sK9Mns6MT42Zv9AwnL4z08BIX6wngqxAvQjyEyh+UgUbscajNvIQTsMlZH
	XY8eGlwfC1W3uGp1zOhwot9TPyJSIEKkETtvKBJFtc5RWMRoX9K1HPk3I03nYlMVtXzXo7
	ciYZ4Kv8C+6+Wodwcp0K1bzkD1vRsu/Gj6owIBuY3EeoEaSfG2eXi9QeByfOCjRMi4YhKe
	ZNaX8bAhYTBTu0BI3SbDHqZlXoDYNxVdGzmDtn8YbU+hTHPrxv9gOnicvvYw51XzEGIPVL
	OXRggZS+7HJiJp4REkaTiE94eWVALM+P1NGO0ieoeTpWW7yMscMS2sAMLtySwQ==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id mqgd0-d9VW6h; Fri, 10 Apr 2026 14:45:09 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Fri, 10 Apr 2026 14:45:09 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH net-next v4 2/2] net: pse-pd: add LED trigger support via notification path
Date: Fri, 10 Apr 2026 14:44:28 +0200
Message-ID: <20260410124428.809943-3-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260410124428.809943-1-github@szelinsky.de>
References: <20260410124428.809943-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7679-lists,linux-leds=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[szelinsky.de:dkim,szelinsky.de:email,szelinsky.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 3E16F3D7CF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add per-PI "delivering" and "enabled" LED triggers to the PSE core
subsystem. LED state is updated from the shared pse_handle_events()
function whenever the IRQ or poll path detects a state change, as well
as from the regulator enable/disable paths so that host-initiated
admin state changes via ethtool are immediately reflected.

Both C33 and PoDL power status and admin state are checked so that LED
triggers work for both controller types.

Trigger names use dev_name(dev) (e.g. "pse-1-003c:port0:delivering")
to ensure uniqueness when multiple PSE controllers are present on the
same system.

Initial LED state is queried at registration time so already-active
ports are reflected immediately without waiting for a hardware event.

LED trigger registration is performed before adding the controller to
the global list, avoiding a race where an IRQ or poll event could
invoke pse_led_update() on a partially initialized trigger.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202603251254.o5PqMBRU-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202603251250.cuMCk5Yv-lkp@intel.com/
Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 134 +++++++++++++++++++++++++++++++++-
 include/linux/pse-pd/pse.h    |  22 ++++++
 2 files changed, 154 insertions(+), 2 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index f641a6fa087f..dfc84340afb9 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -12,9 +12,10 @@
 #include <linux/phy.h>
 #include <linux/pse-pd/pse.h>
 #include <linux/regulator/driver.h>
+#include <linux/leds.h>
+#include <linux/workqueue.h>
 #include <linux/regulator/machine.h>
 #include <linux/rtnetlink.h>
-#include <linux/workqueue.h>
 #include <net/net_trackers.h>
 
 #define PSE_PW_D_LIMIT INT_MAX
@@ -670,6 +671,111 @@ static int _pse_pi_delivery_power_sw_pw_ctrl(struct pse_controller_dev *pcdev,
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGERS)
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
+		ETHTOOL_C33_PSE_PW_D_STATUS_DELIVERING ||
+		pw_status.podl_pw_status ==
+		ETHTOOL_PODL_PSE_PW_D_STATUS_DELIVERING;
+	enabled = admin_state.c33_admin_state ==
+		ETHTOOL_C33_PSE_ADMIN_STATE_ENABLED ||
+		admin_state.podl_admin_state ==
+		ETHTOOL_PODL_PSE_ADMIN_STATE_ENABLED;
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
+
+		ret = devm_led_trigger_register(dev, &trigs->delivering);
+		if (ret)
+			return ret;
+
+		trigs->enabled.name = devm_kasprintf(dev, GFP_KERNEL,
+						     "pse-%s:port%d:enabled",
+						     dev_id, i);
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
 static int pse_pi_enable(struct regulator_dev *rdev)
 {
 	struct pse_controller_dev *pcdev = rdev_get_drvdata(rdev);
@@ -695,6 +801,7 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 			pcdev->pi[id].admin_state_enabled = 1;
 			ret = 0;
 		}
+		pse_led_update(pcdev, id);
 		mutex_unlock(&pcdev->lock);
 		return ret;
 	}
@@ -702,6 +809,7 @@ static int pse_pi_enable(struct regulator_dev *rdev)
 	ret = ops->pi_enable(pcdev, id);
 	if (!ret)
 		pcdev->pi[id].admin_state_enabled = 1;
+	pse_led_update(pcdev, id);
 	mutex_unlock(&pcdev->lock);
 
 	return ret;
@@ -719,6 +827,7 @@ static int pse_pi_disable(struct regulator_dev *rdev)
 	ret = _pse_pi_disable(pcdev, id);
 	if (!ret)
 		pi->admin_state_enabled = 0;
+	pse_led_update(pcdev, id);
 
 	mutex_unlock(&pcdev->lock);
 	return 0;
@@ -1108,6 +1217,20 @@ int pse_controller_register(struct pse_controller_dev *pcdev)
 	if (ret)
 		return ret;
 
+	ret = pse_led_triggers_register(pcdev);
+	if (ret) {
+		dev_warn(pcdev->dev, "Failed to register LED triggers: %d\n",
+			 ret);
+	}
+
+	/* Query initial LED state for all PIs so already-active ports
+	 * are reflected immediately without waiting for a hardware event.
+	 */
+	for (i = 0; i < pcdev->nr_lines; i++) {
+		if (pcdev->no_of_pse_pi || pcdev->pi[i].np)
+			pse_led_update(pcdev, i);
+	}
+
 	mutex_lock(&pse_list_mutex);
 	list_add(&pcdev->list, &pse_controller_list);
 	mutex_unlock(&pse_list_mutex);
@@ -1265,7 +1388,14 @@ static void pse_handle_events(struct pse_controller_dev *pcdev,
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


