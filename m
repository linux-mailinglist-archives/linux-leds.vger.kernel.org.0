Return-Path: <linux-leds+bounces-5417-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDABB47C43
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 18:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 06BFD3BDEB8
	for <lists+linux-leds@lfdr.de>; Sun,  7 Sep 2025 16:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09FC5286421;
	Sun,  7 Sep 2025 16:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gdqJUrws"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7A8284880;
	Sun,  7 Sep 2025 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757261435; cv=none; b=laXDE815QvzvqM3zXBPFTyu5bEib+y87Dweuku/tQCAp5VieBJ/J86sNxJ9zS3iZ+odzNjMaM9kWsudfvELB43jOtm2AECk5uzZs17K8ZkDK4O29gs7V3LjINfdOKjxapijDPORGe9M3PS9hYcnI43G4q5lo+q0d5uMwtWUSwTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757261435; c=relaxed/simple;
	bh=otyisc20vzfW4PJtAzrpxOdjA2MF4wWpJ0My0UioLDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dDVaqkWXyHIjVPgnFwPJ/MmBJVfaoRSwTC/pfskQfequBRrcKMgc4QVkP//uRxEw1VwdaH6MNtvlm6vfxSv0gvtKXTKtFayLUbPjZyhHGiaHiZEub9f+nXmOoDF7O2thNLhBy3hs4vtiK4Ev0Mu/P9ePY9b/NoLshfOzrIU6PCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gdqJUrws; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-772301f8ae2so3013632b3a.0;
        Sun, 07 Sep 2025 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757261434; x=1757866234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NvJaMdJGzKNuuA8LYBP9BoqzQRKH33YGKRWQDpchLxQ=;
        b=gdqJUrwscS0b64aHPO45G9elVRk5wacSnh8lxMnVJcmnTr5F6GnG9/DRyN8QgOOL/S
         kvK0sN2P/wdef+q/aCy98HyximXYEIXWKJ8XthF6EzOhfeyn0VoMg+8QDMlrv0adQXlp
         1jnCyLvVcZKLT6A6yaTpq0nEuuqnyPQVnlFYQfz+XX9A0AlEIAmkkigBDgmYYj7tSv4n
         x78rut+JzE5Y5miK4XiF0/DO30w47tMHKT08yB8RPP0ESEFWoRJBpKUHxsQGKhobq7rb
         mXwCNeYVjO9tUMJMucJ1hIhjE0hLTueV8SQgaeZGiaWd9Nihz79Uv8YhoFPzZpck3QJU
         7mQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757261434; x=1757866234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NvJaMdJGzKNuuA8LYBP9BoqzQRKH33YGKRWQDpchLxQ=;
        b=vGt7M/fxuG/82wHBCSwcNxz/zjf8MsiCb5mmijnCyiWngtJVCKrMq7QeaBZxyfStqj
         3uAVOGOQ1fZMOjWylRS2MPmeCLFL+t+sscdP4zq/9kPXSvrkyOhtOvcQpYJAq82UOpIy
         G5/cUTkthbPhN6s+1ULYfQVUIwOymiI7zeAx/x4EQmE5fyAU2SMl7lJgezFxpvN/6UyT
         yV7eDedlnM1Rlg3UR4yqArMlsP1iTzmdXtyuasVwGKKCItmesoq5tKnwXnhB0hnxciAy
         JQey5+lUxsmqbRLcVFitwFAd7sz8gZjL6WJ3gXBMvJLVsBU9FwCRlzS8U7WNjF16nnfp
         u49Q==
X-Forwarded-Encrypted: i=1; AJvYcCVlIc79HYQPdf0s+idYgXiascuaYkxUYRmZw4q5t8jNekgMxnjX22KAI4XanKKK/mrETzaZHUL94ljs@vger.kernel.org, AJvYcCXKpA+/86gDbRfaU5vsCl5LYxHpF2rLpTJ0XtH2+rxCUCWS97OBleVZgSHCYM07CpI00UNMeKs2CdaYxA==@vger.kernel.org, AJvYcCXKwL7LoCSLWdbHJhv/Z+iG0ts6uh51/mges0KJGpFEVka9pTSZeoTpG2tHfkj3noAsDAtFg2D8ENcHnOEn@vger.kernel.org, AJvYcCXyr6QRqfn7XX9CR25P93jr7RKfxNOvxkPI/Y4Ba07KNiyRHcXVsAvFf6SJs6U6sENvmWAv9bSwW6G6@vger.kernel.org
X-Gm-Message-State: AOJu0YyAR9GexI5vKC6jnc4kg4Swk/6HQtN+1TknULPedqISTLMi9nvq
	Q4358HEuPqxS6qIau4BPJd46xADoF0F855ZOtAHBEhCk5J0KBBEVVrd7
X-Gm-Gg: ASbGncsbuyNeHNzUf3cwaSODRr/4QRhOY07R3TgM5g24xni+icBxK5TCa0e/SsSdh/J
	xzcfB08PAKbIYrdv9xDDmDb9qXp+BbpWK9DtlqY/xjlYZAF6WvDw8dq9Zp5DlDALESoCLizgoQH
	yX1Xgi9maV4KEC76VQd5U7OxeoNbz/by2uq5fQqVj17neOKcJKjTPRKKYNIUNryvIzUuvHz9CDX
	cdXJ0M5QPmCgp02mv3XT8SJfFda0qEfmiZcc1XjmglxVxCmmR8d8+7VvbUer56+2bPruHXtnLeH
	ULjgoChLK6Ub0FPDcNnw+9Z2qxEFVoYVPxB7iqBzoRzzBH6Zod8oydfTzGZHKsyDCl43X2/+aM9
	cJbpuvBorj2DqyHZuwa9U5ho/GFfEBbbgxm7z
X-Google-Smtp-Source: AGHT+IEvSnWyErzA/x4Ar7PaakHPOs7AcIbttSxk2Ko5nEouly7FI/zmRQpjCsruxepPlOw4AXeKbw==
X-Received: by 2002:a05:6a20:a110:b0:246:458:8540 with SMTP id adf61e73a8af0-2533e57285fmr7748333637.1.1757261433672;
        Sun, 07 Sep 2025 09:10:33 -0700 (PDT)
Received: from localhost.localdomain ([113.177.224.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723534c0a8sm25352541b3a.79.2025.09.07.09.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 09:10:33 -0700 (PDT)
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
Subject: [PATCH v14 3/4] docs: ABI: Document LP5812 LED sysfs interfaces
Date: Sun,  7 Sep 2025 23:09:43 +0700
Message-Id: <20250907160944.149104-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250907160944.149104-1-trannamatk@gmail.com>
References: <20250907160944.149104-1-trannamatk@gmail.com>
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
 .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 32 ++++++++++++++++
 .../ABI/testing/sysfs-class-led-lp5812        | 37 +++++++++++++++++++
 MAINTAINERS                                   |  2 +
 3 files changed, 71 insertions(+)
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
index 000000000000..75cdb051b500
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-led-lp5812
@@ -0,0 +1,37 @@
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
+		Provides the LOD (LED Open Detection) and LSD (LED Short Detection) status. (RO)
+		Format:
+			<led_id>: <lod_status> <lsd_status>
+		- <led_id>	: Channel number of the LED
+		- <lod_status>	: 0 = no lod fault detected, 1 = lod fault detected
+		- <lsd_status>	: 0 = no lsd fault detected, 1 = lsd fault detected
diff --git a/MAINTAINERS b/MAINTAINERS
index 7672a23312ad..d0941561d4df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24997,6 +24997,8 @@ TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
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


