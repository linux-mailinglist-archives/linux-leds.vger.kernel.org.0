Return-Path: <linux-leds+bounces-5187-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250FB17AF7
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 03:46:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7F5A9166AFD
	for <lists+linux-leds@lfdr.de>; Fri,  1 Aug 2025 01:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D26EA7262A;
	Fri,  1 Aug 2025 01:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4KPAkV1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394F41C683;
	Fri,  1 Aug 2025 01:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754012814; cv=none; b=XAiPNu1o6hz4uY1FS08qxHFMBbx/4RmDFHMsjm5ivODXPNZPxWCIM2BO5Ryg9CMOwwwSnqaygJ785A74Tzx3F8GQoV6vs441kOwa4YmNC+PKv0UbVz6kXqmUlVeDvH6o0jvdo/ZhPC1XPY0SwR8tPeihGcHy9MRHozl8eISeYT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754012814; c=relaxed/simple;
	bh=YYfnwaU2YOGJ7AFmccYeg2FiCUU+20P3ULo5LK90Sjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rx8Lfw5XSpL24qCwaTSsNNRcGnM6JsABJjc1RqYV6DHF8cgLHqZMXNgFh8wjh9R57VDSG3EauW8fYIptsP6IkcnrIJ/4qnPCepp0Q+SretTnuSVQBQp0QtZDyISP0Wg54nEkGZaxYc0PSHFOWa0rwr8SyhdtQrWDTOf/u6bCas0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4KPAkV1; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b3be5c0eb99so976218a12.1;
        Thu, 31 Jul 2025 18:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754012803; x=1754617603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X2hhQ1eT+/gKOxmT2TqJqg2gW8rdjYFSQOxpgEIgX34=;
        b=G4KPAkV1Km7iNoPHEsNeusm5H5JCpx/QgA5bej94UGi2S2FavyWcnJUgM3Eza7FPeP
         CyljKbTxrdLhjTA0Ucuju2+o/hZpso514m3P/a+Lq1nn4ssvWcOJfn2t9ZgnuCFtA/3k
         SNmxv9HWR7XhC8mx/+4Xf1wFryA9M0n9XWTQ3MeLIxaRe6f5aAZP855jZ5C08YzDh0EN
         oxJSATtVDFziIxYVX3isxgq5HlrgisgCCkgDoO8/nN5AFQfmc20GmI8G0gwjszpTm7Io
         eeGJ9xYG2Hrmc77cVcGbGMEgD6wCtLEY/5Rkp58+J/i9xuapr6gb2GNEvS2fCkIcVYAC
         iF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754012803; x=1754617603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X2hhQ1eT+/gKOxmT2TqJqg2gW8rdjYFSQOxpgEIgX34=;
        b=ZWBHTOhby3JAhcxaQ/HBqAQO49y7Y+vYlXDSMXKwszTDtDjexoGGvVB6SQuQsNONo2
         /pJVR5WdMZfb3fZkwqu2fC/V+CPk2ovTVNozJ4sxukGvB/VEPmZaP1tcECc82lCg84A9
         xeOFKPQ/fkXquC6X9EPzYERkpvqcBUj1vBttW/RlavDU2F57h0o1wBluwpGkEE0PS2fl
         7ovdKus1+3kMc182L85/NA7a4BCCH0JVzJ+Ndwpa4mtSEj5qqUCMnfChwT3z3ElM7jf5
         fTuUH+QqkU9X9W/DO0zplJwEfXNf28E/gjDKmF0/tTh1h3d9Kg9QcLUyavOn0IT87qSo
         sUhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUedWKzCwHcp9EMjs73AvvWORAa90X/HvvNR9kOdQ7a/evr+W15kS2hxxO9fqztO80vb7M6TXHFNAoT1Q==@vger.kernel.org, AJvYcCUhFg0a3nBDMKaUtKbpE3JPgNmWfVlBnw3MxRS/SbA6QGZMZoC8GbduZoPlDMqNOyJQVGcLUgTw6wzC@vger.kernel.org, AJvYcCVCaSI2tTTz8reSpMXhAQ6SwoulTX/WjVvel/Y9gGzEIxbqsCZe5sppRNhQTiSFrsf+y8PN78nhmhTt@vger.kernel.org, AJvYcCWaduYpFw4nask+qFeZEnygQ3NO7/Voc0p+afg8zMouBhU2OuCS+0/o8cuFitAtnGR6Xin0l9l2cKfsxE+M@vger.kernel.org
X-Gm-Message-State: AOJu0YwgCVKHD34xHVLcQczHjja36sSpZDUkaoTqJc0KVDnCaF1EHpmp
	YUPj7ICcVgwF8+WYiYQJMs+i0g8xPsHGTBc0WYBh75pHXx0Ev0b9GDoA
X-Gm-Gg: ASbGncvCKApLZjQdmf69cdv3GBNvoP4g9wv5K9542RsIwvPfGR6s2DNigGBvgakjITz
	gcWqj2ncIvIYPyRqnkGbWqtKSMNO4MJ5mu3J0FoWzfJk9OwTi4bFu4ZYTlZLXJnsspF7YmrPm5S
	0epk1IZp68kgkmT/L9rlAuMdT8tRG1gqP1tb5HSNmCq8Q285dE38KjPeQ4YFqRo1+87MwZzy0Xo
	2p2s1ao8S2JN0LahsvFdaMVmIf5YAABXOE2oS3lwtVr4VPGhvNXY9yhutmWVo/AV7FRcmptIKes
	EWW6JgmMSsITnOGNkAMKWEczNbxkDJI7bE7tgNDJG5e1RVOxg8GxGUvND0mz2gNSMNLOGnysxXt
	y5FueWMbAMmnrhlioFbinKi210rOcVwxrfGe/
X-Google-Smtp-Source: AGHT+IEGStLZ41HeRELMaOM+Dii8mAZC+3YaLFUMvQJHH3MLjxUSwKui4NzNvFydYaiJj/TsTIFhYw==
X-Received: by 2002:a05:6a20:5483:b0:23d:9cca:e710 with SMTP id adf61e73a8af0-23dc0f60332mr15305321637.44.1754012803285;
        Thu, 31 Jul 2025 18:46:43 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.32])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b422b7b9377sm2514011a12.16.2025.07.31.18.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 18:46:42 -0700 (PDT)
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
Subject: [PATCH v13 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Fri,  1 Aug 2025 08:45:10 +0700
Message-Id: <20250801014511.139862-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250801014511.139862-1-trannamatk@gmail.com>
References: <20250801014511.139862-1-trannamatk@gmail.com>
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
index c2e1c02e206d..608a7f3feb07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24827,6 +24827,8 @@ TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
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


