Return-Path: <linux-leds+bounces-4475-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D057A886A6
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 17:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2929D1907F6B
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 15:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD7A427A91B;
	Mon, 14 Apr 2025 14:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFWewebr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253CD2749FE;
	Mon, 14 Apr 2025 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642720; cv=none; b=aILY5x57n4Mym3bnGZm1A88OD2Tcb4XmR5ys0PWOLbVhLulBliwUZgeorNhAjYOM88ddgP1XoonfVJlsjVcw45IaY/Oo7dbkh1G8ZPlpVr480rK1KzMyzQzwWUXl27JXOpVGP+1gFXx/NPjuBeJzlJ8t/pWd+cVTydKxYT7yrAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642720; c=relaxed/simple;
	bh=uNzEBYYeWZ0JrshHd/fFWSH5sM4ByHVeqJ2yWPX78kc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QpjSZ8SjU4iU1eoQmbgqiqjcEuLdI8GvN3rDCqCpQkdA7RIceowHOxwLf0t6NOMaOIthIVlFlGI0ymkFJVF+P5ck2GUy/TEsK29lXNX1raRPB17Uxiln8mJ19nXEj/nAOpFbGJ7oeMrfNMW3wzPZvONM0jWouohyIn2JwQDydzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFWewebr; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736c3e7b390so3684326b3a.2;
        Mon, 14 Apr 2025 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642718; x=1745247518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFHc0+rdKUSUe10/QTRrHY5vFMfBpRXmipu0sviFp+M=;
        b=PFWewebrmCbNgkco5vL8tbaos9fFP2iDwBMPl1/bpwuwmU/jkmGWhCEJY3ro918A76
         Q5dIM7//HasjsB4plDGc6ImEPb5Xtyx840Pc62q+U+VBxaE5g/gDZGGeFn5Wej3Rj5+X
         5YmGo7d0k6Uz6zeccLwrgyHokj4AcJvOorJ06VyKQnyg78awsuIGQs44Y9ARjcrGV3xv
         WL6boGKQqaW/DUGKGkBu18cZCZHRdc7MOG/GrCO4wBdqkEh8uD5zRgbTz8vjOJWJQ3zD
         ezNdewnobiQPN3UBx9gTUCwmL9/vpw+yCP1PSavSKY+go4oos4qUu5sahlGcVJM6ZlDu
         byZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642718; x=1745247518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFHc0+rdKUSUe10/QTRrHY5vFMfBpRXmipu0sviFp+M=;
        b=TZyykjY1IDbQEw/zHsKjPWOiy6jDI8vYlQ32s7/GzdbSn9Maen6CdGt97/4Qz/IQUF
         730VTy4kp0V96LD8RWfzO7nZi1af+NlFU7VJ7fKIbgM0vY/IKn4nZsoKFKIWGgzIwvWW
         d5fFlZtIn+ZVrsZFmZiBFzdSsRtYZ5n5YviWgWv6znZ/79bAngGM+A6Z8wMbz6AZ0Fd1
         mJNh1bBr4YqhmVBz21ek/FtitIfOhwpaPot3undycQMrkPxyOHpuH1VbqlS4vo76oHtl
         PkwwgXr3TlygKhhoqOrbm1js9DTqeFLG/3KMzeXrFSPCMtQiU0wU0YUnDo2Tyjk8Wiim
         n58A==
X-Forwarded-Encrypted: i=1; AJvYcCVRItzmpyK7xmH3N6JRUXrEPwBMN0/XfksRVRP4z8dt89X2NExRzgpuAn/d9RfAOBWPHmm15p3GtnUqdHE=@vger.kernel.org, AJvYcCXcuWvEpyxDv/a4np/+FEs6cwehtFsoXmDkdqKOimLM8iIep4hClYKuhD/YfMTzP0lpJxtjbzretO035A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIOzSidsMNLFusC+34nk/4jKapV9lr8PpDeey+FdMHHfZ/Xnxe
	yMypW+ForRN6ROnuZF6ipyyOqY8Gz1cC58ZiXuNBAO3uTiyIMjnP
