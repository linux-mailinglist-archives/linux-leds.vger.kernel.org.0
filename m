Return-Path: <linux-leds+bounces-5770-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7DBD5862
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 19:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CC6D18A1FA6
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 17:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C0308F2E;
	Mon, 13 Oct 2025 17:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPGIi96D"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83CA307AF4
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 17:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760376981; cv=none; b=U+O2vsvZCklCyXpVlzabnwdRReGZxpiJg6eC2hzTdyl/JwEr7o1kRNnI92o0DgmDwF3mGIE3zs0waSRr7n5Y1gZ+vlWabaBMEyl/6r/sO0hKcf4OQEdNpX849IRMCwiYJ5cfYOzPh1rB9x2C/fMk8RUk44slX44+6rOxYJqDH2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760376981; c=relaxed/simple;
	bh=kLhYvW9AlQj3sw1QpHiRoyVeEgjoCSxOeoymqVdqNfM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KVXGtjTW20X7tGFS7m9pc8AgLHqTIHZRlAo16bF8jScMo/c6EgJpdYvp+v5WfK/FZEnZ/+zCaMMdU/UdAYR84UGJ9g2Xkq4uGkgnDdeC8AIh/8Uigyd2YB5tpx75rcA1jHwgM1W66OrJVknKm0Rnxmhcm9xYSojTmeu3KWINtY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPGIi96D; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7800ff158d5so4204598b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 10:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760376979; x=1760981779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATjbUVjPtgk2XgFOIG18XCiG2R9zjwgC0SeHYooUTnk=;
        b=XPGIi96DDR6OCLXKkcE8BymmlmVKx2STHm4imtuIFGaF8LCkvDnsDv8W2fOwmpcVcH
         bglAtmzFauzwVLMOemMRSZQ5FHO0qqZtgJbA/gPeep9KJHkjpwqmZO11bGE6REtGZeYn
         mvJiJy0CA5D+79023G81CQYNcdEecAWkE66Dw5FxY8BEGwo7q4BS5M1PdkpDWcsHvvvJ
         DgAdfAHzP6RzA9romX7fkBuWGkUI2UFCuf2kcUXOifDlt2eBmzWLLpRIwbsRnmO5vL+x
         kL+kDJ5xFkOHc7RlAFP6AlR+TUErEGCdyCjVnFb85nM0pG+zwCH6O9oXTRvAie3H9/Pl
         zY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760376979; x=1760981779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATjbUVjPtgk2XgFOIG18XCiG2R9zjwgC0SeHYooUTnk=;
        b=p6kyfhckb6fBHQ7FA4pXRM1acUupGw4VaeMk43kddzNvgJjbBc/WM7PVLWFI/v3sNv
         IqjXq4PBge4mUcM5jqhNVLVhYLPwG0aY+pL2Pq3ueIQO7FnrhdvRRL+gGpFsKUCcqK4c
         5v0T7PNV4foubWcx5Zoax29CtcyVMnnv24YMi/xUamE5cEiFXtqfXwIuX47C0oppAnSf
         oCp4sTx9FbfXecYweFDiBTAzZZGpgBskDYE7zw5WfNrXc5u4WUCer8dRUgeQd+DWA1KP
         ATH5+WbYLNmiyujJZdfD6Kv8R3GYc30ggs39Pz6A5XcEpYGxS9Iv2hWGLI3DlQB569Ef
         BM8w==
X-Forwarded-Encrypted: i=1; AJvYcCXZqKMXpbK25BhGOKbMt/+5CepRHnsSTwmWNVIu4Lo7ARauzFqSrbZthaklOsGY8aT7UAvcKhrgiMhn@vger.kernel.org
X-Gm-Message-State: AOJu0YyPFCOeYwlMXtC24kmoMfeAGBQE3zSvrK/k6iJShjzBEGl576Yu
	UvINUw6ke1kV4+nGQ4OTTKYW8GiDVGeMrh/wSAICj5Y4UD6GvIhB3MB0
