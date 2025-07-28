Return-Path: <linux-leds+bounces-5150-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A3AF6B13539
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 08:59:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7BAC57A27BB
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 06:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4DE82236EB;
	Mon, 28 Jul 2025 06:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hec2LZ8L"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB52222578;
	Mon, 28 Jul 2025 06:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753685961; cv=none; b=Ix86vGfgJC+guGELcgubTFNj/fUATVP5PNUq121+bsJkw1thv5P9XuIHObeWAnptv/Og72xyWGZdpOO4lgG7bjPRqzQxggNOyP5DfojZNhqxEXFBOn/mvzSeMJTry1YwNWKmE6jAlMaZHVNSXWdl5GvHc7vTjyO//8ybJqZJBNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753685961; c=relaxed/simple;
	bh=poEiReQdquF/Ec3/UMoyoZ+SE+g1ksP1lMeA7DXg4es=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V5ZFMpJjPga/SukJmD3pFYAXAoGf4u1lYJXP8wGlb00ta6/NUAgCM/ghxU/FW9KB+t/ctzwp2wO3AIPTbjHeqD6ud7z419TDG8WDMzjmIfmsEjyBf7tPAnLewVTsCf3I6UuFJa/95FNWsSM0oHIW1BR3PAB0wUFjzfdNkBxFkNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hec2LZ8L; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-23636167b30so36941175ad.1;
        Sun, 27 Jul 2025 23:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753685959; x=1754290759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22ZR6BbeqsvQRh8c1xVr6+MW4veqvGFQvLu3vUfZ9xw=;
        b=hec2LZ8LN/q6vNTPSZY3Xr63njTs0Zf/S8KvLfzPKlWpyAzwYjA9Z9juPJosgnhd43
         9sgeU7S/FdYiQGI2SnswTm5ecq7YamOwxGY7OXbMd8EcetKjTzlToyavlINRn16q2UE3
         5GuHhHr+Upl8rWPIqO2p/N6YyBeDP1xNhJPXqcWNTlRLPYPZDtWF9W38w5C+JUnDJxBO
         8btGtv8vuvgzH4tNsJxGY2wG1swzS6xQfTnsrh0JUdV3bRAZUnCoKX1QU2Gg+6DqZGnn
         3siD6bQc+Qz0KmonDQ2Mzd3sCbneOUV+9vtz+lvI7K8Ry/wIn9JRmJ6gLyJqgXBcStAp
         K/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753685959; x=1754290759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=22ZR6BbeqsvQRh8c1xVr6+MW4veqvGFQvLu3vUfZ9xw=;
        b=qqI1Bzf7y33Bsz6SpXyUoWIWDxUXMGyR16DjV/lHv/epNom30cxAqvUDxQhphPNLmb
         GGoJTdU39eruAep5qa1eWaEfQAlqOBgjVbyyAaGni/t3+Pikke3CH97xK5eSMicBUlJU
         3fYWDGc4erb3GE4MWVBOxHQG9Yi314cNppNioKYfDHNnbASgn+F8WxwHMr3/+fkImAy2
         tdq5AAc0YYwUHJyt9E6oY+ztrBAeGVzfTkwScBCobMfu/TQX2OdpcFcehCzQzoTwXLbd
         PzqBKZAvC+GGbyY6JkzfABJwtxKllCg3fAdMQMiR0TUr6moljc+nYoqPxuYK1SUR6AXe
         btSg==
X-Forwarded-Encrypted: i=1; AJvYcCUMxK9pJ6CXsScdtrvWmnMKGqrAHlK94+HGkbjGYNWmvnKFiUK38ZLFVczR1YcxUDnx/0IDTwrfZoEl@vger.kernel.org, AJvYcCWKhcVEVu29ydl2I5p297bSES9KIdmsPeRGVRZuoEQ/g6awpOQQbQflQuIe/X0XVhCZfwLOf7R4wldj4A==@vger.kernel.org, AJvYcCXkptpMOSz8Xz48nFNH81cvH3xv0adzeaSBfmzo9keTBjJ0tjmGKXuNqxYSED6Su93YgdaVQxdZ2I+A@vger.kernel.org, AJvYcCXq6eNXI2ZRQ9f9SUMK0wDGht0/xqOcyctgfizuRolJQrZ/SRrB6O6WXhRM5zc6p2Ut8XXTOF0tYqVdCOkY@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh3WLQVyV4HgO9JhyeHtWeLat4DJmmX5VoAgUmnI3leVs5ba99
	7Fhgi3V3/zx1ycW/hhF3+Hy0ANpl10/q0yGqO8GOWZPs3WXIrqrXfUaj
