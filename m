Return-Path: <linux-leds+bounces-6722-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPaKM97Gc2lZygAAu9opvQ
	(envelope-from <linux-leds+bounces-6722-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:07:10 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E14D7A022
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:07:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 835C930AEEC9
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 19:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE4F2C08C4;
	Fri, 23 Jan 2026 19:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="Uo7L9vAw"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D391118A6A7
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195121; cv=none; b=CA77Lz0RX5/7el6+vH/bRWLAMJ98bFmzbPZn9dOBZryC2CuA+dJP5VZhrkjZvW4OdXYgVyuZ3mshFm57DTUSaneu+KcMaHPFSFD1fd/t6Tul6ETKJf+iuIdr0U77HJ05ssKT6sejYanu5r/NrrAjhotzP6ba4q56p+G3hWiqoiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195121; c=relaxed/simple;
	bh=yHrnIhZKWe4aGD+KAtqFNtnxQQuW2y+OccQYipFK/7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVwZPrvKL6KwrbTk8TRugzxrCuEgfzxOSbBID+A4bZ8CGUJMzUtUSPQCqQ6Z8XB1YO586CjOFrsyAfkhNnnh4CTSco6MICHi32nGSn5B1ZdAkW9tvtQ+fHbjDOaZs5ksRKfjOj8EAivM3/yDuDCMbYfcDvrbAdrdYk5+ZVVSZBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=Uo7L9vAw; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 40DF624002D
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 20:05:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769195111; bh=rGNtFbWYd64mUfi+ig+LOirZBXBy+lx6XwWx6CydM4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=Uo7L9vAwSMoxyAKYyh9SHIoaO3zJA5Q8J0XI3Yv390lKrlM6xQA3D9lWsz4hDpkzR
	 JWc8crxB2qnmtSg7GGTPotWOxy8mMjWCJqqYazW3xgdJ6WFKvgQq0G71h3GPj3cZa3
	 prFBqevNirydIwpR7TwStZye3hYRf906004my9q3x1vC4KFvvDZr8iDmQ8wMuJUzg/
	 8Yvwy+EuvgySgKYVQmJZyVJIGnGDZeImcG+dumfkzjgjJ6jnF1M2Sh7eBNNS0slTTv
	 lrdnYsX6p0Pvh8zIOcSawerTkijEzA0Yreu8pCI4QWaERh7Do5G0wQBdHq7ezlakZH
	 vytgA1fafJwfQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dyS6r5DVYz9rxG;
	Fri, 23 Jan 2026 20:05:08 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 23 Jan 2026 19:05:10 +0000
Subject: [PATCH RFC 4/4] leds: add disk trigger for each ata port
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-ledtrig_disk_-v1-4-07004756467b@posteo.de>
References: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
In-Reply-To: <20260123-ledtrig_disk_-v1-0-07004756467b@posteo.de>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, 
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Jason Yan <yanaijie@huawei.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-ide@vger.kernel.org, linux-scsi@vger.kernel.org, 
 Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=10395;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=yHrnIhZKWe4aGD+KAtqFNtnxQQuW2y+OccQYipFK/7I=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpc8ZaPwsoDdqRRAKFR+lVPd/tLwEGbvuG7GXz0
 bvv9OS6Sc+JAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaXPGWhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9Ij0hAAqypk3zrACIIaIXHLmkRxaSAH163Chhu
 siD1Rli4m3YMcxnNm1gX2VT3jGiAGYitcNHYtU8FwxePRpAlnBhnhf5aF0ANZ81U/iOVc91FG53
 rm9SDymDK0lH+CeHa0NBIN9Ww1K/71T3XMvjInDCSUaLFWdSivQtkKUbixlXa/gFSe7+e117IxU
 wObiOCPprT39M87K+YgQWnlfwUqSk4sm/6hZnn1+qaEE+zyjIDW4QYu7vZNA6YcCEo4yIODpw0P
 t7cm0WzXU4rSuaNXkZ+nuMwfmombRCkxUVp7nnVv/zYudct/huhkxYBDs2gu34qP6hQToIM4wMm
 yO+A0vemQJ3rx78dJTy+sfXkNsRki+a63oSsJYtnV/Jph2c8t2EnEUwRvTQ5XKMUTyFxT8EHy/k
 qntNIbl20GAy7tAvsNWAhgK/6tqFK82QODZLT3k0LvUUOP7tO+9vdIZi8C73ntriDw3R5VtbP7Y
 pl8JiIHp7oK/oFme/7NO93NkAmAHDyGaWRGAYSdCGZcWsH+iU7LLWJWHZiklSjyF8wVW1NeRabr
 PS5D9cYHO3UxQSev+5PngXhGEKogYiUlnwGnuOPkX8YldlmWmLXxJuZKeyKGeNYBDa+Ivykc9lh
 Q0wnaoJZgc7auaK/sDpTGiLiWjR1PntdKxMmKSMO+t7NR/C0ntBo=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6722-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,oracle.com,huawei.com,HansenPartnership.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[posteo.de:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[markus.probst@posteo.de,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:email,posteo.de:dkim,posteo.de:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6E14D7A022
X-Rspamd-Action: no action

Register a disk trigger for each ata port. This trigger will only show
the activity for the ata port it has been registered for.

This allows individual leds to be mapped to one ata port.
This is especially useful for NAS devices, which have an own led for each
disk slot.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/ata/libata-core.c           |  22 +++++-
 drivers/leds/trigger/ledtrig-disk.c | 144 ++++++++++++++++++++++++++++++------
 drivers/scsi/libsas/sas_ata.c       |   3 +-
 include/linux/leds.h                |  16 +++-
 include/linux/libata.h              |   6 +-
 5 files changed, 161 insertions(+), 30 deletions(-)

diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index 09d8c035fcdf..796c46449298 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -4921,8 +4921,10 @@ void ata_qc_complete(struct ata_queued_cmd *qc)
 	struct ata_device *dev = qc->dev;
 	struct ata_eh_info *ehi = &dev->link->eh_info;
 
+#ifdef CONFIG_LEDS_TRIGGER_DISK
 	/* Trigger the LED (if available) */
-	ledtrig_disk_activity(!!(qc->tf.flags & ATA_TFLAG_WRITE));
+	ledtrig_disk_activity(ap->led_trigger, !!(qc->tf.flags & ATA_TFLAG_WRITE));
+#endif
 
 	/*
 	 * In order to synchronize EH with the regular execution path, a qc that
@@ -5538,10 +5540,13 @@ int sata_link_init_spd(struct ata_link *link)
  *	LOCKING:
  *	Inherited from calling layer (may sleep).
  */
-struct ata_port *ata_port_alloc(struct ata_host *host)
+struct ata_port *ata_port_alloc(struct ata_host *host, int port_no)
 {
 	struct ata_port *ap;
 	int id;
+#ifdef CONFIG_LEDS_TRIGGER_DISK
+	char name[32];
+#endif
 
 	ap = kzalloc(sizeof(*ap), GFP_KERNEL);
 	if (!ap)
@@ -5557,6 +5562,7 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 	ap->print_id = id;
 	ap->host = host;
 	ap->dev = host->dev;
+	ap->port_no = port_no;
 
 	mutex_init(&ap->scsi_scan_mutex);
 	INIT_DELAYED_WORK(&ap->hotplug_task, ata_scsi_hotplug);
@@ -5579,6 +5585,11 @@ struct ata_port *ata_port_alloc(struct ata_host *host)
 
 	ata_force_pflags(ap);
 
+#ifdef CONFIG_LEDS_TRIGGER_DISK
+	if (snprintf(name, sizeof(name), "%s-ata%d", dev_name(host->dev), port_no) < sizeof(name))
+		ap->led_trigger = ledtrig_disk_trigger_register(name);
+#endif
+
 	return ap;
 }
 EXPORT_SYMBOL_GPL(ata_port_alloc);
@@ -5588,6 +5599,10 @@ void ata_port_free(struct ata_port *ap)
 	if (!ap)
 		return;
 
+#ifdef CONFIG_LEDS_TRIGGER_DISK
+	ledtrig_disk_trigger_unregister(ap->led_trigger);
+#endif
+
 	kfree(ap->pmp_link);
 	kfree(ap->slave_link);
 	ida_free(&ata_ida, ap->print_id);
@@ -5690,11 +5705,10 @@ struct ata_host *ata_host_alloc(struct device *dev, int n_ports)
 	for (i = 0; i < n_ports; i++) {
 		struct ata_port *ap;
 
-		ap = ata_port_alloc(host);
+		ap = ata_port_alloc(host, i);
 		if (!ap)
 			goto err_out;
 
-		ap->port_no = i;
 		host->ports[i] = ap;
 	}
 
diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
index ed5ef83a5b35..fd25b4e45fb4 100644
--- a/drivers/leds/trigger/ledtrig-disk.c
+++ b/drivers/leds/trigger/ledtrig-disk.c
@@ -159,20 +159,22 @@ static int ledtrig_disk_activate(struct led_classdev *led_cdev)
 	return 0;
 }
 
-static struct led_trigger ledtrig_disk = {
-	.name = "disk-activity",
-	.activate = ledtrig_disk_activate,
-	.groups = ledtrig_disk_groups,
-};
-static struct led_trigger ledtrig_disk_read = {
-	.name = "disk-read",
-	.activate = ledtrig_disk_activate,
-	.groups = ledtrig_disk_groups,
-};
-static struct led_trigger ledtrig_disk_write = {
-	.name = "disk-write",
-	.activate = ledtrig_disk_activate,
-	.groups = ledtrig_disk_groups,
+static struct ledtrig_disk_trigger ledtrig_disk = {
+	.all = {
+		.name = "disk-activity",
+		.activate = ledtrig_disk_activate,
+		.groups = ledtrig_disk_groups,
+	},
+	.read = {
+		.name = "disk-read",
+		.activate = ledtrig_disk_activate,
+		.groups = ledtrig_disk_groups,
+	},
+	.write = {
+		.name = "disk-write",
+		.activate = ledtrig_disk_activate,
+		.groups = ledtrig_disk_groups,
+	},
 };
 
 static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
@@ -189,21 +191,121 @@ static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
 	rcu_read_unlock();
 }
 
-void ledtrig_disk_activity(bool write)
+static void ledtrig_disk_trigger_activity(struct ledtrig_disk_trigger *trig, bool write)
 {
-	ledtrig_disk_blink_oneshot(&ledtrig_disk);
+	if (IS_ERR_OR_NULL(trig))
+		return;
+	ledtrig_disk_blink_oneshot(&trig->all);
 	if (write)
-		ledtrig_disk_blink_oneshot(&ledtrig_disk_write);
+		ledtrig_disk_blink_oneshot(&trig->write);
 	else
-		ledtrig_disk_blink_oneshot(&ledtrig_disk_read);
+		ledtrig_disk_blink_oneshot(&trig->read);
+}
+
+void ledtrig_disk_activity(struct ledtrig_disk_trigger *port, bool write)
+{
+	ledtrig_disk_trigger_activity(&ledtrig_disk, write);
+	ledtrig_disk_trigger_activity(port, write);
 }
 EXPORT_SYMBOL(ledtrig_disk_activity);
 
+struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name)
+{
+	struct ledtrig_disk_trigger *trigger = kzalloc(sizeof(*trigger), GFP_KERNEL);
+	int ret, n;
+
+	if (!trigger)
+		return ERR_PTR(-ENOMEM);
+
+	trigger->all.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
+	if (!trigger->all.name) {
+		ret = -ENOMEM;
+		goto err1;
+	}
+
+	n = snprintf((char *)trigger->all.name, TRIG_NAME_MAX, "%s-disk-activity", name);
+	if (n >= TRIG_NAME_MAX) {
+		ret = -E2BIG;
+		goto err1;
+	}
+
+	trigger->all.activate = ledtrig_disk_activate;
+	trigger->all.groups = ledtrig_disk_groups;
+
+	ret = led_trigger_register(&trigger->all);
+	if (ret)
+		goto err1;
+
+	trigger->read.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
+	if (!trigger->read.name) {
+		ret = -ENOMEM;
+		goto err2;
+	}
+
+	n = snprintf((char *)trigger->read.name, TRIG_NAME_MAX, "%s-disk-read", name);
+	if (n >= TRIG_NAME_MAX) {
+		ret = -E2BIG;
+		goto err2;
+	}
+
+	trigger->read.activate = ledtrig_disk_activate;
+	trigger->read.groups = ledtrig_disk_groups;
+
+	ret = led_trigger_register(&trigger->read);
+	if (ret)
+		goto err2;
+
+	trigger->write.name = kzalloc(TRIG_NAME_MAX, GFP_KERNEL);
+	if (!trigger->write.name) {
+		ret = -ENOMEM;
+		goto err3;
+	}
+
+	n = snprintf((char *)trigger->write.name, TRIG_NAME_MAX, "%s-disk-write", name);
+	if (n >= TRIG_NAME_MAX) {
+		ret = -E2BIG;
+		goto err3;
+	}
+
+	trigger->write.activate = ledtrig_disk_activate;
+	trigger->write.groups = ledtrig_disk_groups;
+
+	ret = led_trigger_register(&trigger->write);
+	if (ret)
+		goto err3;
+
+	return trigger;
+
+err3:
+	led_trigger_unregister(&trigger->read);
+err2:
+	led_trigger_unregister(&trigger->all);
+err1:
+	kfree(trigger->all.name);
+	kfree(trigger->read.name);
+	kfree(trigger->write.name);
+	kfree(trigger);
+
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL(ledtrig_disk_trigger_register);
+
+void ledtrig_disk_trigger_unregister(struct ledtrig_disk_trigger *trig)
+{
+	if (IS_ERR_OR_NULL(trig))
+		return;
+
+	led_trigger_unregister(&trig->all);
+	led_trigger_unregister(&trig->read);
+	led_trigger_unregister(&trig->write);
+}
+EXPORT_SYMBOL(ledtrig_disk_trigger_unregister);
+
 static int __init ledtrig_disk_init(void)
 {
-	led_trigger_register(&ledtrig_disk);
-	led_trigger_register(&ledtrig_disk_read);
-	led_trigger_register(&ledtrig_disk_write);
+	led_trigger_register(&ledtrig_disk.all);
+	led_trigger_register(&ledtrig_disk.read);
+	led_trigger_register(&ledtrig_disk.write);
 
 	return 0;
 }
diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
index bcecb4911da9..8841850684f7 100644
--- a/drivers/scsi/libsas/sas_ata.c
+++ b/drivers/scsi/libsas/sas_ata.c
@@ -587,14 +587,13 @@ int sas_ata_init(struct domain_device *found_dev)
 
 	ata_host_init(ata_host, ha->dev, &sas_sata_ops);
 
-	ap = ata_port_alloc(ata_host);
+	ap = ata_port_alloc(ata_host, 0);
 	if (!ap) {
 		pr_err("ata_port_alloc failed.\n");
 		rc = -ENODEV;
 		goto free_host;
 	}
 
-	ap->port_no = 0;
 	ap->pio_mask = ATA_PIO4;
 	ap->mwdma_mask = ATA_MWDMA2;
 	ap->udma_mask = ATA_UDMA6;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index b16b803cc1ac..3221be97e9c0 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -619,10 +619,22 @@ enum led_trigger_netdev_modes {
 };
 
 /* Trigger specific functions */
+struct ledtrig_disk_trigger {
+	struct led_trigger all;
+	struct led_trigger read;
+	struct led_trigger write;
+};
 #ifdef CONFIG_LEDS_TRIGGER_DISK
-void ledtrig_disk_activity(bool write);
+struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name);
+void ledtrig_disk_trigger_unregister(struct ledtrig_disk_trigger *trig);
+void ledtrig_disk_activity(struct ledtrig_disk_trigger *port, bool write);
 #else
-static inline void ledtrig_disk_activity(bool write) {}
+static inline struct ledtrig_disk_trigger *ledtrig_disk_trigger_register(const char *name)
+{
+	return ERR_PTR(-EOPNOTSUPP);
+}
+static inline void ledtrig_disk_trigger_unregister(struct ledtrig_disk_trigger *trig) {}
+static inline void ledtrig_disk_activity(struct ledtrig_disk_trigger *port, bool write) {}
 #endif
 
 #ifdef CONFIG_LEDS_TRIGGER_MTD
diff --git a/include/linux/libata.h b/include/linux/libata.h
index 39534fafa36a..50124d170d13 100644
--- a/include/linux/libata.h
+++ b/include/linux/libata.h
@@ -940,6 +940,10 @@ struct ata_port {
 #ifdef CONFIG_ATA_ACPI
 	struct ata_acpi_gtm	__acpi_init_gtm; /* use ata_acpi_init_gtm() */
 #endif
+
+#ifdef CONFIG_LEDS_TRIGGER_DISK
+	struct ledtrig_disk_trigger *led_trigger;
+#endif
 };
 
 /* The following initializer overrides a method to NULL whether one of
@@ -1307,7 +1311,7 @@ extern int sata_link_scr_lpm(struct ata_link *link, enum ata_lpm_policy policy,
 			     bool spm_wakeup);
 extern int ata_slave_link_init(struct ata_port *ap);
 extern void ata_port_probe(struct ata_port *ap);
-extern struct ata_port *ata_port_alloc(struct ata_host *host);
+extern struct ata_port *ata_port_alloc(struct ata_host *host, int port_no);
 extern void ata_port_free(struct ata_port *ap);
 extern int ata_tport_add(struct device *parent, struct ata_port *ap);
 extern void ata_tport_delete(struct ata_port *ap);

-- 
2.52.0


