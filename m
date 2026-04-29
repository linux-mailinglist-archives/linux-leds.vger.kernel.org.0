Return-Path: <linux-leds+bounces-7915-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Eo1Aid58mnjrgEAu9opvQ
	(envelope-from <linux-leds+bounces-7915-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 23:33:27 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED65A49A9AF
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 23:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 05EE83006225
	for <lists+linux-leds@lfdr.de>; Wed, 29 Apr 2026 21:33:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15E8E3B47DA;
	Wed, 29 Apr 2026 21:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="lGnWxEqr"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B63A3B38A9;
	Wed, 29 Apr 2026 21:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777498382; cv=none; b=Y5whe09rr1HYExu0HypUJmMbOvGiVsyZ2XSF64ZqG2vwbhVoC2vdoar6w/0bjtvdHpPLmEcyawTQczabOXEpk6zkiYl4x8NUhSaZ2LDOlyCoZYA7vG6AW5guG8R0S4KdhF76Z5TIpNaasFVxF60OfcIGlZScOV0Xvpz7A1zgI7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777498382; c=relaxed/simple;
	bh=mZcmwZLKKEhnE7GQDGSXxsM/QNK458g7tqex2QpiSko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3ifO1HUkwe+FgpwRKyLCTC/Gt+XRj14iQgNyd6S/1WEwxzLD1cF2XsvUvspD/CH8JB1ODMf5T12eXQJ+w0U++3C5HibzdfQW3X0Y14s/aSbBOPCQrumDRijqFmwNGlbshDCtP3NRfJ9O+Y1j9mLBqJNLT3ZDIyUNNsOO2h0Ht4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=lGnWxEqr; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 50B08E83735;
	Wed, 29 Apr 2026 23:32:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1777498373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=21Hg9iwiNFQZe6EDCKJbi+24cPilqeuIOW1lFSBTBNI=;
	b=lGnWxEqrSKYB285NZTMqsH2EISDm587xwsf5RBHzoa//hxv2PbkZvfQMXZabiQALLaOWcp
	kvx/lSXWsVSRC8PCzWS8Q277XiLLBniI5foON+N9NIFIchmbjSQNt/Zxod4GM9kP1k5zNi
	vFXcteoGiuT+/0/M1A1cg1oeWMPLDZTpSIcEN1GvbssKNXpo8DaNbc4Xz2pqKEJqX7dlX2
	qHrWvpF9nJtJPPZU7vN3BjY6UXA6Mt1kf54W+IO4FHhg7y/xl3NlsHp3W6K8LxRAK+UpxC
	7SbE0hTxSOazz/7xM6LIdOi5m/fbHM0XK2gN4CcGwZu6aSGH2Uv4g5QtEztAkg==
X-Virus-Scanned: Debian amavis at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
 by localhost (szelinsky.de [127.0.0.1]) (amavis, port 10025) with ESMTP
 id E5VpiegtBmeH; Wed, 29 Apr 2026 23:32:53 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Wed, 29 Apr 2026 23:32:52 +0200 (CEST)
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
Subject: [PATCH net-next v5 1/2] net: pse-pd: add devm_pse_poll_helper()
Date: Wed, 29 Apr 2026 23:32:23 +0200
Message-ID: <20260429213224.1747410-2-github@szelinsky.de>
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
X-Rspamd-Queue-Id: ED65A49A9AF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-7915-lists,linux-leds=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_HAS_DN(0.00)[]

Extract the common event handling loop from pse_isr() into a shared
pse_handle_events() function, and add a generic poll-based alternative
to the IRQ path for PSE controllers that lack interrupt support or
have IRQ lines not wired on the board.

The new devm_pse_poll_helper() function sets up a delayed work that
periodically calls the driver's map_event callback to detect state
changes, feeding events into the existing ntf_fifo / pse_send_ntf_worker
notification pipeline. This reuses the same pse_irq_desc interface as
the IRQ path: the driver provides a map_event callback that populates
per-PI notification arrays.

The poll worker uses system_freezable_wq to avoid running during system
suspend when the underlying hardware (e.g. I2C bus) may be inaccessible.

Cancel the poll work explicitly in pse_controller_unregister() (next to
the existing disable_irq() for the IRQ path) so it cannot outlive the
controller it pushes events into. This avoids relying on devres LIFO
ordering between devm_pse_controller_register() and devm_pse_poll_helper()
when a driver follows the standard pattern of setting up the helper
before registering the controller.

The notifs_mask is allocated as a real bitmap via devm_bitmap_zalloc()
and passed to pse_handle_events() and the driver's map_event callback
as a pointer (mirroring the pattern from commit 5099807f335c
("net: pse-pd: fix out-of-bounds bitmap access in pse_isr() on 32-bit"))
so for_each_set_bit() does not read past a single unsigned long when
nr_lines > BITS_PER_LONG.

The poll interval defaults to 500ms, balancing responsiveness against
bus load (e.g. I2C).

Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 157 +++++++++++++++++++++++++++-------
 include/linux/pse-pd/pse.h    |  14 +++
 2 files changed, 140 insertions(+), 31 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 87aa4f4e9724..b7ffec0c942c 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -14,10 +14,17 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/rtnetlink.h>
+#include <linux/workqueue.h>
 #include <net/net_trackers.h>
 
 #define PSE_PW_D_LIMIT INT_MAX
 
+/* Default poll interval for controllers without IRQ support.
+ * 500ms provides a reasonable trade-off between responsiveness
+ * (event detection, PD detection) and I2C bus utilization.
+ */
+#define PSE_DEFAULT_POLL_INTERVAL_MS 500
+
 static DEFINE_MUTEX(pse_list_mutex);
 static LIST_HEAD(pse_controller_list);
 static DEFINE_XARRAY_ALLOC(pse_pw_d_map);
@@ -1118,6 +1125,8 @@ void pse_controller_unregister(struct pse_controller_dev *pcdev)
 	pse_release_pis(pcdev);
 	if (pcdev->irq)
 		disable_irq(pcdev->irq);
+	if (pcdev->polling)
+		cancel_delayed_work_sync(&pcdev->poll_work);
 	cancel_work_sync(&pcdev->ntf_work);
 	kfifo_free(&pcdev->ntf_fifo);
 	mutex_lock(&pse_list_mutex);
@@ -1239,66 +1248,104 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 }
 
 /**
- * pse_isr - IRQ handler for PSE
- * @irq: irq number
- * @data: pointer to user interrupt structure
+ * pse_handle_events - Process PSE events for all PIs
+ * @pcdev: a pointer to the PSE controller device
+ * @notifs: per-PI notification array
+ * @notifs_mask: bitmap of PIs with events (sized for pcdev->nr_lines)
  *
- * Return: irqreturn_t - status of IRQ
+ * Common event handling shared between IRQ and poll paths.
+ * Caller must hold pcdev->lock.
  */
