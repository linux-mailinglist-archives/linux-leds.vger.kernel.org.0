Return-Path: <linux-leds+bounces-7568-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGhZBw5GyWkAxAUAu9opvQ
	(envelope-from <linux-leds+bounces-7568-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 17:32:30 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 165553529BE
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 17:32:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFE153006217
	for <lists+linux-leds@lfdr.de>; Sun, 29 Mar 2026 15:32:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF3E37F747;
	Sun, 29 Mar 2026 15:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b="GszNliDQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from szelinsky.de (szelinsky.de [85.214.127.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E34437D12C;
	Sun, 29 Mar 2026 15:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.127.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774798331; cv=none; b=EsLBmDE37FKAh8gisdwRcttS/b2LbnVpUO00Wj4KkDl+YM5NYhJ4+XpQPWGkxHVOrYQSnAPXGepiDklY86oSV7EVaLfX/Uy+VMaWXZvcpZpwhqbosahDNJOBv5DWP9/jRYc+kuMrVH+Somz+BuhVe13BaG9NisZzG/M1TotcKWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774798331; c=relaxed/simple;
	bh=8CG25BeHU6d+Ih31bWlafNBiVxfB7C5bsiFNEZf6NJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JkFhIEhx8vTgYeyBXTIjGIKPlNm6BlVB9qxHBRkyEM0QrsynNZLNTE2S9FT0rTxTxlGUd01vaLuK15PLLudu2VTpLcH+qpLsKqIwPkHw29e2RE7XaQhIB5CPeo1xRP7un2lcVSDvoERpXK5Cf3txD3UWNGVCnSUDHAYoueg+R3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de; spf=pass smtp.mailfrom=szelinsky.de; dkim=temperror (0-bit key) header.d=szelinsky.de header.i=@szelinsky.de header.b=GszNliDQ; arc=none smtp.client-ip=85.214.127.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szelinsky.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szelinsky.de
Received: from localhost (localhost [127.0.0.1])
	by szelinsky.de (Postfix) with ESMTP id 75DC2E83AA3;
	Sun, 29 Mar 2026 17:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=szelinsky.de;
	s=mail; t=1774798328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yg+B/ANrPdV2YtI/3BdV2W2hBSJjxWxNPC6FA+t6CVA=;
	b=GszNliDQP25VeggidcWND/C9SyEYajxuNBwHS54kRcQ5UvbmVY8s8HwShEJJbtM74PKmYX
	2NuPEvZ8nOOManLQWKw0Zs8stT0he12WT0eNH3xg8h5AaXlE+kiOGqK/jWef8ClWYtQBvR
	h5bO7W6WrEc3Mb3kNJ6dEMapFeD6T6nbIdGBrR4tcXCbv27ePVl5OYpiKcvpI07PpCca6+
	WTfesfogv23xI3Up8MREPS6YonPVigWd2W3jElj8cHtsPNyFT7E4xFM+q6MOcXw4foT21c
	L8gLTDvy3m7Qf6Owih4yP94pMJyytuA7/TuoBLH2qW0rXf3JOZgsaUrB6sq21A==
X-Virus-Scanned: Debian amavisd-new at szelinsky.de
Received: from szelinsky.de ([127.0.0.1])
	by localhost (szelinsky.de [127.0.0.1]) (amavisd-new, port 10025)
	with ESMTP id 3Vq6YJG-r9Dm; Sun, 29 Mar 2026 17:32:08 +0200 (CEST)
Received: from p14sgen5.fritz.box (dslb-002-205-089-102.002.205.pools.vodafone-ip.de [2.205.89.102])
	by szelinsky.de (Postfix) with ESMTPSA;
	Sun, 29 Mar 2026 17:32:07 +0200 (CEST)
From: Carlo Szelinsky <github@szelinsky.de>
To: Oleksij Rempel <o.rempel@pengutronix.de>,
	Kory Maincent <kory.maincent@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Carlo Szelinsky <github@szelinsky.de>
Subject: [PATCH net-next v3 2/3] net: pse-pd: add devm_pse_poll_helper()
Date: Sun, 29 Mar 2026 17:31:23 +0200
Message-ID: <20260329153124.2823980-3-github@szelinsky.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329153124.2823980-1-github@szelinsky.de>
References: <20260329153124.2823980-1-github@szelinsky.de>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[szelinsky.de,quarantine];
	R_DKIM_ALLOW(-0.20)[szelinsky.de:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7568-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[github@szelinsky.de,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[szelinsky.de:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,szelinsky.de:dkim,szelinsky.de:email,szelinsky.de:mid,poll_work.work:url,ntf.id:url]
X-Rspamd-Queue-Id: 165553529BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Extract the common event handling loop from pse_isr() into a shared
pse_handle_events() function, and add a generic poll-based alternative
to the IRQ path for PSE controllers that lack interrupt support or
have IRQ lines not wired on the board.

The new devm_pse_poll_helper() function sets up a delayed work that
periodically calls the driver's map_event callback to detect state
changes, feeding events into the existing ntf_fifo / pse_send_ntf_worker
notification pipeline. This reuses the same pse_irq_desc interface as
the IRQ path — the driver provides a map_event callback that populates
per-PI notification arrays.

The poll worker uses system_freezable_wq to avoid running during system
suspend when the underlying hardware (e.g. I2C bus) may be inaccessible.

Work cancellation on teardown is handled via devm_add_action_or_reset()
to ensure the delayed work is cancelled before poll_notifs is freed
by devres, avoiding a use-after-free when devm_pse_poll_helper() is
called after devm_pse_controller_register() (devres LIFO ordering).

The poll interval is configurable via the DT property "poll-interval-ms"
and defaults to 500ms, balancing responsiveness against I2C bus load.

Signed-off-by: Carlo Szelinsky <github@szelinsky.de>
---
 drivers/net/pse-pd/pse_core.c | 166 ++++++++++++++++++++++++++++------
 include/linux/pse-pd/pse.h    |  12 +++
 2 files changed, 148 insertions(+), 30 deletions(-)

diff --git a/drivers/net/pse-pd/pse_core.c b/drivers/net/pse-pd/pse_core.c
index 3beaaaeec9e1..23783bf2edf4 100644
--- a/drivers/net/pse-pd/pse_core.c
+++ b/drivers/net/pse-pd/pse_core.c
@@ -14,10 +14,18 @@
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/rtnetlink.h>
+#include <linux/workqueue.h>
 #include <net/net_trackers.h>
 
 #define PSE_PW_D_LIMIT INT_MAX
 
+/*
+ * Default poll interval for controllers without IRQ support.
+ * 500ms provides a reasonable trade-off between responsiveness
+ * (event detection, PD detection) and I2C bus utilization.
+ */
+#define PSE_DEFAULT_POLL_INTERVAL_MS 500
+
 static DEFINE_MUTEX(pse_list_mutex);
 static LIST_HEAD(pse_controller_list);
 static DEFINE_XARRAY_ALLOC(pse_pw_d_map);
@@ -1238,66 +1246,103 @@ static int pse_set_config_isr(struct pse_controller_dev *pcdev, int id,
 }
 
 /**
- * pse_isr - IRQ handler for PSE
- * @irq: irq number
- * @data: pointer to user interrupt structure
+ * pse_handle_events - Process PSE events for all PIs
+ * @pcdev: a pointer to the PSE controller device
+ * @notifs: per-PI notification array
+ * @notifs_mask: bitmask of PIs with events
  *
- * Return: irqreturn_t - status of IRQ
+ * Common event handling shared between IRQ and poll paths.
+ * Caller must hold pcdev->lock.
  */
-static irqreturn_t pse_isr(int irq, void *data)
+static void pse_handle_events(struct pse_controller_dev *pcdev,
+			      unsigned long *notifs,
+			      unsigned long notifs_mask)
 {
-	struct pse_controller_dev *pcdev;
-	unsigned long notifs_mask = 0;
-	struct pse_irq_desc *desc;
-	struct pse_irq *h = data;
-	int ret, i;
-
-	desc = &h->desc;
-	pcdev = h->pcdev;
-
-	/* Clear notifs mask */
-	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
-	mutex_lock(&pcdev->lock);
-	ret = desc->map_event(irq, pcdev, h->notifs, &notifs_mask);
-	if (ret || !notifs_mask) {
-		mutex_unlock(&pcdev->lock);
-		return IRQ_NONE;
-	}
+	int i;
 
 	for_each_set_bit(i, &notifs_mask, pcdev->nr_lines) {
-		unsigned long notifs, rnotifs;
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
+	unsigned long notifs_mask = 0;
+	struct pse_irq *h = data;
+	int ret;
 
+	pcdev = h->pcdev;
+
+	/* Clear notifs mask */
+	memset(h->notifs, 0, pcdev->nr_lines * sizeof(*h->notifs));
+	mutex_lock(&pcdev->lock);
+	ret = h->desc.map_event(irq, pcdev, h->notifs, &notifs_mask);
+	if (ret || !notifs_mask) {
+		mutex_unlock(&pcdev->lock);
+		return IRQ_NONE;
+	}
+
+	pse_handle_events(pcdev, h->notifs, notifs_mask);
 	mutex_unlock(&pcdev->lock);
 
 	return IRQ_HANDLED;
 }
 
+static void pse_poll_worker(struct work_struct *work)
+{
+	struct pse_controller_dev *pcdev =
+		container_of(work, struct pse_controller_dev,
+			     poll_work.work);
+	unsigned long notifs_mask = 0;
+	int ret;
+
+	memset(pcdev->poll_notifs, 0,
+	       pcdev->nr_lines * sizeof(*pcdev->poll_notifs));
+	mutex_lock(&pcdev->lock);
+	ret = pcdev->poll_desc.map_event(0, pcdev, pcdev->poll_notifs,
+					 &notifs_mask);
+	if (!ret && notifs_mask)
+		pse_handle_events(pcdev, pcdev->poll_notifs, notifs_mask);
+	mutex_unlock(&pcdev->lock);
+
+	queue_delayed_work(system_freezable_wq, &pcdev->poll_work,
+			   msecs_to_jiffies(pcdev->poll_interval_ms));
+}
+
 /**
  * devm_pse_irq_helper - Register IRQ based PSE event notifier
  * @pcdev: a pointer to the PSE
@@ -1351,6 +1396,67 @@ int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 }
 EXPORT_SYMBOL_GPL(devm_pse_irq_helper);
 
+static void pse_poll_cancel(void *data)
+{
+	struct pse_controller_dev *pcdev = data;
+
+	cancel_delayed_work_sync(&pcdev->poll_work);
+}
+
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
+	int ret;
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
+	of_property_read_u32(dev->of_node, "poll-interval-ms",
+			     &pcdev->poll_interval_ms);
+	if (!pcdev->poll_interval_ms)
+		pcdev->poll_interval_ms = PSE_DEFAULT_POLL_INTERVAL_MS;
+
+	INIT_DELAYED_WORK(&pcdev->poll_work, pse_poll_worker);
+	pcdev->polling = true;
+
+	/* Register devm action to cancel poll work before poll_notifs is
+	 * freed by devres. This ensures correct teardown ordering since
+	 * devm_pse_poll_helper() is called after devm_pse_controller_register().
+	 */
+	ret = devm_add_action_or_reset(dev, pse_poll_cancel, pcdev);
+	if (ret)
+		return ret;
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
index 4e5696cfade7..44d5d10e239d 100644
--- a/include/linux/pse-pd/pse.h
+++ b/include/linux/pse-pd/pse.h
@@ -292,6 +292,11 @@ struct pse_ntf {
  * @pi: table of PSE PIs described in this controller device
  * @no_of_pse_pi: flag set if the pse_pis devicetree node is not used
  * @irq: PSE interrupt
+ * @polling: flag indicating poll-based event detection is active
+ * @poll_interval_ms: poll interval in milliseconds
+ * @poll_work: delayed work for poll-based event detection
+ * @poll_desc: copy of the driver's event descriptor for polling
+ * @poll_notifs: per-PI notification scratch space for poll worker
  * @pis_prio_max: Maximum value allowed for the PSE PIs priority
  * @supp_budget_eval_strategies: budget evaluation strategies supported
  *				 by the PSE
@@ -312,6 +317,11 @@ struct pse_controller_dev {
 	struct pse_pi *pi;
 	bool no_of_pse_pi;
 	int irq;
+	bool polling;
+	unsigned int poll_interval_ms;
+	struct delayed_work poll_work;
+	struct pse_irq_desc poll_desc;
+	unsigned long *poll_notifs;
 	unsigned int pis_prio_max;
 	u32 supp_budget_eval_strategies;
 	struct work_struct ntf_work;
@@ -345,6 +355,8 @@ int devm_pse_controller_register(struct device *dev,
 				 struct pse_controller_dev *pcdev);
 int devm_pse_irq_helper(struct pse_controller_dev *pcdev, int irq,
 			int irq_flags, const struct pse_irq_desc *d);
+int devm_pse_poll_helper(struct pse_controller_dev *pcdev,
+			 const struct pse_irq_desc *d);
 
 struct pse_control *of_pse_control_get(struct device_node *node,
 				       struct phy_device *phydev);
-- 
2.43.0


