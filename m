Return-Path: <linux-leds+bounces-8989-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 937YNUJ4T2pFhQIAu9opvQ
	(envelope-from <linux-leds+bounces-8989-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 12:30:26 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 456CA72F9BE
	for <lists+linux-leds@lfdr.de>; Thu, 09 Jul 2026 12:30:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=trailofbits.com header.s=google header.b=g1hkvvSR;
	dmarc=pass (policy=reject) header.from=trailofbits.com;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8989-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8989-lists+linux-leds=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7024C31E8215
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2026 10:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18ADF40B6F1;
	Thu,  9 Jul 2026 10:12:18 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qv2-f0.google.com (mail-qv2-f0.google.com [74.125.230.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B5240B371
	for <linux-leds@vger.kernel.org>; Thu,  9 Jul 2026 10:12:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591937; cv=none; b=OTKitXwzHHVesL4Gj2nq8Zhue4uov0a26fv2lJCjAe+vR6xtAegiLR4KFhKVH8HxmZHZ7aD/R0Wf5J1JD6sU2RYpO6IgROZUI3/zrNv5r+ET17iwqLvWiIJENJyCkzhaou1IGbRMkwGhBecdf8IwWyNOW0HyOqIMmQUmPmd6pBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591937; c=relaxed/simple;
	bh=GCdlr8/NsEt0Ik/GfaGOfqZRlBRMmJVLZ2bO+TtxDuY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QCIZqe5LJzzLPujICZB/EqxtosANTMumzgfnWrWjQq0b2/Q4gHFbO4W7gAcpq8P58s/CfBeLdiCgsBmGFGiYmjNLIrwC9M4ZxdmLrSP4t3xW2YAlMGaWtIIThQNbA91Y/iw2Y0FqvF+TDXzr5zxe+EW4OdIdAkBS9bzhwnEcJBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=g1hkvvSR; arc=none smtp.client-ip=74.125.230.128
Received: by mail-qv2-f0.google.com with SMTP id 6a1803df08f44-8fda6ac0586so8991906d6.1
        for <linux-leds@vger.kernel.org>; Thu, 09 Jul 2026 03:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1783591933; x=1784196733; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e4OFFqUr3cMwftxVsDAGAhl16P7ZSnRgEXR+2YXB4XU=;
        b=g1hkvvSRMNptSQttAwLqvtpnSTXSQuI+OpX/W0Bu2lg3ARJBMkfSQvbLIV2jZzxAhw
         +0czcjC5JoYR19WFKZoICdkw9D2DHEJBtGdHDsM+cFbyj5/5Oeiejsf/nwpaJv2YdWZ4
         bu1nmUzAzKssrN3yo229ldkvWGQT7XtYAYjD61sUjZXgcFfWBP3/GxhwIReXN+QWSuXo
         4rqrgIdlJ/iN4vP7ZuUXQWFaUOGWP2Xvp4kNv2AyEnHomy0L/JzZuzwQvcmIY0pd38HN
         DL8pEz3QVf9pF/mexr7PU6avU44HPONyAoFBNikEl/my6uJCMoeJtG0nlZIbylNEpFMc
         8b6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591933; x=1784196733;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4OFFqUr3cMwftxVsDAGAhl16P7ZSnRgEXR+2YXB4XU=;
        b=LYkoFpJKg1/gEpSEewcyGERLUah8qSAHvDFVbQwNjuXevYkEclVcV0b96FANu182Mj
         91y0e0s8oZBA1rFRsaULwVHembkB/rOJ+ftSfvlqgFLFDF5XkANRxyH+/nkoQe/c1T7N
         pH76G/Vw93mB8MuGjjsTTKHgXTjh2brMDEx4F8p96/Bww0X8BwJq2SvcI8YHdwn6I44Q
         u9dmDx5zSUeV7rNXjElU+KentKu/wrbbdeHDJIkXsBOb94BikZyJkH/2kfBuz3DYo3j4
         T8L0Tuh8ZTzZuWFwxndKhbXwnoqUoA0jln8Vfahkai7AEYdJCbV8kUPK6sMSxA3ZJcIY
         Qi9Q==
X-Forwarded-Encrypted: i=1; AHgh+RoZZ0yXP35HbSY6u03zkXVifqC87MKdnCkM2yEBCsq6HkVz+y/2uIpvN89EPPPjshBmWBXoZuhJ1PSl@vger.kernel.org
X-Gm-Message-State: AOJu0YykoE5imknzND+dtLhiv+hclWzBEd4Y8B3b7SwBCKz6wmVobMqU
	K/hl5SQVEYhvo3xHPknwRmcIxB+mHVwBr1++YkVqGBZ55XcW+lSCWILBBZ1TI0Yvs4s=
X-Gm-Gg: AfdE7cmN679zEAxMiB7Y7E+6/wDZVD7A0h6mC7xRMAyPrFgTsZ/gAJ3FXAhfnYizuOn
	Dmf8FuIw6xV5EtS1/hHPnUsUOFk3bvltPFFRT9mhBmbXL5MN/LWIgn7BoOTS95Vvhg2na+BdKJl
	2k9RebxMOiFGdjf4gn8Jyb5rDBXktfAwdn1cwkODIh8FWsCYicbwzGhmTL/J4QiwsUEx830GMsT
	cEfIpIWv2vlqJ5s81BCuZZARSIN2KNCk8jJgDlR2D0QXtdRckaLsp8ESoveBWuwtgLX3b668CeB
	oiY3nPYMj3vVJ17ex1KjyvIaL1ejmux3u/hvSWMbHvWFmKCK0w1nXuXdmeS2228eFL8ogTrth61
	abLXc3AYk0wbzLgxnPQ/T4JQGXSI4OKVDLpZskGR36q/asvbzne6v8ELc3Von3Srg4SjwK8z0uE
	pTydtevAyMmo7qM6GXkg==
X-Received: by 2002:a05:6214:5d81:b0:8fd:6e22:c7ea with SMTP id 6a1803df08f44-8fec3908a88mr68112506d6.59.1783591932952;
        Thu, 09 Jul 2026 03:12:12 -0700 (PDT)
Received: from localhost ([146.190.222.192])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-8ffd56c4cd1sm14178166d6.16.2026.07.09.03.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:12:12 -0700 (PDT)
From: David Lee <david.lee@trailofbits.com>
To: Lee Jones <lee@kernel.org>
Cc: David Lee <david.lee@trailofbits.com>,
	Pavel Machek <pavel@kernel.org>,
	Dominik 'Disconnect3d' Czarnota <dominik.czarnota@trailofbits.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] leds: class: disable sysfs before unregistering LED devices
Date: Thu,  9 Jul 2026 10:12:08 +0000
Message-ID: <20260709101210.104975-1-david.lee@trailofbits.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[trailofbits.com,reject];
	R_DKIM_ALLOW(-0.20)[trailofbits.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8989-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:david.lee@trailofbits.com,m:pavel@kernel.org,m:dominik.czarnota@trailofbits.com,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[david.lee@trailofbits.com,linux-leds@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[trailofbits.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david.lee@trailofbits.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,trailofbits.com:from_mime,trailofbits.com:email,trailofbits.com:mid,trailofbits.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 456CA72F9BE

Closing a uleds device removes the LED class device and then frees the
struct uleds_device that contains it. The LED class device is also exposed
through sysfs, where attributes such as trigger, brightness, delay_on, and
delay_off can remain open across unregister.

That creates a lifetime race. led_classdev_unregister() tears down the LED
trigger, software blink timer, brightness state, and trigger-specific sysfs
groups, but it does not first block LED sysfs writers. An already-open sysfs
attribute can therefore enter the LED trigger or timer paths while unregister
is tearing down the same embedded struct led_classdev.

For uleds this can become a use-after-free: after unregister returns,
uleds_release() frees the containing struct uleds_device, while stale sysfs
or timer paths may still access led_classdev fields embedded in that freed
object. KASAN reports use-after-free reads and writes in __run_timers(),
led_timer_function(), and uleds_brightness_set().

Fix this by entering the existing LED sysfs exclusion protocol at the start
of unregister. Take led_cdev->led_access, set LED_SYSFS_DISABLE, perform the
trigger, timer, brightness, and trigger-sysfs teardown, then release the
mutex. A racing sysfs writer either completes before unregister starts or
sees the disabled state and returns -EBUSY instead of touching an object that
the driver may free.

Fixes: e381322b0190 ("leds: Introduce userspace LED class driver")
Cc: stable@vger.kernel.org
Signed-off-by: David Lee <david.lee@trailofbits.com>
Assisted-by: Codex:gpt-5.5
---
Trail of Bits has a minimal PoC that triggers this crash on a custom
kernel build, which can be shared further if needed.

drivers/leds/led-class.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index a51b0ed53886..a697d6740011 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -616,6 +616,9 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (IS_ERR_OR_NULL(led_cdev->dev))
 		return;
 
+	mutex_lock(&led_cdev->led_access);
+	led_sysfs_disable(led_cdev);
+
 #ifdef CONFIG_LEDS_TRIGGERS
 	down_write(&led_cdev->trigger_lock);
 	if (led_cdev->trigger)
@@ -636,6 +639,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	if (led_cdev->flags & LED_BRIGHT_HW_CHANGED)
 		led_remove_brightness_hw_changed(led_cdev);
 
+	mutex_unlock(&led_cdev->led_access);
+
 	device_unregister(led_cdev->dev);
 
 	down_write(&leds_list_lock);

