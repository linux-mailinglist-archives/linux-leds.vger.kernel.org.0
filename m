Return-Path: <linux-leds+bounces-5418-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 654C1B47C46
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 18:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 16CD83C29A2
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 16:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB9828726F;
	Sun,  7 Sep 2025 16:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nP7Me94v"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBFB286D5C;
	Sun,  7 Sep 2025 16:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757261441; cv=none; b=phsKbBb8Mx7rGUI/V0GKSMUGfc0VRhjf5L1NrOicApnEulCpvhz5fiBAwKalFMDEwDAuKTuNnFYAIkBwjFXn5Dh2XTzPpcwRcbncslJH8Dt/k778YlFQDiIu/IDSw9dQf9vaP2hMuj9EQHtTip+XIGqeBi4kpsVh+zEK8HIlooc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757261441; c=relaxed/simple;
	bh=fV6xlsutiwL37sLGH7NPPEApyi66umpnz1GhoiegY3Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uQTsVwaQjK3B+Qk/lDM3nEuA7mAPRhoZolgGA6ZST8jpRWUBk7I7AILreCMLJLNQBz8hnCE/xoq+pjzF1Epc5yJS8n4ssiPg7NcBod+BGOTWgMrqtAHQaiFXi6/bjCavTlIQ1yi9+R+LMUKubOTSQdziKQJjhMYrG8ESMfai4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nP7Me94v; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-77251d7cca6so2917351b3a.3;
        Sun, 07 Sep 2025 09:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757261440; x=1757866240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+KC5QPt6XPsxxa5boGZqLiqeKzj4yDVyOcWFsMlsMJo=;
        b=nP7Me94vrN6dan5ezD3mqenfFV39YVrLB7RIFUlESFTZO0AVR14M8lHbz3aiD9VwU3
         x6vmLtmyWnGTtLVK6hlN7Dx/6giWthD47H2i5d0DgesSaDHAmqBlOFoiPGeMYqCwwFH9
         WCnCb3oj+RyngzNvK2UjmuO917nvKcqildA3Fg7Al15rJ/yGYOwnUWc5gdF3RLSDPsB5
         IoNnMEF8PP85o1UoUyKddhU7vDoL+OeBiE2R549QHKFLbI0mZ8KUK05RjzCVJ2QWvDw/
         SjBHknCb38hmmx+wciT3KRvgLjYhwWm1NksuJoQ3FNcucffFKgMjqoye426V8MiwsgJv
         19Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261440; x=1757866240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+KC5QPt6XPsxxa5boGZqLiqeKzj4yDVyOcWFsMlsMJo=;
        b=J4TXYv9cuhf5d2gmFSKa3ktkHa8a6lGbyqr77FnK/TiEqW53Iyo/+Wl+JFJfoDd8YE
         oyUceY9AAG80vaAWwWX1NAjo+f+ATEnQAGN7oqQTeTtwZXx5ko82AU2ROWhsGJ8ExtZv
         JXn7mSquOgoNlFTJqpAqLmQQZTkGVuFC1nuLgpaKAlzSR7J9bCzd+TlzfT1+HXzHdDRn
         O1whyVHgeJmpsaVnaKJCi87N4ANAjszHDasTamQJnuUxlbehl4J11PMwpiXcjPdf7RrN
         x3qvdE7rxXaTxtvdjXbiTPyXnplKtobugGCsZBtzmSbFqsYDZgnZDeE++yiOp87sBWdx
         HHFg==
X-Forwarded-Encrypted: i=1; AJvYcCUOIuAub2+QcONgHM3DNN3tSoUDVeMGLw6m+zqD3vhLWTMEMpHy+x8gi6BzaJh+FZIn0Rt9wrHHhBsk@vger.kernel.org, AJvYcCUoYueKDdN4OtcDwMnueU7EIS3q2xpGOh8G9oUc/rqYDV0xdSqJAf9FS5CLKukO2f3yfQoib7URfI/LRLSB@vger.kernel.org, AJvYcCW9glIfv4TEN4YWVVS014+DEBJ04b8Wul43kGEypJaSPjR2ortlLOjdl4HyMxes55N+dB5lN235QlIn2Q==@vger.kernel.org, AJvYcCWlC+MR1mJwx5fyq2ds9VPpIXGKjUz/WaLN6T+k+XyAUtgqtwu7glPEzpFT77HWq8axxHgdWeIWcuLu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0W6wPSeiwadQFIyHQHBv7fx0GIrfT1OfYpsu0lL47L2vcq1PI
	kGrzTp1TB4FRxk9+L9n6jjIUZsgck1Je/FLqJX+mJ1KXs/9a2p83rcyk
