Return-Path: <linux-leds+bounces-7089-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4C0mEg6BqGmYvAAAu9opvQ
	(envelope-from <linux-leds+bounces-7089-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 19:59:26 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB7206BD9
	for <lists+linux-leds@lfdr.de>; Wed, 04 Mar 2026 19:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A9A413036C90
	for <lists+linux-leds@lfdr.de>; Wed,  4 Mar 2026 18:58:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9212E3D5242;
	Wed,  4 Mar 2026 18:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wo6JTunx"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F9C3DA5D7
	for <linux-leds@vger.kernel.org>; Wed,  4 Mar 2026 18:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772650693; cv=none; b=dy7M3Vg/n/jsVLVmnewR5duF63x+Nfo74CMuX+JURtMaGzY1p6LynG9gTYLCf/1cAYLLxceYa9qeHpAY7pcDE/4xY/11fVUtwbNJi7es832qynXNF05vRs+lLvdPjTcMOLbSXwGsiG7dZVDDug7JBwwCtGLHd1EDIP7ISrKmkZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772650693; c=relaxed/simple;
	bh=iAwN1L5RO+DcRjbiVg9nB/v71sR6G3TJGVFbQvAkWCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qIw+AEkurcse0WmLBf2FKLqjPtp5DAfBOCciCQO2shrdoDlNXx/wdCEhZDht4Q3k+paZ8GW1sg5a2NHeKng+lXlbnjowTb/wgu6fZV0GaVbkV010t84JGSgddWd422XJzrNh6fhGgB+W2m9sL1Z0c9SiVm6x+pIPK1NbQ7AG40s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wo6JTunx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-38a27d39067so27902101fa.1
        for <linux-leds@vger.kernel.org>; Wed, 04 Mar 2026 10:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772650688; x=1773255488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KTN5RIw3jy7znvqFB96hO7oLoRvfbkutQBACbQ/WQc=;
        b=Wo6JTunxe4SklQRnE8CMfK4Txy8k7pXW7nr8TyTFoRB+VERRiwA9k2ts7l1C3GI1BF
         LKAhGQtzrrKfF86HyWFsVN0jKO+xEwrexA1J9oqOomUVpoTNl0Bu+5j1mt6SwdSXDLGN
         4EkO186J2TUcC8KgbZLkxjrSI6/l4KSrVSUl+f3Db45T4lIRCWrTojjmRBC6wkv0CI7q
         gdcrqtpKUbmEg2hiGz7bqboyiw+nVTu2PitlwHMhnSZaJxIzztnGr+UvNui4qVlyEOPc
         PnX9CKP8LrOSqCksrEGmqgpEz3yXydSHz8P8TBAuDnHbhw9wur8iwpyeGHOjTJfcnWkk
         uPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772650688; x=1773255488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7KTN5RIw3jy7znvqFB96hO7oLoRvfbkutQBACbQ/WQc=;
        b=FLmc7hHTVAiW/21x6lhlQm3SdirwxtwznOzw04afKQEbqHRRd7wzKn8j6DjgQrNs8L
         Jbwqljik42HII1dOv7Ua/Zw7TQZE2TTg2dfN2Lly25PXk9B/d9W1ZFKR8WFd5uoIlSI2
         yp0xIpRYwMVNTm1xAPVW9zJ2h2tki/znGSPpxRgeCQWcZ6qLN05lcgYKTuIlkQ23KwG1
         uABSZapWQ8bLDUFR4u5mdr24F8EBtRxjtDSCf9KIHS0aFC3jmwKkZxCgupRXbN30HdVm
         Dj046cTFF2Ne0zJzB14tOIahYCjPEmnELB8c7uCkLJLan5GnnR/nMg6DVnyt0LcihqmU
         u8uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKHx5vX43VXymDvA+jF9hyuY0WbUPKxbbwNkHESy7gvHywPNR5uFpFD3Bt7RSZ9bShcIbQ5emr5Il1@vger.kernel.org
X-Gm-Message-State: AOJu0YwE+BCt0tgpvRz4iLtPuGMCAZjSwUABDFlScgyb4NtQLp71RylE
	KDRuJAlf3WttpvoCe16LciHD3KYGR2bfcRqwjJrCN4vUxHzL0WSr7+OZ
X-Gm-Gg: ATEYQzwfGa0mddUFgf+/egqi6vphfQE8UbUc6KX2DxAPpNU9x7N0si12Qv5FkUJ+Nw8
	OS6oqrsGYX48GkdfdJD76cvbQyPv2afAFdimfwnDtF+NELWiL1zXUBgJK7llc+sRaEk6//5dsRH
	V4/1ub83gdHBvjdJ5g518S6fUzgcg//iNzswrJjXiIVBs70O3g8l2GXGkQKZlGPhG0jFWCuouaF
	B+Hqa68Va9LkaT7k1+7vhVhU3mV/QS5F/9v/maondwdZATajQ2cbZjP5Njf3JT7+ACIGjckFEKp
	NUIB+mzQX71OFberG7tx8aRR5DmELbGMPEvp6F+GRmulXlBIPXwiTjnf7kjAwr7E4+PQXWOlJ2P
	ESir/YTpxb60QklneLm4IEg4MM8NygXxvbLO3N1J94cmSYNCURINEgfM8TPd4XMrsJb91FJpzPg
	hZk6cJq83TwCVt
X-Received: by 2002:a05:651c:987:b0:385:bab3:5ba7 with SMTP id 38308e7fff4ca-38a2c6af560mr21897461fa.19.1772650688249;
        Wed, 04 Mar 2026 10:58:08 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12a6ddd3bsm704985e87.0.2026.03.04.10.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 10:58:07 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>,
	=?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v5 5/7] leds: Add driver for ASUS Transformer LEDs
