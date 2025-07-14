Return-Path: <linux-leds+bounces-5063-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A4B04673
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 19:25:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D1B81892F44
	for <lists+linux-leds@lfdr.de>; Mon, 14 Jul 2025 17:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F249267B01;
	Mon, 14 Jul 2025 17:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hkNU2zvo"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7287267AFC;
	Mon, 14 Jul 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752513878; cv=none; b=QuelVp4pfR3WQYTx64BQi78prU/7kdEzDf0PoOy5pzE5/8Eyb6943Y5JBbr9AvyFK9nAEkCu5rXl20aCaSMaXH3E1KUH4K6g2NC+NBNaGtO3dMgJ190c4pw7D+4ZJ0kPuNYiUL+c8BC8O5dwWoOdy1yU7fGmljc8ElwS7IDNXuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752513878; c=relaxed/simple;
	bh=56Sl/nGt3m5t3J5G+VzsIzv0+c8kzRwGZwhJI4NYYaI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ctP1f6/oueXSlMs2WCBDO3tx+elIEyNaD6jSe3VZ7sgqr/RC+ivY2/nHEh+Ys4CQUH5cGLQC8aXdI0YlWHETvopWRYarHm7Fef1bH8y/bUffJtmSf8pRq9OE5iGtGJbxR0QKTUusZyBiXGIw7CrcdxVRXWvsNXFcrApBU3PB6UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hkNU2zvo; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-748feca4a61so2572243b3a.3;
        Mon, 14 Jul 2025 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752513876; x=1753118676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4V9Yp9AA3hWAb7aqFhJTn2UKytTjSMNN61SVrfVNk7w=;
        b=hkNU2zvopT3DJgrEUqXD6pMaRgQgNkTJNXjVdsFpoWWD1Or07isluURJ/oZeTGDZ+q
         DqWb7kFkkeeuExs5EbWKmG2jjB7/fO6kqRaSRxFDX0wQkvgSd8G/7zISCtWse4Ool9Fk
         qrpbefK0Hqfh02FqcyybEn3mCZeS23r3D1w5LkClN7gnmNRx7ECLNyYl0llyoh/4M+vm
         LjbWSFBccP0b+CtiX7p6QmjEBSo8C8q55VXXQY4fI+svHA3zmhOlMsm12btbgmd1yUo0
         wlJiIGQUHdBUy3vFmOF8FeWmBooE4NlwIou0QIAIJb93dajiU4t8LPTMl+bbDPWiIYk3
         U0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752513876; x=1753118676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4V9Yp9AA3hWAb7aqFhJTn2UKytTjSMNN61SVrfVNk7w=;
        b=QXLKCC5QdlXzDEXhaNz3TlwwNkmlYKbnLepHOIPR9uvcNabfXKlf+DAl/csNJWP7pQ
         3RJ8szwkAVqWoKiMe9dxlTZSv7LELo8MKalcwBaqJF6sgo/ZhN7pzPegXOfhmh6AFCE4
         oTLprRgyrKVTz9C1+f2GLUGzY9HmctIQVG78/jtq5/CF7nFqFMXIPNGz2A6aon1ffJQz
         5LGW8uEA4pqjsEdUKYntN138x+F4vw1PcWUZsrHSEX/DgvpeH4Wk1qKNvxoy8l40yxRJ
         evIeemgrmCMmb2HSKzXTpM6jOyVoiLWrRSquysnydn8pkuxjNVzu/MPHlYcBSowQ3nzw
         v9uw==
X-Forwarded-Encrypted: i=1; AJvYcCUKNl6Mw1BigeE7Vmlcp7TfaUUAD/gfEq7DSN1w5Jldm3nhYvE1V/cLG/YN+1ww1b96O1nqRIS0ItPyJeRR@vger.kernel.org, AJvYcCWq+Yk0q/MC7zKUuOcFOsJBD7fMoGy+7NLX1oeKv1+awTtALwwJYK11QX455saRotcsJYrbebFMab8G@vger.kernel.org, AJvYcCWr5T4XGu3z38p8QaLWhT681tGGzwc+00k+1GucQsK0lesNp/rCT7SVNnF04GSK73owni4ozKrq5qHGiQ==@vger.kernel.org, AJvYcCX+0wtEvQE1/mZeeLhAmuC/gqjDpZdi1jrCXAXQu8i5tzuEVFQn911H67KEzgdq9+O0ai36OymkGwsr@vger.kernel.org
X-Gm-Message-State: AOJu0YxKxu2MUOh+UpE3DpBywe2bchwiqTgDv+8hsTmJs4CrTbSR6IIy
	9oP/jJkte9/jFNal5TEZUQh4BzezJ+c9FgCxWJouTRil0zahWHmhQJP2