-static irqreturn_t pse_isr(int irq, void *data)
+static void pse_handle_events(struct pse_controller_dev *pcdev,
+			      unsigned long *notifs,
+			      unsigned long *notifs_mask)
 {
-	struct pse_controller_dev *pcdev;
-	struct pse_irq_desc *desc;
-	struct pse_irq *h = data;
-	int ret, i;
-
-	desc = &h->desc;
-	pcdev = h->pcdev;
-
-	/* Clear notifs mask */
-	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
-	bitmap_zero(h->notifs_mask, pcdev->nr_lines);
-	mutex_lock(&pcdev->lock);
-	ret = desc->map_event(irq, pcdev, h->notifs, h->notifs_mask);
-	if (ret || bitmap_empty(h->notifs_mask, pcdev->nr_lines)) {
-		mutex_unlock(&pcdev->lock);
-		return IRQ_NONE;
-	}
+	int i;
 
-	for_each_set_bit(i, h->notifs_mask, pcdev->nr_lines) {
-		unsigned long notifs, rnotifs;
+	for_each_set_bit(i, notifs_mask, pcdev->nr_lines) {
+		unsigned long pi_notifs, rnotifs;
 		struct pse_ntf ntf = {};
+		int ret;
 
 		/* Do nothing PI not described */
 		if (!pcdev->pi[i].rdev)
 			continue;
 
-		notifs = h->notifs[i];
+		pi_notifs = notifs[i];
 		if (pse_pw_d_is_sw_pw_control(pcdev, pcdev->pi[i].pw_d)) {
-			ret = pse_set_config_isr(pcdev, i, notifs);
+			ret = pse_set_config_isr(pcdev, i, pi_notifs);
 			if (ret)
-				notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
+				pi_notifs |= ETHTOOL_PSE_EVENT_SW_PW_CONTROL_ERROR;
 		}
 
-		dev_dbg(h->pcdev->dev,
-			"Sending PSE notification EVT 0x%lx\n", notifs);
+		dev_dbg(pcdev->dev,
+			"Sending PSE notification EVT 0x%lx\n", pi_notifs);
 
-		ntf.notifs = notifs;
+		ntf.notifs = pi_notifs;
 		ntf.id = i;
 		kfifo_in_spinlocked(&pcdev->ntf_fifo, &ntf, 1,
 				    &pcdev->ntf_fifo_lock);
 		schedule_work(&pcdev->ntf_work);
 
-		rnotifs = pse_to_regulator_notifs(notifs);
+		rnotifs = pse_to_regulator_notifs(pi_notifs);
 		regulator_notifier_call_chain(pcdev->pi[i].rdev, rnotifs,
 					      NULL);
 	}
+}
+
+/**
+ * pse_isr - IRQ handler for PSE
+ * @irq: irq number
+ * @data: pointer to user interrupt structure
+ *
+ * Return: irqreturn_t - status of IRQ
+ */
+static irqreturn_t pse_isr(int irq, void *data)
+{
+	struct pse_controller_dev *pcdev;
+	struct pse_irq *h = data;
+	int ret;
+
+	pcdev = h->pcdev;
 
+	/* Clear notifs mask */
+	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
+	bitmap_zero(h->notifs_mask, pcdev->nr_lines);
+	mutex_lock(&pcdev->lock);
+	ret = h->desc.map_event(irq, pcdev, h->notifs, h->notifs_mask);
+	if (ret || bitmap_empty(h->notifs_mask, pcdev->nr_lines)) {
+		mutex_unlock(&pcdev->lock);
+		return IRQ_NONE;
+	}
+
+	pse_handle_events(pcdev, h->notifs, h->notifs_mask);
 	mutex_unlock(&pcdev->lock);
 
 	return IRQ_HANDLED;
 }
 
+static void pse_poll_worker(struct work_struct *work)
+{
+	struct pse_controller_dev *pcdev =
+		container_of(work, struct pse_controller_dev,
+			     poll_work.work);
+	int ret;
+
+	memset(pcdev->poll_notifs, 0,
+	       pcdev->nr_lines * sizeof(*pcdev->poll_notifs));
+	bitmap_zero(pcdev->poll_notifs_mask, pcdev->nr_lines);
+	mutex_lock(&pcdev->lock);
+	ret = pcdev->poll_desc.map_event(0, pcdev, pcdev->poll_notifs,
+					 pcdev->poll_notifs_mask);
+	if (!ret && !bitmap_empty(pcdev->poll_notifs_mask, pcdev->nr_lines))
+		pse_handle_events(pcdev, pcdev->poll_notifs,
+				  pcdev->poll_notifs_mask);
+	mutex_unlock(&pcdev->lock);
+
+	queue_delayed_work(system_freezable_wq, &pcdev->poll_work,
+			   msecs_to_jiffies(pcdev->poll_interval_ms));
+}
+
 /**
  * devm_pse_irq_helper - Register IRQ based PSE event notifier
  * @pcdev: a pointer to the PSE
@@ -1356,6 +1403,54 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 }
 EXPORT_SYMBOL_GPL(devm_pse_irq_helper);
 
+/**
+ * devm_pse_poll_helper - Register poll-based PSE event notifier
+ * @pcdev: a pointer to the PSE controller device
+ * @d: PSE event description (uses same pse_irq_desc as IRQ path)
+ *
+ * For PSE controllers without IRQ support or with IRQ not wired. Sets
+ * up a delayed work that periodically calls the driver's map_event
+ * callback to detect state changes, feeding events into the standard
+ * notification pipeline.
+ *
+ * The poll worker uses system_freezable_wq to ensure it does not run
+ * during system suspend while the hardware may be inaccessible.
+ *
+ * Return: 0 on success and errno on failure
+ */
+int devm_pse_poll_helper(struct pse_controller_dev *pcdev,
+			 const struct pse_irq_desc *d)
+{
+	struct device *dev = pcdev->dev;
+
+	if (!d || !d->map_event || !d->name)
+		return -EINVAL;
+
+	pcdev->poll_desc = *d;
+	pcdev->poll_notifs = devm_kcalloc(dev, pcdev->nr_lines,
+					  sizeof(*pcdev->poll_notifs),
+					  GFP_KERNEL);
+	if (!pcdev->poll_notifs)
+		return -ENOMEM;
+
+	pcdev->poll_notifs_mask = devm_bitmap_zalloc(dev, pcdev->nr_lines,
+						     GFP_KERNEL);
+	if (!pcdev->poll_notifs_mask)
+		return -ENOMEM;
+
+	if (!pcdev->poll_interval_ms)
+		pcdev->poll_interval_ms = PSE_DEFAULT_POLL_INTERVAL_MS;
+
+	INIT_DELAYED_WORK(&pcdev->poll_work, pse_poll_worker);
+	pcdev->polling = true;
+
+	queue_delayed_work(system_freezable_wq, &pcdev->poll_work,
+			   msecs_to_jiffies(pcdev->poll_interval_ms));
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(devm_pse_poll_helper);
+
 /* PSE control section */
 
 static void __pse_control_release(struct kref *kref)
diff --git a/include/linux/pse-pd/pse.h b/include/linux/pse-pd/pse.h
index 4e5696cfade7..4b5d5b11a084 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -292,6 +292,12 @@ struct pse_ntf {
  * @pi: table of PSE PIs described in this controller device
  * @no_of_pse_pi: flag set if the pse_pis devicetree node is not used
  * @irq: PSE interrupt
+ * @polling: flag indicating poll-based event detection is active
+ * @poll_interval_ms: poll interval in milliseconds
+ * @poll_work: delayed work for poll-based event detection
+ * @poll_desc: copy of the driver's event descriptor for polling
+ * @poll_notifs: per-PI notification scratch space for poll worker
+ * @poll_notifs_mask: bitmap of PIs with events for poll worker
  * @pis_prio_max: Maximum value allowed for the PSE PIs priority
  * @supp_budget_eval_strategies: budget evaluation strategies supported
  *				 by the PSE
@@ -312,6 +318,12 @@ struct pse_controller_dev {
 	struct pse_pi *pi;
 	bool no_of_pse_pi;
 	int irq;
+	bool polling;
+	unsigned int poll_interval_ms;
+	struct delayed_work poll_work;
+	struct pse_irq_desc poll_desc;
+	unsigned long *poll_notifs;
+	unsigned long *poll_notifs_mask;
 	unsigned int pis_prio_max;
 	u32 supp_budget_eval_strategies;
 	struct work_struct ntf_work;
@@ -345,6 +357,8 @@ int devm_pse_controller_register(struct device *dev,
 				 struct pse_controller_dev *pcdev);
 int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 			int irq_flags, const struct pse_irq_desc *d);
+int devm_pse_poll_helper(struct pse_controller_dev *pcdev,
+			 const struct pse_irq_desc *d);
 
 struct pse_control *of_pse_control_get(struct device_node *node,
 				       struct phy_device *phydev);
-- 
2.43.0


