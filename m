Return-Path: <linux-leds+bounces-3750-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D83A08E91
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 11:53:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D9F4166719
	for <lists+linux-leds@lfdr.de>; Fri, 10 Jan 2025 10:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EDD020B200;
	Fri, 10 Jan 2025 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXBGk8Vr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7152205506;
	Fri, 10 Jan 2025 10:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736506417; cv=none; b=c2jOiiyX0F9C2Q5GIetEj+DHhe6+h69KM85QvrqKLlEOqlCZJ+iUkSE9YF67xx4BUDo/pQwkUGATY25tBK3upivYpvh/5j4AZyv1J8ON5MP7DqKmcRi/q8AAAhanfm72Cx2ndL+WLVihWuOOECEwCjOkmxuO3WljSLpdcWKepYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736506417; c=relaxed/simple;
	bh=mxSgDztlGIqttalH0L4mGpH12QiF/iPNp4BEN03E6+k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hSLeI/8DGAFbykJ6wklK1aBCIeBWKMmbftVFZzsru/PIIGzay5WoJfObP4dIoD5JI4tr3WIvOVnf9pk93AC1oD8SjkfYbyJ0EVfHJ4YZX6LAXMaAyCtYtMrK1gML+1ql2kSFwEAIMR6Dt4OJEdCtys08ytX2CN/bthB5QQCuJGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXBGk8Vr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2166f1e589cso37744335ad.3;
        Fri, 10 Jan 2025 02:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736506415; x=1737111215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=;
        b=IXBGk8VrxeO6x4T2NhW5x6B4WkVYFACl9FYz2S6/HW7fitOv6cjdrs+q+CT6c803HI
         f3ywYeSW0zsbZXL/Fr+OV9aAcbGTT+Ryq8tEFQgTHV+cVuMRRI7E7WivHu+XNk9iGQ91
         zOApfO4Pm/slBU7OyuOwFsErJQ5SwXtvXK6nSZYcs4PE7nojLw9VXd7hXx9S2jypJlgJ
         A8y1c1PaY7OFRzzuP80d0U7WYmyUsPv+3zXLgviQ8kkgv+UKGuBdZstMyF3v0OD5JKev
         1z+rRwyPImUu5frCaivh/M8YLx3ZXbwjo1FGI+KaEvrXII3WeMxo7lImTjuwBAbcSWyz
         +CaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736506415; x=1737111215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMSCq8ZRhOoVCRQ+Pn3L8jEsI2Ad0rp7ucXL8/818XA=;
        b=ZLKs0Y4nWGiuHhmsmoDRsXCbqhWVxKBdVMEUggeF2bcwuRTyprlePRgCULcB5IMmOj
         d7J1ML19hUB2hludwnA9ri9fHYWOGi5vikKd1SNmKCRHjMLtEf6b1O8vLAgh2WQzs81G
         lsP7fQJItjzK5K0pfx+/bvl3sR7rd1dXYXcfiliB42s9RUMl/Sq0aKsJKeItqJKCDH/d
         wMKKFgbQCdfGgEZlJv6ceSN48+v+thpgARFY5JA9Ad0YCIscB2dn9cOZGLyTbCm08nX7
         ra10vljDHp+b+3Zjiwc59Sy2p6+NYJm1vkAH5fpdmYmQqQYsXomqbfiO36VFl307EScW
         7Ftg==
X-Forwarded-Encrypted: i=1; AJvYcCX4iAr8hekUZ96H5ZRfxqevzFqc3lZEccBi6r8rjBxrUVU2xZCrI58yk/XsxJL3ms0SLBX8s1b+Xc7f@vger.kernel.org, AJvYcCXAFRA/dNrLjf9ZKum6WuZlZl7lFKZDqrFtU9y99+Wp3BTBtZ9n8qGtb7NXDqj6V5oycSYT/mX2+NUSdQ==@vger.kernel.org, AJvYcCXSMvVpNEzxkYwtFBhjFAcOyM8TEUiK8ciCgMFKlu/QUYmbmNW1i6XRgBVv4gaZ5f6Kz3myjVaaSlJT0Ro=@vger.kernel.org, AJvYcCXf18OxMdJzQfW5m9a/kYleYOHWd0DqdEwLmBvKrHxt0BAMUzQEbCOw14dfWbV7KUPNYGNWCrXOum0VhKVN@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+lqqvg/JfOtDsv1MZcDDVVWTcNeXtd4SLpJxWfXr8nWM1hh2y
	/GeWmdxUrEdsmyeomr4Il4rpxxiwotr/ieupf3FsErePO3iLX1Rm
X-Gm-Gg: ASbGncux8Lm1NvpqD+tT+YJlzSR6PY0O4Jz/srQE/x0mtgSRsjyZFEsHLJAmrG6+IE9
	CuQXJ3PbBwnoa7UOuaESgZPriaNfT5+GagwxbgrIfdbrhInjyHjjZ0ak3SC/qB9FfGeGx9mahJU
	Nji6flN4sLefPCNeoQPEPS6Inx6j9gb/HYl0t0VZJ5z9r24cSFtsIwO8Ic2/wvsKwNjD7WNHdLt
	4kSIemWCWJu6LJ6bSlEfJq2Kf2PY9JvuEZ9MFXU3DsM9prQqG5qlpM0sg==
X-Google-Smtp-Source: AGHT+IGa4nMEUy38XaSxRcOiqyz7zYEKvL77D4BJO3pJ8lZTFzoYDKUJd+a0uiMcMH9BGkGZ+iGrIQ==
X-Received: by 2002:a05:6a00:1152:b0:725:f282:1f04 with SMTP id d2e1a72fcca58-72d21fcf2d9mr15063399b3a.18.1736506415194;
        Fri, 10 Jan 2025 02:53:35 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-72d406a57dcsm1333403b3a.170.2025.01.10.02.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 02:53:34 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Nick Chan <towinchenmi@gmail.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
Date: Fri, 10 Jan 2025 18:52:04 +0800
Message-ID: <20250110105304.71142-2-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110105304.71142-1-towinchenmi@gmail.com>
References: <20250110105304.71142-1-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add backlight controllers attached via Apple DWI 2-wire interface.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 .../bindings/leds/backlight/apple,dwi-bl.yaml | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml

diff --git a/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
new file mode 100644
index 000000000000..29caeb356e6f
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/backlight/apple,dwi-bl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple DWI 2-Wire Interface Backlight Controller
+
+maintainers:
+  - Nick Chan <towinchenmi@gmail.com>
+
+description:
+  Apple SoCs contain a 2-wire interface called DWI. On some Apple iPhones,
+  iPads and iPod touches with a LCD display, 1-2 backlight controllers
+  are connected via DWI. Interfacing with DWI controls all backlight
+  controllers at the same time. As such, the backlight controllers are
+  treated as a single controller regardless of the underlying
+  configuration.
+
+allOf:
+  - $ref: common.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - apple,s5l8960x-dwi-bl
+          - apple,t7000-dwi-bl
+          - apple,s8000-dwi-bl
+          - apple,t8010-dwi-bl
+          - apple,t8015-dwi-bl
+      - const: apple,dwi-bl
+
+  reg:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      dwi_bl: backlight@20e200010 {
+        compatible = "apple,s5l8960x-dwi-bl", "apple,dwi-bl";
+        reg = <0x2 0x0e200010 0x0 0x8>;
+        power-domains = <&ps_dwi>;
+      };
+    };
-- 
2.47.1