X-Gm-Gg: ASbGncvJ6vskCKXUxwgiB05dWCZsKq71KIbW5bPKy5uY0Tf8zeODiC/Wlhiw2CR14Q3
	5Z52wqONQf+irqlk57AyRjDJPEUuxzrDaf46Gam9SnX8IJyU5nMjaaIETHVjMmS83yx7/8fFg7x
	sJOMP0215msc9kcJuRGVRIED4rBA9GYsgJaVpbXwL5DufkeeqqJRHx+Ny1jkimV29Sw3/B9WEpx
	Dfizuw3gNSTHv8bQdzfAgwEAmLtZToqZonf6YpBHcwJ7CRQuqAGqdSus2USLQyAWONoU2/3SLIV
	OshtuJZQ6WURVJbcJxjxBQ1Mg8+5y+i42fqVLE7cAhl3Z7tFggzw4Mo+cu+vpCQpLxVMFXhvehq
	zFrWbzOGs8tlqNoF1ibSS8DBLFOCs+PJqsA==
X-Google-Smtp-Source: AGHT+IE0vWBFAezL6BFt/xd6WGaxPsrHQkKxkqR4Xfc2/0QldAgEmWlTpd+zhOh8PwX2N7mWh7mZEg==
X-Received: by 2002:a05:6a00:3cc9:b0:747:b04e:941a with SMTP id d2e1a72fcca58-74ee274d335mr15918850b3a.17.1752513875900;
        Mon, 14 Jul 2025 10:24:35 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.114.162.205])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9e06537sm10495468b3a.43.2025.07.14.10.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 10:24:35 -0700 (PDT)
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
Subject: [PATCH v11 4/4] docs: leds: Document TI LP5812 LED driver
Date: Tue, 15 Jul 2025 00:23:55 +0700
Message-Id: <20250714172355.84609-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714172355.84609-1-trannamatk@gmail.com>
References: <20250714172355.84609-1-trannamatk@gmail.com>
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
 Documentation/leds/leds-lp5812.rst | 84 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 86 insertions(+)
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
index 000000000000..4538cfdf415d
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,84 @@
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
+autonomous animation control. It provides features such as:
+
+- PWM dimming and DC current control
+- Slope time configuration
+- Autonomous Engine Unit (AEU) for LED animation playback
+- Flexible scan and drive mode configuration
+
+This driver provides sysfs interfaces to control and configure the LP5812
+device and its LED channels.
+
+Sysfs Interface
+===============
+
+LP5812 device exposes a chip-level sysfs group:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/lp5812_chip_setup/
+
+The following attributes are available at chip level:
+  - dev_config: Configure drive mode and scan order (RW)
+  - device_command: Issue device-wide commands (WO)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/class/leds/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (WO)
+  - mode: manual or autonomous mode (WO)
+  - led_current: DC current value (0–255) (WO)
+  - max_current: maximum DC current bit setting (RO)
+  - pwm_dimming_scale: linear or exponential (WO)
+  - pwm_phase_align: PWM alignment mode (WO)
+  - auto_time_pause_at_start: config start pause time (WO)
+  - auto_time_pause_at_stop: config stop pause time (WO)
+  - auto_playback_eau_number: Activate AEU number (WO)
+  - auto_playback_time: Animation pattern playback times (WO)
+  - aeu_playback_time: playback times for the specific AEU (WO)
+  - aeu_pwm_<pwm_id>: PWM duty cycle setting for the specific AEU (WO)
+  - aeu_slop_time_<st_id>: slop time setting for the specific AEU (WO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A in manual mode::
+    echo 1 1 1 > /sys/class/leds/LED_A/activate
+    echo manual manual manual > /sys/class/leds/LED_A/mode
+    echo 100 100 100 > /sys/class/leds/LED_A/led_current
+    echo 50 50 50 > /sys/class/leds/LED_A/multi-intensity
+
+To control led_A in autonomous mode::
+    echo 1 1 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A/activate
+    echo autonomous autonomous autonomous > /sys/class/leds/LED_A/mode
+    echo linear exponential linear > /sys/class/leds/led_<id>/pwm_dimming_scale
+    echo forward forward backward > /sys/class/leds/led_<id>/pwm_phase_align
+    echo 0 0 0 > /sys/class/leds/led_A/auto_playback_eau_number # only use AEU1
+    echo 10 10 10 > /sys/class/leds/led_A/auto_time_pause_at_start
+    echo 10 10 10 > /sys/class/leds/led_A/auto_time_pause_at_stop
+    echo 15 15 15 > /sys/class/leds/led_A/auto_playback_time
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm1
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm2
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm3
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm4
+    echo aeu1:100 100 100 > /sys/class/leds/led_A/aeu_pwm5
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t1
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t2
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t3
+    echo aeu1:5 5 5 > /sys/class/leds/led_A/aeu_slop_time_t4
+    echo aeu1:1 1 1 > /sys/class/leds/led_A/aeu_playback_time
+    echo start > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_command
diff --git a/MAINTAINERS b/MAINTAINERS
index cdba86f1768b..4fefc7fb7a9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24568,6 +24568,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


