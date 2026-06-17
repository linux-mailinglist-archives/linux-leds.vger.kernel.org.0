Return-Path: <linux-leds+bounces-8652-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3nnVB9DSMmqf5wUAu9opvQ
	(envelope-from <linux-leds+bounces-8652-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 19:01:04 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0556F69B8CC
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 19:01:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=rong.moe header.s=zmail2048 header.b=k25gwzXa;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8652-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8652-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=rong.moe;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4C52F3200393
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jun 2026 16:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E77D4BCAC9;
	Wed, 17 Jun 2026 16:50:23 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52244C9544;
	Wed, 17 Jun 2026 16:50:19 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781715022; cv=pass; b=Z/CPIV5DqqxAFa3RVZmukimpPhb/wjADRbOHhhq7kc+Bg0RSGpJkyYoXp37sPKa1uTFM9CnOcetVqJovL0ZkacD/pp8ChXY+cwQMx2KxT0pzugHluxs36LeKiaw1pNA59qafcRyLTCyVk9Tr4bjrgl2fIvVeXF6GFjcHLhAHbhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781715022; c=relaxed/simple;
	bh=46QMtMcuxnIZoL+xIhNwgGCMpv65BlQ4i4ySlqs4vz8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OUOcnMIrmNsDtMrDJMIKbgXMUFfQs8TM4pisKvqaJTrXFH2630uipwSwfxqZSAvUJeoFwXa6bKT8jSjsQXEd9kH2pqW+QVrw/0xw0S0jC8DIqBYlag2NdAChDhU82hA2a5iIfe97Z1ErNFYpZAL6JLWABS+yzR59M/feaBgzYlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=k25gwzXa; arc=pass smtp.client-ip=136.143.188.15
ARC-Seal: i=1; a=rsa-sha256; t=1781714999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OcWWDEledolNhkJQ9TjvpM2qTnrOmFbg6leB8osTcCuApDDzT5Zeehu7oUzjcYe/Ae2aRvoT2hjxLEtWlmgNJxdOXGHvzDT/LuU7+0UjNHK7cGRNS57MY3Rrd+2YfTf0LVnVU6V+HLqvLZFNZXYxAxqgLLsPp/PU7CRHkAvNGdk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781714999; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GMrEHJIsNQKr3cdYhQRNVQX+p/Pau+HnEdKcTqiCkIQ=; 
	b=nLyzn3Jqd86hDdoPuRf2vI86YGPoJynRQTshqEs5pRK5xbS28OlYwh36icpGfahaUfHAgBLn03zpKOtabiwLYlhTu2BbKGMSIVzYH4m7iu0plxhY/04Ur8unjibX+MwCqS0ZnCCVCp73swaz/XJB2ryYBaOAJbL2Rw61Ymo2Bqw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781714999;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GMrEHJIsNQKr3cdYhQRNVQX+p/Pau+HnEdKcTqiCkIQ=;
	b=k25gwzXakN9+nB/04xlV+RgOqoBIM+sj9MER+qwy2nBgGZ+SSakbr74Z4LiyP9U8
	hpNcC/5rqPHa4YtCrLox3KX4BPOZLQfg3OdCyMnI2xQhOqchLyAjLNVN3D4nMqLkygz
	aCs6a7by3el2Bwi7FzdXNKhvevL5afPradr9Rg9mJvd4JblYw0/HOqeDLQX23vIL3B+
	8U8JfCVGJfWfyd0Nvbetyz4Nh5BJ8LUSC27hkDc62I2dpRb/tkSd0run31EltyLx95R
	l8yBp3QQIkefSxfjxbZ4J3NbY55+Cik+2lkDs67N3V5gXLD6ZFugeQDL5Bqexrmxttt
	JdczBjYDUA==
Received: by mx.zohomail.com with SMTPS id 1781714996876469.22452862170087;
	Wed, 17 Jun 2026 09:49:56 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Thu, 18 Jun 2026 00:48:02 +0800
Subject: [PATCH RFC v2 8/9] platform/x86: ideapad-laptop: Serialize
 keyboard backlight notifications
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-leds-trigger-hw-changed-v2-8-c28c44053cf3@rong.moe>
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
	TAGGED_FROM(0.00)[bounces-8652-lists,linux-leds=lfdr.de];
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
X-Rspamd-Queue-Id: 0556F69B8CC

ACPI notifications are delivered in dedicated work contexts and may
arrive simultaneously. In the following change, much work will be done
while handling the notification, which could lead to potential race
conditions.

Introduce a new mutex to serialize keyboard backlight notifications to
prevent potential race conditions.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/ideapad-laptop.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/platform/x86/lenovo/ideapad-laptop.c b/drivers/platform/x86/lenovo/ideapad-laptop.c
index 40153dc9a5f2..97949094ead4 100644
--- a/drivers/platform/x86/lenovo/ideapad-laptop.c
+++ b/drivers/platform/x86/lenovo/ideapad-laptop.c
@@ -26,7 +26,9 @@
 #include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
+#include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/platform_profile.h>
 #include <linux/power_supply.h>
@@ -228,6 +230,8 @@ struct ideapad_private {
 		int type;
 		struct led_classdev led;
 		atomic_t last_hw_brightness;
+
+		struct mutex notif_mutex; /* protects notifications */
 	} kbd_bl;
 	struct {
 		bool initialized;
@@ -1720,6 +1724,8 @@ static void ideapad_kbd_bl_notify(struct ideapad_private *priv)
 	if (!priv->kbd_bl.initialized)
 		return;
 
+	guard(mutex)(&priv->kbd_bl.notif_mutex);
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return;
@@ -1747,6 +1753,10 @@ static int ideapad_kbd_bl_init(struct ideapad_private *priv)
 	if (WARN_ON(priv->kbd_bl.initialized))
 		return -EEXIST;
 
+	err = devm_mutex_init(&priv->platform_device->dev, &priv->kbd_bl.notif_mutex);
+	if (err)
+		return err;
+
 	hw_brightness = ideapad_kbd_bl_hw_brightness_get(priv);
 	if (hw_brightness < 0)
 		return hw_brightness;

-- 
2.53.0