Date: Wed,  4 Mar 2026 20:57:49 +0200
Message-ID: <20260304185751.83494-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260304185751.83494-1-clamor95@gmail.com>
References: <20260304185751.83494-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 6CFB7206BD9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7089-lists,linux-leds=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,agorria.com,rere.qmqm.pl];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qmqm.pl:email]
X-Rspamd-Action: no action

From: Michał Mirosław <mirq-linux@rere.qmqm.pl>

ASUS Transformer tablets have a green and an amber LED on both the Pad
and the Dock. If both LEDs are enabled simultaneously, the emitted light
will be yellow.

Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/leds/Kconfig                    | 11 ++++
 drivers/leds/Makefile                   |  1 +
 drivers/leds/leds-asus-transformer-ec.c | 79 +++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 drivers/leds/leds-asus-transformer-ec.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index 597d7a79c988..bda06dc145d7 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -120,6 +120,17 @@ config LEDS_OSRAM_AMS_AS3668
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-as3668.
 
+config LEDS_ASUS_TRANSFORMER_EC
+	tristate "LED Support for Asus Transformer charging LED"
+	depends on LEDS_CLASS
+	depends on MFD_ASUS_TRANSFORMER_EC
+	help
+	  This option enables support for charging indicator on
+	  Asus Transformer's Pad and it's Dock.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called leds-asus-transformer-ec.
+
 config LEDS_AW200XX
 	tristate "LED support for Awinic AW20036/AW20054/AW20072/AW20108"
 	depends on LEDS_CLASS
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 8fdb45d5b439..d5395c3f1124 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_AS3668)		+= leds-as3668.o
+obj-$(CONFIG_LEDS_ASUS_TRANSFORMER_EC)	+= leds-asus-transformer-ec.o
 obj-$(CONFIG_LEDS_AW200XX)		+= leds-aw200xx.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
diff --git a/drivers/leds/leds-asus-transformer-ec.c b/drivers/leds/leds-asus-transformer-ec.c
new file mode 100644
index 000000000000..3186038e3be7
--- /dev/null
+++ b/drivers/leds/leds-asus-transformer-ec.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/err.h>
+#include <linux/leds.h>
+#include <linux/mfd/asus-transformer-ec.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+static void asus_ec_led_set_brightness_amber(struct led_classdev *led,
+					     enum led_brightness brightness)
+{
+	const struct asusec_info *ec = dev_get_drvdata(led->dev->parent);
+
+	if (brightness)
+		asus_ec_set_ctl_bits(ec, ASUSEC_CTL_LED_AMBER);
+	else
+		asus_ec_clear_ctl_bits(ec, ASUSEC_CTL_LED_AMBER);
+}
+
+static void asus_ec_led_set_brightness_green(struct led_classdev *led,
+					     enum led_brightness brightness)
+{
+	const struct asusec_info *ec = dev_get_drvdata(led->dev->parent);
+
+	if (brightness)
+		asus_ec_set_ctl_bits(ec, ASUSEC_CTL_LED_GREEN);
+	else
+		asus_ec_clear_ctl_bits(ec, ASUSEC_CTL_LED_GREEN);
+}
+
+static int asus_ec_led_probe(struct platform_device *pdev)
+{
+	struct asusec_info *ec = cell_to_ec(pdev);
+	struct device *dev = &pdev->dev;
+	struct led_classdev *amber_led, *green_led;
+	int ret;
+
+	platform_set_drvdata(pdev, ec);
+
+	amber_led = devm_kzalloc(dev, sizeof(*amber_led), GFP_KERNEL);
+	if (!amber_led)
+		return -ENOMEM;
+
+	amber_led->name = devm_kasprintf(dev, GFP_KERNEL, "%s::amber", ec->name);
+	amber_led->max_brightness = 1;
+	amber_led->flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+	amber_led->brightness_set = asus_ec_led_set_brightness_amber;
+
+	ret = devm_led_classdev_register(dev, amber_led);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register amber LED\n");
+
+	green_led = devm_kzalloc(dev, sizeof(*green_led), GFP_KERNEL);
+	if (!green_led)
+		return -ENOMEM;
+
+	green_led->name = devm_kasprintf(dev, GFP_KERNEL, "%s::green", ec->name);
+	green_led->max_brightness = 1;
+	green_led->flags = LED_CORE_SUSPENDRESUME | LED_RETAIN_AT_SHUTDOWN;
+	green_led->brightness_set = asus_ec_led_set_brightness_green;
+
+	ret = devm_led_classdev_register(dev, green_led);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register green LED\n");
+
+	return 0;
+}
+
+static struct platform_driver asus_ec_led_driver = {
+	.driver.name = "asus-transformer-ec-led",
+	.probe = asus_ec_led_probe,
+};
+module_platform_driver(asus_ec_led_driver);
+
+MODULE_AUTHOR("Michał Mirosław <mirq-linux@rere.qmqm.pl>");
+MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
+MODULE_DESCRIPTION("ASUS Transformer's charging LED driver");
+MODULE_LICENSE("GPL");
-- 
2.51.0


