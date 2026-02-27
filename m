Return-Path: <linux-leds+bounces-7044-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UONOAK3soWlDxQQAu9opvQ
	(envelope-from <linux-leds+bounces-7044-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:12:45 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C23E1BC82B
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 20:12:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F162331CF541
	for <lists+linux-leds@lfdr.de>; Fri, 27 Feb 2026 19:07:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6D243859CB;
	Fri, 27 Feb 2026 19:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="oomNm/RS"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3298C3A7F7C;
	Fri, 27 Feb 2026 19:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772219234; cv=pass; b=L6W8wXck5mRGfA1VH+PAZcHJ+x6nizFphSOfERPSCGq4KW/crIMpdJVc689uSH2/IgikBSZuZaPkLDbG7SjvglAbqxBxSBjIPLbNXnBflLs86vZ/f3MmAhD/XXD0AAmJTv4BVApbKDt06I9D7+gYbsJ/nR9b4wmQG0m2tIeDxpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772219234; c=relaxed/simple;
	bh=46xabc43SVTjpm9Q+KwpSamKHyJ2Sblrwkh97QbKtM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfcl+4e4OnHFbSMGNC8nC7KLxCCH1uO4pZc7IxtPjKSP44NtwGqRb73joUCcwRTYDfs2E3YDj4lQK48uVctANDB0xSB5zR92e6RmAw37ohs0iDAMZi1qc3ZngNWydGmhgYhWqRINYjFftJKwsXzFzjnDpG2UXgkeKgXvxI2qYRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=oomNm/RS; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1772219213; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oCpvEpLSb3cvYqLbUIHlOwM7+3RqTg8JV1GMGx8QfCWMkGCctWIFB+KV9czW/cE8vs5c3vU+eSjWfTQtjDM3RYbyy3nYTKmVjZ4DX08CuUczbK6y+DHmdS8fdfV2P4qhj/DSIHhz3Fv9bIm4avPxl9Uhbpbz76TFDi5LL3IU+aY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772219213; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pfwFChO4XxRiKzeQdXTZAod9r1Evqeqe/sBBTyscmDQ=; 
	b=Jf7bGwwhS8epU3L70GP3sF3Ae7YnFOMNwdAhTvaEjZLGpkEb1lzRUi1QsRyEfiJNX1uw34C+n0Y+eKVqJCP7nEcFFPvKaTDT+30oh0opwTGi+BrL6nsZPHNfH0jnnuTZqvLOsEDtbSlnt+UCcqk74tbxtgMmwkUlkYoaSeLcrKY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772219213;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=pfwFChO4XxRiKzeQdXTZAod9r1Evqeqe/sBBTyscmDQ=;
	b=oomNm/RSgyfAVcstKvTaZrPxu4Qu4UNp2dz2qlq5EN/EB+1Oz6i+pFCrSrQLYfe+
	MkSgoGafQajZCZAcv/3PyeyJZCneyqFNTgHnM4CFMEMK5Bc81yq6P2qKpSIZKn3v08J
	sSSbplrXTZBQGMF7FdNzvUGIX9ul+L0HNmSPjxgn4mOVQbDKBnnsRvJ5Tz4wyXjf4ib
	l4FtPn+lgY63jGq6Oca5f/3y4xGs4PCUCD9DebpTqHUqTG16KiER/rUVKDnndwPH6Vi
	uvOwb4HDoLjoin8ckkKBgj8VQ8n+t81M1FDlcGB5nFmDb59q2tRHhw6kh6hBDfMz3H6
	boJ9Vjzdlg==
Received: by mx.zohomail.com with SMTPS id 177221921233793.75743679643915;
	Fri, 27 Feb 2026 11:06:52 -0800 (PST)
From: Rong Zhang <i@rong.moe>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Ike Panhc <ikepanhc@gmail.com>
Cc: Rong Zhang <i@rong.moe>,
	Vishnu Sankar <vishnuocv@gmail.com>,
	vsankar@lenovo.com,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	platform-driver-x86@vger.kernel.org
Subject: [RFC PATCH 6/9] leds: Add trigger_may_offload attribute
Date: Sat, 28 Feb 2026 03:06:03 +0800
Message-ID: <20260227190617.271388-7-i@rong.moe>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260227190617.271388-1-i@rong.moe>
References: <20260227190617.271388-1-i@rong.moe>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7044-lists,linux-leds=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[rong.moe,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:mid,rong.moe:dkim,rong.moe:email]
X-Rspamd-Queue-Id: 5C23E1BC82B
X-Rspamd-Action: no action

Currently, we have multiple triggers implementing hw control. Only
"netdev" provides a custom attribute to determine if it's offloaded to
hardware (i.e., in hw control mode). For other triggers, there is no
obvious way userspace can determine the hw control state
programmatically. Moreover, userspace can't even query if an LED device
supports hw control and the name of hw control trigger.

Add a new attribute "trigger_may_offload" to the LED core, so that
userspace can determine:

- if the LED device supports hw control (supported => visible)
- which trigger is the hw control trigger
- if the hw control trigger is selected
- if the hw control trigger is in hw control

Signed-off-by: Rong Zhang <i@rong.moe>
---
 .../obsolete/sysfs-class-led-trigger-netdev   | 15 +++++++
 Documentation/ABI/testing/sysfs-class-led     | 22 ++++++++++
 .../testing/sysfs-class-led-trigger-netdev    | 13 ------
 Documentation/leds/leds-class.rst             |  4 +-
 drivers/leds/led-class.c                      | 22 ++++++++++
 drivers/leds/led-triggers.c                   | 42 +++++++++++++++++++
 drivers/leds/leds.h                           |  2 +
 drivers/leds/trigger/ledtrig-netdev.c         |  2 +
 8 files changed, 108 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev

diff --git a/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
new file mode 100644
index 0000000000000..d1a7713d45700
--- /dev/null
+++ b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
@@ -0,0 +1,15 @@
+What:		/sys/class/leds/<led>/offloaded
+Date:		March 2026
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Communicate whether the LED trigger modes are offloaded to
+		hardware or whether software fallback is used.
+
+		If 0, the LED is using software fallback to blink.
+
+		If 1, the LED blinking in requested mode is offloaded to
+		hardware.
+
+		Since 7.1, /sys/class/leds/<led>/trigger_may_offload provides
+		a generic method to query the offloaded state of supported
+		trigger, so this has been deprecated.
diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 0313b82644f24..403f411b09036 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -78,6 +78,28 @@ Description:
 		(which would often be configured in the device tree for the
 		hardware).
 
+What:		/sys/class/leds/<led>/trigger_may_offload
+Date:		March 2026
+KernelVersion:	7.1
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Names and states of triggers that may be offloaded to hardware.
+		Such triggers are also called "hw control trigger" in some
+		context.
+
+		Only exists when the LED supports trigger offload.
+
+		Returns a list of hw control triggers on read. The optional
+		brackets around the trigger name indicate the state of the
+		current trigger:
+
+		- `foo_trigger`: the trigger is not selected.
+		- `<foo_trigger>`: the trigger is selected, but falls back to
+		  software blink for some reason (e.g., incompatible trigger
+		  parameters)
+		- `[foo_trigger]`: the trigger is selected and offloaded to
+		  hardware.
+
 What:		/sys/class/leds/<led>/inverted
 Date:		January 2011
 KernelVersion:	2.6.38
diff --git a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
index ed46b37ab8a28..396d37a4b820d 100644
--- a/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
+++ b/Documentation/ABI/testing/sysfs-class-led-trigger-netdev
@@ -62,19 +62,6 @@ Description:
 		When offloaded is true, the blink interval is controlled by
 		hardware and won't reflect the value set in interval.
 
-What:		/sys/class/leds/<led>/offloaded
-Date:		Jun 2023
-KernelVersion:	6.5
-Contact:	linux-leds@vger.kernel.org
-Description:
-		Communicate whether the LED trigger modes are offloaded to
-		hardware or whether software fallback is used.
-
-		If 0, the LED is using software fallback to blink.
-
-		If 1, the LED blinking in requested mode is offloaded to
-		hardware.
-
 What:		/sys/class/leds/<led>/link_10
 Date:		Jun 2023
 KernelVersion:	6.5
diff --git a/Documentation/leds/leds-class.rst b/Documentation/leds/leds-class.rst
index 84665200a88dc..cf7733e30bace 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -177,7 +177,9 @@ limited to blink but also to turn off or on autonomously.
 To support this feature, a LED needs to implement various additional
 ops and needs to declare specific support for the supported triggers.
 
-With hw control we refer to the LED driven by hardware.
+With hw control we refer to the LED driven by hardware. In hw control mode,
+the current trigger is offloaded to hardware. The `trigger_may_offload`
+attribute can be used to query supported triggers and their states.
 
 LED driver must define the following value to support hw control:
 
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 0fa45f22246e3..8a661e2616f06 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -90,8 +90,30 @@ static const struct bin_attribute *const led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
+
+static DEVICE_ATTR(trigger_may_offload, 0644, led_trigger_may_offload_show, NULL);
+static struct attribute *led_trigger_attrs[] = {
+	&dev_attr_trigger_may_offload.attr,
+	NULL,
+};
+static umode_t led_trigger_is_visible(struct kobject *kobj,
+				      struct attribute *attr,
+				      int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+
+	if (attr == &dev_attr_trigger_may_offload.attr &&
+	    !led_cdev->hw_control_trigger)
+		return 0;
+
+	return attr->mode;
+}
+
 static const struct attribute_group led_trigger_group = {
 	.bin_attrs = led_trigger_bin_attrs,
+	.attrs = led_trigger_attrs,
+	.is_visible = led_trigger_is_visible,
 };
 #endif
 
diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 3066bc91a5f94..f8100381fc684 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -346,6 +346,48 @@ void led_load_hw_control_trigger(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_load_hw_control_trigger);
 
+/*
+ * Caller must ensure led_cdev->trigger_lock held,
+ * and led_cdev->trigger->name must match led_cdev->hw_control_trigger.
+ */
+static bool led_trigger_get_offloaded(struct led_classdev *led_cdev)
+{
+	if (likely(led_cdev->trigger->offloaded))
+		return led_cdev->trigger->offloaded(led_cdev);
+
+	dev_err_once(led_cdev->dev,
+		     "hw control trigger %s doesn't implement offloaded(), this is a bug\n",
+		     led_cdev->trigger->name);
+	return false;
+}
+
+ssize_t led_trigger_may_offload_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct led_classdev *led_cdev = dev_get_drvdata(dev);
+	bool hit, offloaded = false;
+	int len;
+
+	mutex_lock(&led_cdev->led_access);
+	down_read(&led_cdev->trigger_lock);
+
+	hit = led_cdev->trigger && led_match_hw_control_trigger(led_cdev, led_cdev->trigger);
+	if (hit)
+		offloaded = led_trigger_get_offloaded(led_cdev);
+
+	/* [offloaded] <active_but_not_offloaded> inactive */
+	len = led_trigger_snprintf(buf, PAGE_SIZE,
+				   hit ? (offloaded ? "[%s]\n" : "<%s>\n")
+				       : "%s\n",
+				   led_cdev->hw_control_trigger);
+
+	up_read(&led_cdev->trigger_lock);
+	mutex_unlock(&led_cdev->led_access);
+
+	return len;
+}
+EXPORT_SYMBOL_GPL(led_trigger_may_offload_show);
+
 /* LED Trigger Interface */
 
 int led_trigger_register(struct led_trigger *trig)
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index e85afd4d04fd0..ee0dbddd411ec 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -28,6 +28,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			const struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
+ssize_t led_trigger_may_offload_show(struct device *dev,
+				     struct device_attribute *attr, char *buf);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index edde167b60a54..0a4f4469ff9b0 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -482,6 +482,8 @@ static ssize_t offloaded_show(struct device *dev,
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 
+	dev_warn_once(dev, "offloaded attribute has been deprecated, see trigger_may_offload.\n");
+
 	return sprintf(buf, "%d\n", trigger_data->hw_control);
 }
 
-- 
2.51.0


