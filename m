Return-Path: <linux-leds+bounces-6721-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2PHxIJXGc2lZygAAu9opvQ
	(envelope-from <linux-leds+bounces-6721-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:05:57 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F53779FBF
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 20:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC6953067378
	for <lists+linux-leds@lfdr.de>; Fri, 23 Jan 2026 19:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D470B280A58;
	Fri, 23 Jan 2026 19:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="gqjUnrdf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC76D23817E
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 19:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769195118; cv=none; b=JWvFHfRe4HDgrH3BB+zq7++Zbz4m5VlyXzOERfc/AUAsr5ojUoNioXbqVnkoCF/b0pivizh+FLXOhIIjHWDsskVIv0rpe5JbHT/QsrujUIek+rfJPsqcpPYUxIJeAOMMxcFCQD/djP9np6wAakdB/8u4AXQNH/cpysRfmEtxsLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769195118; c=relaxed/simple;
	bh=ODz8ncLmCsNqsZxfTe8GooISjKiG+okr6st5hrKOOTM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWLQl80Z7jM0LVOLn7PWVyjusnxgZgB93gHzL4J6CkzwVKk2eE2gCunnR7JcX7k+a7oJN2T8kRe+0Arx6hNK9xMxRHwz6IQ2jnPOpoaXFwJCDHTrAtk7tyYSFVmUFgFxj/J6RifE3O8fwgU6TIdsaadoI2zyWKj+jrCwLd3TlXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=gqjUnrdf; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 7E68E240103
	for <linux-leds@vger.kernel.org>; Fri, 23 Jan 2026 20:05:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1769195109; bh=DCJCsmVs7zPkbt9Qd39SgzPBMeFXDWwMJcLHezKPmqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=gqjUnrdfyzBP6JRzrEvRadLzO/JiLHUSWkfAKkNFq3P4BJ6KE70Iku6LsZS7Zc2gC
	 2eH3qZ/j7zwbnXhMfh0yPfFcpylLCGCck02/Paus7PiXCJIEMgJGGXzvDUyRf2fcjY
	 nUspAkSh7FRBJ52XFO7uXVs54233k3e+mhLZAADuWZ3eOvn6PN5gz9NhA6ibNM/0F9
	 E2pJ0t6QslxAZTAMXdBkzR2hc/9husPoODAOaOTkEqMcxJJ+i0NdY6VoSqYFW1wJzd
	 NUmPgrSFAQ5JnUMaS2RQ2T0qt3si/jSJQ4WX/XXz+7/C6fFQJw6PlfagXC9410hBl0
	 wIia2V7hijdZA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4dyS6p6nMcz9rxM;
	Fri, 23 Jan 2026 20:05:06 +0100 (CET)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 23 Jan 2026 19:05:08 +0000
Subject: [PATCH RFC 3/4] leds: add delay_on, delay_off and invert
 attributes to disk trigger
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-ledtrig_disk_-v1-3-07004756467b@posteo.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6628;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=ODz8ncLmCsNqsZxfTe8GooISjKiG+okr6st5hrKOOTM=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBpc8ZYMDkrYNhe896XM9Iuw4ttMEZEt2iKXxYky
 M5UrfrXrjyJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCaXPGWBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQNHYf+OetQ9K4hw/+J5eHm48CkUqLgJU52DgEZ6pH/AqAqjk
 /WgURvz5O/3Hwtwb3b0/fzgDg92/ew619EECAcmdMi8SqjAxsyenM0VGTbmqlKaRT4e8Fl7GhM9
 vZkANj5fmGds8wsmIqtZ5Pv+yzdqwwNNT6GiKLARRL0MmNwbh2bUGw9+5x17FkfkMUQfnIvK3hh
 ydlDopjVY4Ds9Z69W3iPSt6nDDFNRqD81rwt0yhR+96txWhH8t7tm+Wlt8w5Hqk6jVwj7biPdxb
 KqwjXP5GhBK6I6+tzx7qYesAb/OGeGszpqpgDpd2LoPQdt0cABMk3uQu9YHtXxYMfuFd/5wemiw
 C10EQ/JeTbCe6QKwquBWU7n4FQEepso6aJd56oIc5+A37kn4ebeO+zOM+6AwJPpA8SbwIwrL3z0
 beZhDEPmE8PZouEje4HUlPieYLZGaZ+o0OF2cJIkHP8iCriNgB7igiJFQkJ6NMfjqpLxeAKq60F
 dT9p6TvXl+ME8foaNDvkqTlvOZ8vROfLbr6pBH722hG0m2f7wEBvw6Blvm3odbaWImbM2pxJCbf
 g+yddPRv6AuIZJTCMxS2nLeWO6niETADyiIKbDxCzvbjIgYM3s3rsVgt2NDXAJljok8x5YqMw5B
 H0AOtVXXszF0OexPy22GCT1MBWvWgA4o0neuTfKS/R3gkr+dtN4I=
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
	TAGGED_FROM(0.00)[bounces-6721-lists,linux-leds=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2F53779FBF
X-Rspamd-Action: no action

Add delay_on, delay_off and invert device attributes to leds using the
disk trigger.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/leds/trigger/ledtrig-disk.c | 194 +++++++++++++++++++++++++++++++++---
 1 file changed, 182 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-disk.c b/drivers/leds/trigger/ledtrig-disk.c
index e9b87ee944f2..ed5ef83a5b35 100644
--- a/drivers/leds/trigger/ledtrig-disk.c
+++ b/drivers/leds/trigger/ledtrig-disk.c
@@ -9,31 +9,201 @@
 
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/list.h>
 #include <linux/leds.h>
+#include "../leds.h"
 
-#define BLINK_DELAY 30
+#define DEFAULT_BLINK_DELAY 30
 
-DEFINE_LED_TRIGGER(ledtrig_disk);
-DEFINE_LED_TRIGGER(ledtrig_disk_read);
-DEFINE_LED_TRIGGER(ledtrig_disk_write);
+struct ledtrig_disk_data {
+	unsigned long delay_on;
+	unsigned long delay_off;
+	unsigned int invert;
+};
+
+static ssize_t led_delay_on_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = led_trigger_get_led(dev);
+	struct ledtrig_disk_data *disk_data = led_get_trigger_data(led_cdev);
+
+	return sprintf(buf, "%lu\n", disk_data->delay_on);
+}
+
+static ssize_t led_delay_on_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = led_trigger_get_led(dev);
+	struct ledtrig_disk_data *disk_data = led_get_trigger_data(led_cdev);
+	unsigned long state;
+	ssize_t ret;
+
+	ret = kstrtoul(buf, 10, &state);
+	if (ret)
+		return ret;
+
+	disk_data->delay_on = state;
+
+	return size;
+}
+
+static ssize_t led_delay_off_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = led_trigger_get_led(dev);
+	struct ledtrig_disk_data *disk_data = led_get_trigger_data(led_cdev);
+
+	return sprintf(buf, "%lu\n", disk_data->delay_off);
+}
+
+static ssize_t led_delay_off_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = led_trigger_get_led(dev);
+	struct ledtrig_disk_data *disk_data = led_get_trigger_data(led_cdev);
+	unsigned long state;
+	ssize_t ret;
+
+	ret = kstrtoul(buf, 10, &state);
+	if (ret)
+		return ret;
+
+	disk_data->delay_off = state;
+
+	return size;
+}
+
+static ssize_t led_invert_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ledtrig_disk_data *disk_data =
+		led_trigger_get_drvdata(dev);
+
+	return sprintf(buf, "%u\n", disk_data->invert);
+}
+
+static ssize_t led_invert_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t size)
+{
+	struct led_classdev *led_cdev = led_trigger_get_led(dev);
+	struct ledtrig_disk_data *disk_data = led_get_trigger_data(led_cdev);
+	unsigned long state;
+	int ret;
+
+	ret = kstrtoul(buf, 0, &state);
+	if (ret)
+		return ret;
+
+	led_set_brightness_nosleep(led_cdev, state ? LED_FULL : LED_OFF);
+	disk_data->invert = !!state;
+
+	return size;
+}
+
+static DEVICE_ATTR(delay_on, 0644, led_delay_on_show, led_delay_on_store);
+static DEVICE_ATTR(delay_off, 0644, led_delay_off_show, led_delay_off_store);
+static DEVICE_ATTR(invert, 0644, led_invert_show, led_invert_store);
+
+static struct attribute *ledtrig_disk_attrs[] = {
+	&dev_attr_delay_on.attr,
+	&dev_attr_delay_off.attr,
+	&dev_attr_invert.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(ledtrig_disk);
+
+static void pattern_init(struct led_classdev *led_cdev, struct ledtrig_disk_data *disk_data)
+{
+	unsigned int size = 0;
+
+	u32 *pattern __free(kfree) = led_get_default_pattern(led_cdev, &size);
+	if (!pattern)
+		return;
+
+	if (size != 3) {
+		dev_warn(led_cdev->dev,
+			 "Expected 3 but got %u values for delays + invert pattern\n",
+			 size);
+		return;
+	}
+
+	disk_data->delay_on = pattern[0];
+	disk_data->delay_off = pattern[1];
+	disk_data->invert = !!pattern[2];
+}
+
+static int ledtrig_disk_activate(struct led_classdev *led_cdev)
+{
+	struct ledtrig_disk_data *disk_data;
+
+	disk_data = kzalloc(sizeof(*disk_data), GFP_KERNEL);
+	if (!disk_data)
+		return -ENOMEM;
+
+	disk_data->delay_on = DEFAULT_BLINK_DELAY;
+	disk_data->delay_off = DEFAULT_BLINK_DELAY;
+
+	led_set_trigger_data(led_cdev, disk_data);
+
+	if (led_cdev->flags & LED_INIT_DEFAULT_TRIGGER) {
+		pattern_init(led_cdev, disk_data);
+		/*
+		 * Mark as initialized even on pattern_init() error because
+		 * any consecutive call to it would produce the same error.
+		 */
+		led_cdev->flags &= ~LED_INIT_DEFAULT_TRIGGER;
+	}
+
+	led_set_brightness_nosleep(led_cdev, disk_data->invert ? LED_FULL : LED_OFF);
+
+	return 0;
+}
+
+static struct led_trigger ledtrig_disk = {
+	.name = "disk-activity",
+	.activate = ledtrig_disk_activate,
+	.groups = ledtrig_disk_groups,
+};
+static struct led_trigger ledtrig_disk_read = {
+	.name = "disk-read",
+	.activate = ledtrig_disk_activate,
+	.groups = ledtrig_disk_groups,
+};
+static struct led_trigger ledtrig_disk_write = {
+	.name = "disk-write",
+	.activate = ledtrig_disk_activate,
+	.groups = ledtrig_disk_groups,
+};
+
+static void ledtrig_disk_blink_oneshot(struct led_trigger *trig)
+{
+	struct led_classdev *led_cdev;
+	struct ledtrig_disk_data *disk_data;
+
+	rcu_read_lock();
+	list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
+		disk_data = led_get_trigger_data(led_cdev);
+		led_blink_set_oneshot(led_cdev, &disk_data->delay_on, &disk_data->delay_off,
+				      disk_data->invert);
+	}
+	rcu_read_unlock();
+}
 
 void ledtrig_disk_activity(bool write)
 {
-	led_trigger_blink_oneshot(ledtrig_disk, BLINK_DELAY, BLINK_DELAY, 0);
+	ledtrig_disk_blink_oneshot(&ledtrig_disk);
 	if (write)
-		led_trigger_blink_oneshot(ledtrig_disk_write,
-					  BLINK_DELAY, BLINK_DELAY, 0);
+		ledtrig_disk_blink_oneshot(&ledtrig_disk_write);
 	else
-		led_trigger_blink_oneshot(ledtrig_disk_read,
-					  BLINK_DELAY, BLINK_DELAY, 0);
+		ledtrig_disk_blink_oneshot(&ledtrig_disk_read);
 }
 EXPORT_SYMBOL(ledtrig_disk_activity);
 
 static int __init ledtrig_disk_init(void)
 {
-	led_trigger_register_simple("disk-activity", &ledtrig_disk);
-	led_trigger_register_simple("disk-read", &ledtrig_disk_read);
-	led_trigger_register_simple("disk-write", &ledtrig_disk_write);
+	led_trigger_register(&ledtrig_disk);
+	led_trigger_register(&ledtrig_disk_read);
+	led_trigger_register(&ledtrig_disk_write);
 
 	return 0;
 }

-- 
2.52.0