X-Gm-Gg: ASbGnctv4odpw3Z22ap6yXangm4efIVLR3z8bomZ8n4UIZjahnXJ4hWJjtM4+kBgl21
	RO08ZRI9Qup77yn6/XKgDBCzAsCbruBVX2QcxMbSAuP3hnoNFtCt/JTRa+8g7tAv0jyDdSdAcy2
	UVP8/Gl3DwtTOMCqpsaLLlKHCEY7HyfFF54/k0jjguKN701um93PhWd4UhuKEXRnfsbNagzBENE
	BlPC1YRnvWexS2f3mr9dTZNAu/iALDhY0WSR+tukdeKK75CCN5XtKX5orA7GlVAmU1nRblgEVV2
	auTFjhWwcmSzpzNZZpdJGJgTPhDJg4+maeCYlL2NSVBp09o01088IQ==
X-Google-Smtp-Source: AGHT+IF2WvfgyLaBDaeMpZIg3TMae7dsGBIZnXI/8bTZM/ZMJHBnHDfKRI4RIVKWZMbyLLs0YrkfhQ==
X-Received: by 2002:a05:6a00:b8a:b0:736:339b:8296 with SMTP id d2e1a72fcca58-73bd126735amr17984709b3a.18.1744642717952;
        Mon, 14 Apr 2025 07:58:37 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1071sm6632165b3a.120.2025.04.14.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:37 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v5 4/5] docs: leds: Document TI LP5812 LED driver
Date: Mon, 14 Apr 2025 21:57:41 +0700
Message-Id: <20250414145742.35713-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414145742.35713-1-trannamatk@gmail.com>
References: <20250414145742.35713-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control
and configure the LP5812 device and its LED channels.

The documetation describes the chip's capabilities,
sysfs interface, and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/leds-lp5812.rst | 79 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/leds/leds-lp5812.rst

diff --git a/Documentation/leds/leds-lp5812.rst b/Documentation/leds/leds-lp5812.rst
new file mode 100644
index 000000000000..ef182f859f86
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,79 @@
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
+The LP5812 is a 4x3 maxtrix LED driver with support for both manual and
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
+  - device_enable: Enable/disable the device (RW)
+  - dev_config: Configure drive mode and scan order (RW)
+  - device_command: Issue device-wide commands (WO)
+  - sw_reset: Reset the hardware (WO)
+  - fault_clear: Clear any device faults (WO)
+  - tsd_config_status: Read thermal shutdown config status (RO)
+
+Each LED channel is exposed as:
+  /sys/bus/i2c/devices/<i2c-dev-addr>/led_<id>/
+
+Each LED exposes the following attributes:
+  - activate: Activate or deactivate the LED (RW)
+  - mode: manual or autonomous mode (RW)
+  - manual_dc: DC current value (0–255) (RW)
+  - manual_pwm: PWM duty cycle (0–255) (RW)
+  - autonomous_dc: DC current in autonomous mode (RW)
+  - pwm_dimming_scale: linear or exponential (RW)
+  - pwm_phase_align: PWM alignment mode (RW)
+  - autonomous_animation: Config autonomous animation mode with aeu number, start pause time, stop pause time, playback time (RW)
+  - aep_status: autonomous engine pattern status (RO)
+  - auto_pwm_val: pwm value in autonomous mode when pause the animation (RO)
+  - lod_lsd: lod and lsd fault detected status (RO)
+
+Example Usage
+=============
+
+To control led_A0 in manual mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo manual > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_dc
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/manual_pwm
+
+To control led_A0 in autonomous mode::
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_enable
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/activate
+    echo autonomous > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/mode
+    echo 1:10:10:15 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/autonomous_animation
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm1
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm2
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm3
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm4
+    echo 100 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/pwm5
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t1
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t2
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t3
+    echo 5 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/slope_time_t4
+    echo 1 > /sys/bus/i2c/drivers/lp5812/xxxx/led_A0/AEU1/playback_time
+    echo start > /sys/bus/i2c/drivers/lp5812/xxxx/lp5812_chip_setup/device_command
diff --git a/MAINTAINERS b/MAINTAINERS
index 63ecb019e3bc..4433cfe7491c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23940,6 +23940,7 @@ L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/Kconfig
 F:	drivers/leds/Makefile
 F:	drivers/leds/leds-lp5812.c
-- 
2.25.1