X-Gm-Gg: ASbGnct3NAyP8NrCzPciXiwSpYLo5BzfxnHdzYymZzQZ6lW83JXODFaO8q74ofMN0S2
	HW09rJ6fpVipYIK0h6IwGEqfhNbwjG/MhnEoHZJNbb+Sa0+tc/8LhKHvFg83lvzEYnOrMBvzYP1
	aDSqu+tH282SW+bhis0A1tKcWKjmsIticdDBhNFiVvyK61j6bDrgDnwaq6ritIEwYQFk26gxCdW
	m0Dg6mgFwfhu9VLwBTTntAtrswxtzE7mA4XZVOMen4xD7KVQq3O6HWrExxQrRUtu2vYwdq684pL
	V1IpUfuYn/uPMnNaM/E3zCX6W/y+pkn6jUece1Z5pR5yIT0ofWrDUqkPNZhDnem67/TWI/SVZ/I
	SprMZG4LNu1qkJj0D+1vymHCOcJcS0lSvGzPrVUmY+bBdG3ziPt/+gIR9aPSgf5U=
X-Google-Smtp-Source: AGHT+IFS124pQtyx/H2Lv0NWRAsl1qkpj5e9oFH32lZ3m9oPB5Gj53gUtGzgXf4Pr7LrwD/HWfgOgQ==
X-Received: by 2002:a05:6a00:2e89:b0:772:45ee:9b9e with SMTP id d2e1a72fcca58-793857fe5b8mr22582029b3a.9.1760376978836;
        Mon, 13 Oct 2025 10:36:18 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([42.118.149.214])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060754sm12424546b3a.13.2025.10.13.10.36.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 10:36:17 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
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
Subject: [PATCH v16 3/3] docs: leds: Document TI LP5812 LED driver
Date: Tue, 14 Oct 2025 00:35:51 +0700
Message-Id: <20251013173551.108205-4-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251013173551.108205-1-trannamatk@gmail.com>
References: <20251013173551.108205-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver provides sysfs interfaces to control and configure the
LP5812 device and its LED channels.

The documetation describes the chip's capabilities, sysfs interface,
and usage examples.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-lp5812.rst | 50 ++++++++++++++++++++++++++++++
 MAINTAINERS                        |  1 +
 3 files changed, 52 insertions(+)
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
index 000000000000..4c22d9a79d14
--- /dev/null
+++ b/Documentation/leds/leds-lp5812.rst
@@ -0,0 +1,50 @@
+.. SPDX-License-Identifier: GPL-2.0
+
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
+This driver uses the standard multicolor LED class interfaces defined
+in `Documentation/ABI/testing/sysfs-class-led-multicolor`.
+
+Each LP5812 LED output appears under ``/sys/class/leds/`` with its
+assigned label (for example ``LED_A``).
+
+The following attributes are exposed:
+  - multi_intensity: Per-channel RGB intensity control.
+  - brightness: Standard brightness control (0-255)
+
+Autonomous Control Modes
+========================
+
+The driver also supports autonomous control through pattern configuration
+(e.g., direct, tcmscan, or mixscan modes) defined in the device tree.
+When configured, the LP5812 can generate transitions and color effects
+without CPU intervention.
+
+Refer to the device tree binding document for valid mode strings and
+configuration examples.
+
+Example Usage
+=============
+
+To control LED_A::
+    # Set RGB intensity (R=50, G=50, B=50)
+    echo 50 50 50 > /sys/class/leds/LED_A/multi_intensity
+    # Set overall brightness to maximum
+    echo 255 > /sys/class/leds/LED_A/brightness
diff --git a/MAINTAINERS b/MAINTAINERS
index 7166e80c189b..314b5555c027 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25418,6 +25418,7 @@ M:	Nam Tran <trannamatk@gmail.com>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+F:	Documentation/leds/leds-lp5812.rst
 F:	drivers/leds/rgb/Kconfig
 F:	drivers/leds/rgb/Makefile
 F:	drivers/leds/rgb/leds-lp5812.c
-- 
2.25.1


