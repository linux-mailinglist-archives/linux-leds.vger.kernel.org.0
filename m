Return-Path: <linux-leds+bounces-2116-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35173915FFD
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 09:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB50A1F216C1
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2024 07:27:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5B21465A8;
	Tue, 25 Jun 2024 07:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fiLdymO3"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6362A47A62;
	Tue, 25 Jun 2024 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719300433; cv=none; b=TH8pBTWXc7f2NKJTWdFse7jvtc7WB9ei6wCF/HmCqi41Di+ovYCT7tkBDwck324qK5FPknerSdmmlJUKg+kCLfn6zj2FYn98e6i1RJHtJA8MQS8sTMV1KmBfEv3JTZ55VPtOcm49ruzrEl7MlV8tS9G8PjBNgmgBpmS9TkrkMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719300433; c=relaxed/simple;
	bh=lJBO5Xr3y8UyNfpkut/1aUlPHZv+VPmTSnKltu0XKWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kbvkK+8E8ZYxOevnrjsgD4v8Q5BnqbNkOtvQly2zRFbNryiOIW2eLxoztsNn113oIEnRxSNkB/D+n9fqEKGN/jQr4k0qUg/amqEH1j6QK0ghzpny5aiaNqdVY0j24KXwqr/4RK6hpWrHf5slkN8CpPsNDkElqyK66ngeda3JFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fiLdymO3; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2D46DFF807;
	Tue, 25 Jun 2024 07:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719300422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eS1gGHdeDvor6v+HrepgkoNZKmKQm9q6TmuiRUXqTqY=;
	b=fiLdymO3QmiNgwe9NzjQ7G53GTQCB41tLJlOcS+idNunSHoDtKsm+Ke/l2n1sABZfnNHE0
	JXhoyhdbJ2A5rC9+Ai+0S1k5rNU4kfXATpWHXMdff6Xtjf4lGSXgDK3kVWV1lnu49ZJdmm
	eIIISRFWUCkjmPamTCV+F8B5Klwu3mKzTmYcAqvXNP1OLUhfbJuKNXOi9dWwZeTP6JSlCu
	vphOF0XTECfi8VSljR0YwTTkzDa8Vd9PWLG8cVIgei+JayyybaeBSbXWg1sLm5swHfXlHl
	BxePu02gwMjKpUVGncM8LAjCYpaNrv8PXWrHzVpgZW4IIH94lSB6yD0phXx8qA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 25 Jun 2024 09:26:52 +0200
Subject: [PATCH] Revert "leds: led-core: Fix refcount leak in of_led_get()"
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240625-led-class-device-leak-v1-1-9eb4436310c2@bootlin.com>
X-B4-Tracking: v=1; b=H4sIADtxemYC/x2M0QpAQBBFf0XzbIrBkl+Rh213MBHaKSn5d5PHc
 zv3PKCchBX67IHEl6gcu0GZZxAWv8+MEo2BCqoLRw1uHDFsXhWj6YFt8Cs6V7WeOipd24F9z8S
 T3H93GN/3Azq7KRZnAAAA
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Miaoqian Lin <linmq006@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: luca.ceresoli@bootlin.com

This reverts commit da1afe8e6099980fe1e2fd7436dca284af9d3f29.

Commit 699a8c7c4bd3 ("leds: Add of_led_get() and led_put()"), introduced in
5.5, added of_led_get() and led_put() but missed a put_device() in
led_put(), thus creating a leak in case the consumer device is removed.

Arguably device removal was not very popular, so this went apparently
unnoticed until 2022. In January 2023 two different patches got merged to
fix the same bug:

 - commit da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()")
 - commit 445110941eb9 ("leds: led-class: Add missing put_device() to led_put()")

They fix the bug in two different ways, which creates no patch conflicts,
and both were merged in v6.2. The result is that now there is one more
put_device() than get_device()s, instead of one less.

Arguably device removal is not very popular yet, so this apparently hasn't
been noticed as well up to now. But it blew up here while I'm working with
device tree overlay insertion and removal. The symptom is an apparently
unrelated list of oopses on device removal, with reasons:

  kernfs: can not remove 'uevent', no directory
  kernfs: can not remove 'brightness', no directory
  kernfs: can not remove 'max_brightness', no directory
  ...

Here sysfs fails removing attribute files, which is because the device name
changed and so the sysfs path. This is because the device name string got
corrupted, which is because it got freed too early and its memory reused.

Different symptoms could appear in different use cases.

Fix by removing one of the two fixes.

The choice was to remove commit da1afe8e6099 because:

 * it is calling put_device() inside of_led_get() just after getting the
   device, thus it is basically not refcounting the LED device at all
   during its entire lifetime
 * it does not add a corresponding put_device() in led_get(), so it fixes
   only the OF case

The other fix (445110941eb9) is adding the put_device() in led_put() so it
covers the entire lifetime, and it works even in the non-DT case.

Fixes: da1afe8e6099 ("leds: led-core: Fix refcount leak in of_led_get()")
Co-developed-by: Hervé Codina <herve.codina@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/leds/led-class.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 24fcff682b24..b23d2138cd83 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -258,7 +258,6 @@ struct led_classdev *of_led_get(struct device_node *np, int index)
 
 	led_dev = class_find_device_by_of_node(&leds_class, led_node);
 	of_node_put(led_node);
-	put_device(led_dev);
 
 	return led_module_get(led_dev);
 }

---
base-commit: 28ef3e64d0a22f6a29a1ea489293715a29623e52
change-id: 20240625-led-class-device-leak-6637a2821678

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>


