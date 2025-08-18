Return-Path: <linux-leds+bounces-5232-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 836EEB29636
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 03:29:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C311F4E7DAC
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 01:29:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5BBA241665;
	Mon, 18 Aug 2025 01:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0DKkNGl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51D8223C4E1;
	Mon, 18 Aug 2025 01:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755480456; cv=none; b=A9EdZ2x6+FpWNT4VgdlZ+IJUgdoQ/8As2eMB6s8eMCv/SoKMQIb2U8s3dfpOCirSC7J2jwf2jgqfjVaJ+xRfekdj5ELDKqY8SLfFzflfaCoMAtrYxdtK43PCvXY9IZ+qvnpQ0RfEfqrFqZRvOzY+awO3hZopXNwpBBUKPvkcr+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755480456; c=relaxed/simple;
	bh=ZVmPBePIfMrVHilLCY3efrpm9cVERQhSNA6dF6YblyA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8QEj2QdeYdigs0i3JQ0CWavuwXTNA0xeQ2HtjIJ9XORAGRTpdh2s/hrofcGNngXJqR35+JHqjDycZiQksLJt8A9fFMpoACiOj9qb4NF//tX38E0W6T8ndqePtdXLFAM8TdMJLLvYYHSrTgt1hP6/OuWEbBSQiGSWuheHlEuFmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0DKkNGl; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso199323b3a.1;
        Sun, 17 Aug 2025 18:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755480455; x=1756085255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4sEwWCKhE9o9XO4kAyIp50H0a35S3OvWlZDhc+P+nk=;
        b=C0DKkNGlmgjCt4e7My3p7CALy4Pgo8JI4pEqxPFo2xBtu57RNHhp8Ab8Yg7+QFI7Es
         lrklvVjtNIZnmMGOCdrhZSmIAXUrTefGLOmJmjnIAX8Z1iQ3jNOBKhGU3mMvnhEQkq8d
         0c0SaE1/2XeXKJmN/96kf1IESv+TfvSxjZ1DLM3wpSeQi0mQrIKFdSXunQOljOSum2A7
         KdLt01eoy+d2cJ1otV++xI1Z6UHZzHAKBfmAzjk70K6SpIESdTqa3WjIJPr2Aq01KDLf
         fbRPRVRp7I0Z2FSZLrCq3h8f6hAJuwAyOydJFUpwagJpxAdhh/hOf67ubCJIsNoUzZE2
         JNmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755480455; x=1756085255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4sEwWCKhE9o9XO4kAyIp50H0a35S3OvWlZDhc+P+nk=;
        b=lEpqWcicI5tTEtbuxAO1t+H+w2yKl6Hj8aruortdcwSQAkhzhhqUOfxqCFF/+vyZMm
         xgzT7pz+ecLk1T3Mt+p13uLbyhK/+/57ZJ0kEhhoSy0LAcQ+DuovvYzH7PSZtvEexDS9
         fTYIm+k7Y38BYBShWW6b9PMZn3HcqnFKmMt3KkJLZGbGyPRJegi+5NgY9tqFpDEq4kmC
         2fCDlp82lNGNe+Epbh52TmX9hdC60fETDDBruzyt9q+VU3XscI/CZYA6WDvuojiotNBF
         UOs03bB6cbC5QNVc4AB5R0YFdY/jqTjDmat7DK/awXVA/HZKlPJf5WsoTD6rO8TaiGPE
         5A+g==
X-Forwarded-Encrypted: i=1; AJvYcCW3623lao7kEW3MJYhcOtQTuHwtUyA7G7ESnT8FLBjHQdf9bNydOjNu3rqsDnx/9M8N2WmdYg2qp0NP@vger.kernel.org, AJvYcCWcq5HY5N/dApNkd7htgW3iNztRV+Q2g8eoR0KFxhqOL4cofbP2jUlHx6KvcJvyVqg60daIBKsWmbW+DPvL@vger.kernel.org, AJvYcCWyIn460NyaZF0b2z+Ec1M3OlvBmFHdtTbg7jwlivMDI3s2TD6/aaaqsi1Kecb2nml82slxeyJb0ZovOw==@vger.kernel.org, AJvYcCX+q37BhW9LX85gZd4EC7Kji3AAtp35GweZ2E3YQ0oD8lxnrobOoe5orCpFPmdr5hemmayL+ySzrgTQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxuGbu+fzhbDoFn/NJK5VjTDPhqXgI+y9TX2qOpR2+xgtPHAj
	m5hMSJ/7llAOuRFbsKzOtXtBl4LyjJ13ouYgn0NUV8tdfUJe6gCqKZSh
X-Gm-Gg: ASbGncvQDcXIJ7NCumMkk+LRvR3b8CzUrwRdpFyF/Mgwi1/oIYz85OLCgDLSSzqrMM8
	fltABF9DkW5lc1ED5L5UHC5De8ffjFgYjB1QdUT3eHUYbGzoVC0G+R0VjQTfCx4fnKDrwi3nowf
	qlu8oaxcsGvHpa62bIPykbc10/7Ylb6jz5IBxv+kRctXVenHR5TsQipLSONlQKAYX/nHbmUjD1b
	rjG3s1uVK/3E9qsD1bqoq63rCJgECjmrfY0/WC42mqUpqOsnnUgDbcfaIr+50/7q8V3iGqTyQV+
	8wVg9Yh2/cLoLo3UOpq7p+BC6Z1rdgWY8Yh+qoW4qhJUKNf8Py9aYZU7ydMY2E/4HmDWnDko5n3
	F0bpHVFRUogWjV74rvX9EA/onBeyRR+6ptQ==
X-Google-Smtp-Source: AGHT+IEgXDKUjPvb/XntPJ8pVPGK/cIPn/RC7YCkx1B+xX2nLMXiMsDBQ68Vplx3QL/ZiwpBS0T8iA==
X-Received: by 2002:a05:6a20:734b:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-240d2ecc10bmr16294408637.23.1755480454625;
        Sun, 17 Aug 2025 18:27:34 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.205])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5d7070sm6709620a12.15.2025.08.17.18.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 18:27:34 -0700 (PDT)
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
Subject: [PATCH v13 RESEND 4/4] docs: leds: Document TI LP5812 LED driver
Date: Mon, 18 Aug 2025 08:26:54 +0700
Message-Id: <20250818012654.143058-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818012654.143058-1-trannamatk@gmail.com>
References: <20250818012654.143058-1-trannamatk@gmail.com>
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
index 608a7f3feb07..42af71c7634d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24830,6 +24830,7 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


