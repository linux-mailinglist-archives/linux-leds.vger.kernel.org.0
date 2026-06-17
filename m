Return-Path: <linux-leds+bounces-8649-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qY5gFCjSMmp65wUAu9opvQ
	(envelope-from <linux-leds+bounces-8649-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:58:16 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A143869B87B
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 18:58:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=nhUIzttT;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8649-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8649-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7391830E2E8C
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0EB4C77C7;
	Wed, 17 Jun 2026 16:50:00 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBF14C77BE;
	Wed, 17 Jun 2026 16:49:56 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715000; cv=pass; b=J+d/sM6RpxaMObA9tBaekegfwylWAleMsR5J/8VGe5kJz7XkCnsAZVPSRh/BAKxVVFunsU33Zbks7fqDR75GeZWl7Xv5ieqaPyQESFHFraEVf2MfLmVoT4IM27qn8BuxeC5CAS9XGOQFOFWg2Myho0bXQbBcGGh7jrP7drYhccE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715000; c=relaxed/simple;
	bh=r6zgAF5KqFBxpkbly1/17nNDzJ1m0y3uBPXMB5OhHDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I3wE5yHEHcHe6bskwZFm3xpr6buGj51HbNz2lLKnXafkQv7xDedTV1fcTx1BQGzGtoraVUS3/NqLTNBCRVlVItsykPiaUfIhucNJXXSakfpS2WlMJRnOC7hqKW62MEYVpwycU2LQruam+MdbTQzdnpxEodUovHBEZ2OUdq1aeLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=nhUIzttT; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1781714975; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JGn2oTk2nhNXfSd/laoJSiOW4JAh5QvhMGgAf3Ne1YsYyAq6gSR5c8QgRIRKxCFhqgxub9v0lDq8wZP31vEFWHinW9gDLkad6D/OdtqFUF4NaCJJsPHtB7ZWJRQV763wdxxfjxgO3AYtEgGD8TwFjhpNF9/0XZpe5J0BhLbUr5Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714975; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aonQqdpg3V4a/vEZt4l6sDB68Y1marw4+W1oldR5Kf0=; 
	b=aHjlbYfCRHMb3mkNTqK6tTTsJyoHNRaAjE9pYpLp/P/AL1OnZN9CtfTqLXQyTLA04QbnUdgK88JyRbIlzCB38uyC7wfSzlaCAHucrBkv4hzRQ9EJnNeTaPphikqKCyNEfaR+D2aZKHji4FhwYqYCdToECw+2wh0k3eCQVFlns7w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714975;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=aonQqdpg3V4a/vEZt4l6sDB68Y1marw4+W1oldR5Kf0=;
	b=nhUIzttTPAo7jdlWq1Sb6232QVgB8flp2Ms8LSBWPwxxORLG7Ne6nFZzzx+FyMfG
	jUWZs+LvtwosKD44vfGFixu9wwGZDUmvFWsKlLZDCJLn7NFHYLi3NRh16WxKMedEDUF
	G6XeG3MzAjkLnHIHn+eHlcL//yLHiKbmucfRaD6/kyc5kYM050bDsTQuuJ8iSyear0e
	M/CGOacBrlHs9AcDu2q9/HxTHo/eP3170jsTRvUqOJ4yGh2/cTpCVH8QbRDe+Y9j5rG
	d97YD/7ZVZsIPa/4JdQVQrK7Jrm/oefC1owEu4PD4K+bq7xmwF4j+U84eipKJcvE1t2
	GZG7bacZkQ==
Received: by mx.zohomail.com with SMTPS id 1781714973077152.08783189999588;
	Wed, 17 Jun 2026 09:49:33 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:47:59 +0800
Subject: [PATCH RFC v2 5/9] leds: Add trigger_may_offload attribute
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-5-c28c44053cf3@rong.moe>
References: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
In-Reply-To: <20260618-leds-trigger-hw-changed-v2-0-c28c44053cf3@rong.moe>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>, 
 Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Ike Panhc <ikepanhc@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
 Vishnu Sankar <vishnuocv@gmail.com>, Vishnu Sankar <vsankar@lenovo.com>, 
 linux-leds@vger.kernel.org, netdev@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
 Rong Zhang <i@rong.moe>
X-Mailer: b4 0.16-dev-d5d98
X-ZohoMailClient: External
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux@weissschuh.net,m:bleung@chromium.org,m:groeck@chromium.org,m:kabel@kernel.org,m:mpearson-lenovo@squebb.ca,m:derekjohn.clark@gmail.com,m:hansg@kernel.org,m:ilpo.jarvinen@linux.intel.com,m:ikepanhc@gmail.com,m:andrew+netdev@lunn.ch,m:kuba@kernel.org,m:vishnuocv@gmail.com,m:vsankar@lenovo.com,m:linux-leds@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:chrome-platform@lists.linux.dev,m:platform-driver-x86@vger.kernel.org,m:i@rong.moe,m:derekjohnclark@gmail.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,lwn.net,linuxfoundation.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com];
	FORGED_SENDER(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_FROM(0.00)[bounces-8649-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[rong.moe:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,gmail.com,lenovo.com,vger.kernel.org,lists.linux.dev,rong.moe];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rong.moe:dkim,rong.moe:email,rong.moe:mid,rong.moe:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A143869B87B

There are multiple triggers implementing hardware control. Only "netdev"
provides a custom attribute to determine if it's offloaded to hardware
(i.e., in hardware control). For other triggers, there is no obvious way
for userspace to determine the trigger state programmatically. Moreover,
userspace can't query if an LED device supports hardware control or
identifies these triggers.

Add a new attribute "trigger_may_offload" to the LED core, so that
userspace can determine:

- if the LED device supports hardware control (supported => visible)
- which trigger is the hardware control trigger selected by the LED
  device
- if the trigger is selected ("<foo_trigger>")
- if the trigger is offloaded ("[foo_trigger]")

Note: the documentation describes the attribute as "returning a list"
despite the LED core currently only supports one hardware control
trigger per LED device. This is intentional to make the attribute
extensible in the future without breaking userspace.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 .../ABI/obsolete/sysfs-class-led-trigger-netdev    | 16 ++++++++
 Documentation/ABI/testing/sysfs-class-led          | 22 +++++++++++
 .../ABI/testing/sysfs-class-led-trigger-netdev     | 13 -------
 Documentation/leds/leds-class.rst                  |  8 ++++
 drivers/leds/led-class.c                           | 23 +++++++++++
 drivers/leds/led-triggers.c                        | 45 ++++++++++++++++++++++
 drivers/leds/leds.h                                |  2 +
 drivers/leds/trigger/ledtrig-netdev.c              |  2 +
 8 files changed, 118 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
new file mode 100644
index 000000000000..8d2fbfaf50c3
--- /dev/null
+++ b/Documentation/ABI/obsolete/sysfs-class-led-trigger-netdev
@@ -0,0 +1,16 @@
+What:		/sys/class/leds/<led>/offloaded
+Date:		June 2026
+KernelVersion:	7.3
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
+		/sys/class/leds/<led>/trigger_may_offload provides a generic
+		method to query the offloaded state of supported triggers,
+		superseding this attribute.
diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index 0313b82644f2..edd5a9a74dfd 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -78,6 +78,28 @@ Description:
 		(which would often be configured in the device tree for the
 		hardware).
 
+What:		/sys/class/leds/<led>/trigger_may_offload
+Date:		June 2026
+KernelVersion:	7.3
+Contact:	linux-leds@vger.kernel.org
+Description:
+		Names and states of triggers that may be offloaded to hardware.
+		Such triggers are also called "hw control trigger" in some
+		context.
+
+		Only exists when the LED supports trigger offload.
+
+		Reading this file returns a list of triggers that are capable to
+		be offloaded. The optional brackets around the trigger name
+		indicate the state of the current trigger:
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
index ed46b37ab8a2..396d37a4b820 100644
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
index 84665200a88d..41342ecb5f6b 100644
--- a/Documentation/leds/leds-class.rst
+++ b/Documentation/leds/leds-class.rst
@@ -179,6 +179,9 @@ ops and needs to declare specific support for the supported triggers.
 
 With hw control we refer to the LED driven by hardware.
 
+A sysfs attribute `trigger_may_offload` is provided for userspace to
+query supported triggers and their states.
+
 LED driver must define the following value to support hw control:
 
     - hw_control_trigger:
@@ -240,6 +243,11 @@ LED trigger must implement the following API to support hw control:
                 return a boolean indicating if the trigger is offloaded to
                 hardware.
 
+                If an LED driver specifies a hw control trigger but the
+                latter doesn't implement this callback, a dev_err_once will
+                be emitted and the LED trigger will be assumed to be not
+                offloaded.
+
 LED driver can activate additional modes by default to workaround the
 impossibility of supporting each different mode on the supported trigger.
 Examples are hardcoding the blink speed to a set interval, enable special
diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 9e14ae588f78..0ac80b93b8b5 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -90,8 +90,31 @@ static const struct bin_attribute *const led_trigger_bin_attrs[] = {
 	&bin_attr_trigger,
 	NULL,
 };
+
+static DEVICE_ATTR(trigger_may_offload, 0444, led_trigger_may_offload_show, NULL);
+static struct attribute *led_trigger_attrs[] = {
+	&dev_attr_trigger_may_offload.attr,
+	NULL,
+};
+
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
index b1223218bda1..c43229d9c4c1 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -313,6 +313,51 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
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
+	struct led_trigger *trig;
+	int len;
+
+	mutex_lock(&led_cdev->led_access);
+	down_read(&led_cdev->trigger_lock);
+
+	trig = led_cdev->trigger;
+
+	hit = trig && !strcmp(led_cdev->hw_control_trigger, trig->name);
+	if (hit)
+		offloaded = led_trigger_get_offloaded(led_cdev);
+
+	/* [offloaded] <active_but_not_offloaded> inactive */
+	len = sysfs_emit(buf, "%s%s%s\n",
+			 offloaded ? "[" : (hit ? "<" : ""),
+			 led_cdev->hw_control_trigger,
+			 offloaded ? "]" : (hit ? ">" : ""));
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
index bee46651e068..9177e098989b 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -27,6 +27,8 @@ ssize_t led_trigger_read(struct file *filp, struct kobject *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			const struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
+ssize_t led_trigger_may_offload_show(struct device *dev,
+				     struct device_attribute *attr, char *buf);
 
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index a26109ca4b1c..21f22eea4ab8 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -487,6 +487,8 @@ static ssize_t offloaded_show(struct device *dev,
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 
+	dev_warn_once(dev, "offloaded attribute has been deprecated, see trigger_may_offload.\n");
+
 	return sprintf(buf, "%d\n", trigger_data->hw_control);
 }
 

-- 
2.53.0