X-Gm-Gg: ASbGncuUMLEjgsq1NqpjGloKQe57YRIdRw7ZXqdi34WrRIDKzbGnKR3woCpZjTSCA2e
	l7UTz9Pf4GUn7FWdOs+8oDVGCYheC7jMaUR/pop6ssYwJtQlSX5El6CkOhqNTpTkjC453pd98bx
	yIrmxbW09lHrmxcCv/DUzcWHEsonXwwcxd8FocTBoLG8HnsfLcjKA/wL2cC6/ev4DoK4psejGtv
	jKGol8PXeOKIHHctbyC7BtjPEwKRiHDaPP/AnrjRgS6k+99R9odIk0yHDr9XNHdZB5Zzm07vY6r
	S+LY+Idzr3Aw1MZGJ1Rj6lCmgpbvVosPCFO6EDcPhXvalLPVVOhuDqB3plO4PsVam6hi94RZtFU
	EbinC8/InBJCz2A0v/rKQ9AXwtjfyRCfwlDpmHKeJRX/1MAAB
X-Google-Smtp-Source: AGHT+IHUeCIsp5cG76sAd0e93bXm6ecOD4cnXm1Qrq5a7ZkqSSP3jW7vOacsk5FX6JD8cnSYUZpVMA==
X-Received: by 2002:a17:902:e748:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-2403b9edf38mr29202915ad.38.1753685959165;
        Sun, 27 Jul 2025 23:59:19 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31eff8b20d7sm1050375a91.38.2025.07.27.23.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:59:18 -0700 (PDT)
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
Subject: [PATCH v12 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Mon, 28 Jul 2025 13:58:13 +0700
Message-Id: <20250728065814.120769-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250728065814.120769-1-trannamatk@gmail.com>
References: <20250728065814.120769-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 matrix RGB LED driver with autonomous animation
engine control.

This patch documents the basic sysfs interfaces provided by the driver,
including LED activation, current control, fault status, and simple
chip-level operations such as software reset and fault clearing.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 32 +++++++++++++++++++
 .../ABI/testing/sysfs-class-led-lp5812        | 32 +++++++++++++++++++
 MAINTAINERS                                   |  2 ++
 3 files changed, 66 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812

diff --git a/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812 b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
new file mode 100644
index 000000000000..d0d622753be8
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
@@ -0,0 +1,32 @@
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/dev_config
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Configures drive mode and scan order. (WO)
+		Some valid values: tcmscan:4:0:1:2:3 (default), tcmscan:3:0:1:2, mixscan:2:2:0:3, mixscan:3:0:1:2:3
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/sw_reset
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Triggers a software reset of the device. (WO)
+		1 - resets device
+		0 - does not reset device
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/fault_clear
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Clears fault status. (WO)
+		1 - clears fault status
+		0 - does not clear fault status
+
+What:		/sys/bus/i2c/devices/.../lp5812_chip_setup/tsd_config_status
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Report the current thermal shutdown config status. (RO)
diff --git a/Documentation/ABI/testing/sysfs-class-led-lp5812 b/Documentation/ABI/testing/sysfs-class-led-lp5812
new file mode 100644
index 000000000000..93eeecc60864
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-lp5812
@@ -0,0 +1,32 @@
+What:		/sys/class/leds/led_<id>/activate
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Activate or deactivate the specified LED channel. (WO)
+		1 - Activate
+		0 - Deactivate
+
+What:		/sys/class/leds/led_<id>/led_current
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		DC current level. (WO)
+		Valid values: 0 - 255
+
+What:		/sys/class/leds/led_<id>/max_current
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		Shows maximum DC current bit setting. (RO)
+		0 (default) means the LED maximum current is set to 25.5 mA.
+		1 means the LED maximum current is set to 51 mA.
+
+What:		/sys/class/leds/led_<id>/lod_lsd
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	Nam Tran <trannamatk@gmail.com>
+Description:
+		0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)
diff --git a/MAINTAINERS b/MAINTAINERS
index b4eb3265c800..cdba86f1768b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24565,6 +24565,8 @@ TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
 M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
+F:	Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
+F:	Documentation/ABI/testing/sysfs-class-led-lp5812
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
-- 
2.25.1


