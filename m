Return-Path: <linux-leds+bounces-5151-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 410BEB1353B
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 08:59:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60099174C1A
	for <lists+linux-leds@lfdr.de>; Mon, 28 Jul 2025 06:59:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B6AB224898;
	Mon, 28 Jul 2025 06:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iR2H1KRh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81448221FBD;
	Mon, 28 Jul 2025 06:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753685969; cv=none; b=U7J/UBhGNqBqnMdYJtydt7Lx5FGR1rC8WaXatRotDzcXv0O2NevAWN2BU7v5md7ZZ5keHU0v4wgrrmqGQwYbLbEyvnU3mZF8dR/9HhrZMh3X3XkSBNo3a7QbvEQx3nPsn8t6nSetW8rTScx/mBaEnej7KZLFefGmfXPuqNItmHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753685969; c=relaxed/simple;
	bh=1gGQqcuTpwlDuOG5nW9o/+/3vvav73+T6HPmtWFDrh8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ER+Mq/XJSKoTryEKQDjS3rvqUwXHbGG+SL9uzage6W9cjGPOR2AWdNpldo6OKZrHgikkYuD4reiXWU2TNtFNvEQs4VFiAfeByELQUjyTVDdl/RUeX5PKExhZDU5FUEW89oj50Jrk8uFygzWcRU7TJfiNi1VDFCbcmbN+1QUHl3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iR2H1KRh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363616a1a6so32091435ad.3;
        Sun, 27 Jul 2025 23:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753685967; x=1754290767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkKBohb0H+Mix4rGG0STRwa3Ll+wukMWMjrkix/cROM=;
        b=iR2H1KRhKkSV+d9vtr4qxEPWZvc5P3MUPDQXyjpZLWph+OuHKgtQYmtFK+h2juTmGR
         x7gNJxTEL/udf7D0mQKVaAO3P28RWCmJzEf4h44TDv6Gad9nAOc+bvM9hfetVjWoY1eR
         r1Nh3xqdHjn+7Vw0crjQ4vo2i72U8wQEWZDO5OYnAn1uX0+pie608GLCXinUCAWPqUWg
         kT0f5OGs5i69D7muFaa8HCfASP6UtbJJb/bYa2+T+eIj5vo7Xw0NUFkZ929yt0nJrbqz
         WpDEFzEMYeDWsQlGw4i63BujejTs1EhDEKCXbl7W1oE1J9s50rq+BLX3+RLCj+hiIM6m
         FOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753685967; x=1754290767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OkKBohb0H+Mix4rGG0STRwa3Ll+wukMWMjrkix/cROM=;
        b=bIpd9UpzaHnP4DcYXjhUxGfgCdOcf4A5bk59Jh6uQW8soOQKN5s+fpItuebDFY9Z7s
         /ES0nip8Jx3fbWl4aoUignQzRNfsH93XiEU0n85uB5rYQG3DuhWsuRSukfFlp/DwhOMt
         weX1XgDuot/3CnL5cxV9bbum6NN9eLPOUquhzjVduVOFNm9TWpQAbf5mzg7uAlfxn/qc
         Kr0sPtwJjAa1u+6cjMWSKlUnb8fIUsRGRItILO/iL5hrdZRHS8+uzesaXQ3RzjLvACB7
         AenOryorR+44lf5nqjZaNeB/F7hbEnUjrYJwloeSqe7D4vIVmiD9497F0BdHwC9Dl3Ol
         gWgg==
X-Forwarded-Encrypted: i=1; AJvYcCUhjvSuiLO01KD6NU/td4qU8iON9tUl3G2VYGqo0XI4gMx9V2I5BEwMqUWRVR7fqrDjsHl5pOHaAoPiNk1v@vger.kernel.org, AJvYcCVF77nJ9t+xK5Xd6EB0OyO5QuzsWHUQvALlmH+t8ikNf9og3Uz7/aWmxqos9+pt4Q3Q6Vpz578RVel7@vger.kernel.org, AJvYcCWRCCmo2C1vmzDk/399aoVTS8BQMLUfUWJBJmXSvv4VdxfAxv47WA4e3s9dbrkLKiR4e4GGC9k2prZLnA==@vger.kernel.org, AJvYcCXV95ckDeSbSMYdMzW3AVbf1D/ZmmT3hD8Lld45H7Z7FD46dZj6mbgNz+I3jDLp/alCAok4LBaxpHUG@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Du509DXkrBuFRfT8scC1vXgto7dwhvvP2/7TDuWZ9VOK8Z/0
	QIlKW8RUi4+MPGgSYHwRWDDjncL38Oxq54v1nLnLxjKavmiDdUtdzUU/
X-Gm-Gg: ASbGnctlSbTYPQbNAy9X4Ktycs/7rIr6F7irAtzGvE5HfkzIeXe8R/RW4Zec+R/e4FZ
	wsuAK5yXRr8FGgYGOIJngaAY3iCBa7M0MqE+V+oyJMndj4dZIXiJgV92T/ieM9fTn6FT/LZzU3/
	JTc6/trfTYf8Byy9cUStg3DXR8RWPdXo8eN1ei8DCG3Nce15YxnlhWX7jF4p/YVKJMR9zWNyAPE
	qGz+toSTVACUst2TaI7rpxy04oNSRjj31MQ9VodDn1+t/t0tYCzl+QaOmnXyW2fgCPKxyFJeGbB
	UddC2sts/X2S364yGGl/fnzLe7oD/kz8Y1gV9mPcWQQnkgPoaRDXKt6oV7U8qlIcXVLEkw7C5S8
	I9EGiaO3LPueBDkGZxZfEbv2ZFDoNdmh0OTGxGcHrvNuG7neA
X-Google-Smtp-Source: AGHT+IH+zoKeUdOVxEIwJ5VGmhXghiMyPZxDAWa5ZPvQkqkUR/BfemWKzPCaRvIlTtHMXX2xvor8/A==
X-Received: by 2002:a17:903:98d:b0:240:44aa:7f3a with SMTP id d9443c01a7336-24044aa8419mr7348505ad.31.1753685966705;
        Sun, 27 Jul 2025 23:59:26 -0700 (PDT)
Received: from localhost.localdomain ([171.254.200.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31eff8b20d7sm1050375a91.38.2025.07.27.23.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jul 2025 23:59:26 -0700 (PDT)
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
Subject: [PATCH v12 4/4] docs: leds: Document TI LP5812 LED driver
Date: Mon, 28 Jul 2025 13:58:14 +0700
Message-Id: <20250728065814.120769-5-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250728065814.120769-1-trannamatk@gmail.com>
References: <20250728065814.120769-1-trannamatk@gmail.com>
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


