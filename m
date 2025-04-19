Return-Path: <linux-leds+bounces-4507-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F376A9451B
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 20:44:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CCCBD3AE753
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 18:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57ECB1DF991;
	Sat, 19 Apr 2025 18:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWgwa2f9"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98A61D5176;
	Sat, 19 Apr 2025 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088258; cv=none; b=P8+M1UF+Z22GdAheaK33vmjkw6MrC5Fs8BYV38FDcbG2s06EI2gC8Vlyt2YmOAWoTfKIJYEOSTDgKu3lq3Rk7Da52QvXW9U1MZmRxk1zd+1Z++hoS+WZqNelqkGxOLB3rNruvT47/iMlCjLzYgJCaUl6P+D+uiRULXlGpaBMfBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088258; c=relaxed/simple;
	bh=4LimvYxESNA0NXYQWn+IF7E/ejjKw5iYLV/aPbA8Qi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FEOgFmYjKyvjTGfvPzbCVjgNXFYyfhSpcwUSqBpRC1zNI57/Yd9klUVlr/b3ARaq0YDEZpwqs87E8BSd57IpjPBTl3Zl3wBCDQX8cNt47Qhw1nUkma25h7S/qyqggh5Sp6sd5JEc+lL7zA1uV9Qw9NZ8WHZXPtM59FOaZOWnvas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWgwa2f9; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3018e2d042bso1964777a91.2;
        Sat, 19 Apr 2025 11:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745088253; x=1745693053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nZ2sGH9m8YRYJglY9thI57B2sIysH+IbvXMayQluKg=;
        b=GWgwa2f9/eonSF6X0+LK7N1zP3ZGlzXWpaZ5tSONOHzkTSfsY5j1S4yGYIiBOdIpxv
         MYx4YNP0Oompw1/YfvzJwZ9q2ZdLFTzpVi3RYiKqToKOhfq0hfFUe3BRe0IDJmnUSDpn
         lhCAZjY8Aw0RylSpSgRHnsyFmCsFSygWEbZ5ggvV+SALFQDyDaSO2ZRpJIRn5f9eL1Kz
         ZbRcXv4Lx8VPOkyEpVuAX7OStjaeU1RxWcG7I5jspi/Be7DFrQJIpk8kG7YppampUb5v
         VEujXm6I4+4tBDVSkBffZILXaofJi0Yb70ZabPWHB1afUYB6W5X+1QevYcDVOH5KYyVp
         QH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745088253; x=1745693053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4nZ2sGH9m8YRYJglY9thI57B2sIysH+IbvXMayQluKg=;
        b=vKiS0YT00ypUG3uOGTqFjLuiDga5chVI75m1XudCBBaSK/2vBRkq6tbcqu1iaW+ao5
         PGgcLiStgg4SYaZBUrYHmUj6e3OcgCpnz+5wL/3rsqHMQF5/DhWqmv8e22glV9D7MD9N
         Yh/Zmhv5dGlTeztuIyJP8S8hMBzON5soh/vZlC/1HKL4MtVXyCusv8JDaMvHAkw/S8l4
         A0GjSFd2mdjtrbfnsu0S5A8wb++OR7YUdD303KHM/DGUcGkv7cNr6go2AxX0vnWaGHKM
         z8kjVUw1zuUbwWDPCiBKWDiDEz2qoTGgJ9mLwst1U8VoDJ6/B0TFi+5uBd8uJOaEcHVc
         dmJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEKiXPEh5VD6fqHx9COL1ig4EUa2QPDo00KHGMkgeuWg7f2qgB5H+swUtpeAZcm5Mtkh9zgzQec3wzlA==@vger.kernel.org, AJvYcCWsaXXvCi4BWaaJxnmSt9Ixd5nmRhbk5pAIizjM7NGK96/I9gdm/cdEw3Ub1pcJFnEWTCyQRZ8aoN6M8Q0=@vger.kernel.org
X-Gm-Message-State: AOJu0YynLecMGfyWpQpLytiG01T/h6qW6caqJ/Ql1CiF3pdgU5e01/Yv
	QWX9PuwNJsx+QAAchODRiLVHCQ63kGaugiqVfgKntGo0vRGRAWPa
X-Gm-Gg: ASbGnctjmoKHp+itszYhGiogKjRL8Zm/MKNuOj8gpqsy/MCzZiBNB1w5SWiAP5HuCRH
	eIUCxOirDeAmTXN8ar8+IMvz6lMawb0fqrn9zFd48rlUxxR7+c8qle96sw43Gsd+3zsE1UdyPeu
	P7W+tt8Uchr0Tsh1ndOfG5VJT3f4cfrU5eXZIfcOHfcAwe5D/OUYOZqJKqxekRzN+oI5plLpsN/
	Cb4c9Ab2TKhCxe4i8DM3iV2uhm4AOMY8zN5eXm5D2EVJCKDmPeMuxElLpCbyHr2ahBusyO1vXHN
	SBvpq+Nj51lGD8iSsKvvFFj/tCyXfkU8PFShwP1M4nLLJWYGeh5R
X-Google-Smtp-Source: AGHT+IFrdDGKh3njVbvpawTlMHtI+eN7MLm9RXkHu6p9Opf8uFpXmvGtJkVCv/3TYsGr932u1ipjXg==
X-Received: by 2002:a17:90b:540e:b0:305:5f55:899 with SMTP id 98e67ed59e1d1-3087bb48f40mr9974040a91.11.1745088252957;
        Sat, 19 Apr 2025 11:44:12 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e1149b1sm3383052a91.40.2025.04.19.11.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:44:12 -0700 (PDT)
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
Subject: [PATCH v6 1/5] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun, 20 Apr 2025 01:43:29 +0700
Message-Id: <20250419184333.56617-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250419184333.56617-1-trannamatk@gmail.com>
References: <20250419184333.56617-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The LP5812 is a 4×3 RGB LED driver with an autonomous animation engine
and time-cross-multiplexing (TCM) support for up to 12 LEDs.
It supports both analog (256 levels) and PWM (8-bit) dimming,
including exponential PWM for smooth brightness control.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 46 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..28cba25713be
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI/National Semiconductor LP5812 LED Driver
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1b {
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            vcc-supply = <&vdd_3v3_reg>;
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index c59316109e3f..3901c04b9734 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23934,6 +23934,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1