X-Gm-Gg: ASbGnctPDQvEXHpUCpFygTDeFe1va5CUNsaJyy2MXw51x6lc38hUPxFcWUywWJ9TR+o
	5/Ah/tdPurUOU+Zmv6TCqpboSr78ZPUdvO0qKCkSmKtT+StcuHq1xwiLbTA9Rmy/tea+gM9fU7M
	7qHO+upaRqMH2scSK2J9duG3a+hL2WoyIE1HuyuQIgdtRaQxrg3h6+Mdp85DYTPkIHtqEcjXnAr
	w3h+6M14wl9N8PxC6ay5msyo+41vq6sc9UiMk76PFn0kxm6fOPrJVgMzKmxDBqWOrQCjOA33Rm4
	h2+WTv1+0SU/kYK15ZIFa1CZl3TRRYy83TnimURwF+roDWzZ2/dlDCcQFcb6z9Twgu3cC26e59j
	mGF5QZoA8Sxpp2/TDR1e13asa2fs45aIjY3ebbCAwdPsOHY0=
X-Google-Smtp-Source: AGHT+IHENQciT6K1N813HUMikOlXOAEV8TsDATIxDXoqPAnxY27QEFefRWYP51ipWGYRnKy+4SXawA==
X-Received: by 2002:a05:6a00:138f:b0:771:e4b0:4641 with SMTP id d2e1a72fcca58-7742dca625dmr7245057b3a.1.1757261439686;
        Sun, 07 Sep 2025 09:10:39 -0700 (PDT)
Received: from localhost.localdomain ([113.177.224.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm25352541b3a.79.2025.09.07.09.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 09:10:39 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v14 4/4] docs: leds: Document TI LP5812 LED driver
Date: Sun,  7 Sep 2025 23:09:44 +0700
Message-Id: <20250907160944.149104-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250907160944.149104-1-trannamatk@gmail.com>
References: <20250907160944.149104-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control and configure the
LP5812 device and its LED channels.

The documetation describes the chip's capabilities, sysfs interface,
and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-lp5812.rst | 46 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 48 insertions(+)
 create mode 100644 Documentation/leds/leds-lp5812.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 76fae171039c..bebf44004278 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -25,6 +25,7 @@ LEDs
    leds-lp5523
    leds-lp5562
    leds-lp55xx
+   leds-lp5812
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
new file mode 100644
index 000000000000..7d464334557c
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,46 @@
+========================
+Kernel driver for lp5812
+========================
+
+* TI/National Semiconductor LP5812 LED Driver
+* Datasheet: https://www.ti.com/product/LP5812#tech-docs
+
+Authors: Jared Zhou <jared-zhou@ti.com>
+
+Description
+===========
+
+The LP5812 is a 4x3 matrix LED driver with support for both manual and
+autonomous animation control. This driver provides sysfs interfaces to
+control and configure the LP5812 device and its LED channels.
+
+Sysfs Interface
+===============
+
+LP5812 device exposes a chip-level sysfs group:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/lp5812_chip_setup/
+
+The following attributes are available at chip level:
+  - dev_config: Configure drive mode and scan order (RW)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/class/leds/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (WO)
+  - led_current: DC current value (0–255) (WO)
+  - max_current: maximum DC current bit setting (RO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A in manual mode::
+    echo "tcmscan:4:0:1:2:3" > /sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+    echo 1 1 1 > /sys/class/leds/LED_A/activate
+    echo 100 100 100 > /sys/class/leds/LED_A/led_current
+    echo 50 50 50 > /sys/class/leds/LED_A/multi_intensity
+    echo 255 > /sys/class/leds/LED_A/brightness
diff --git a/MAINTAINERS b/MAINTAINERS
index d0941561d4df..ed3df4f84b8d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25000,6 +25000,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


