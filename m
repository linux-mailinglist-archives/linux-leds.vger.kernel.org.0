Return-Path: <linux-leds+bounces-4038-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4D8A3E39A
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 19:16:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C8B2E701378
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 18:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18C7B214217;
	Thu, 20 Feb 2025 18:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdqxFO66"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB6F211A1D;
	Thu, 20 Feb 2025 18:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740075363; cv=none; b=saZuzePeHOt6gxVgPVDJ+RaOJlnTvqk9mvgVODSKQ7MFZJ+IAC4RgMpFCQ8YhsZq8BRRPuwLy77xKCUOOiHpvxzaW6WbqQzbXRkvjiL4oc6dohiAsDbmFkKJzTB1b+vw+HjfVDjl8WHSqldfT2aOv2CFKx3lmyfYJzG13ysbTvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740075363; c=relaxed/simple;
	bh=7wyyhcDvKYVhU5JQrKlc8JbZESpPv2P5+p+gGexncA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZgDJDes6yOcsR28dF4fNZfbsjIp4rbk55pV03pE9co8jcREfU6MmpLg+LrrutoLGhG4PR9FA56uY6vHTl9Ys2Md1nTnQe8mCg2qYPl6gHyl6lMZR9g667z84vn3jury3NS3FM0jHlmuR5wyak7dVPcLZuXrE802fdndC9n1P7VI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdqxFO66; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220e83d65e5so24877975ad.1;
        Thu, 20 Feb 2025 10:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740075361; x=1740680161; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWCrgzKwSAmlqPfVE5bpxDVia0fvBzrnlWlwqxepyGM=;
        b=hdqxFO667bIhu8pIO5D3v/XJD+yhUMjmvhpuBhTbSwkZNuUcwWnOdPOeRBUIMV4t+4
         JCrMn5PA003f6sEEps96tsD3aCQzrBNGsdli9NsJrl3+oHWIjNcQWJY4jO1MAV1P0XFP
         Rg/joWEXMjlvrW9EsZ8z2ODVIN1EVcE9uP6FeQBpEaRgKbhZoxYFFcMf05p8PYmQiTdK
         /cSLavIqoQ7EyVMwEQG+kJfG4p+bFC4QGR5OWddhGfa/wELf2LJ8m+zMmjywCO7FSg1y
         9ICAGEqlvbKnHX9jt+ZXVFlFWVh/UU1nSdR91twfUFrmH7pQuBVxvK7k3DrODTZZUBIE
         /oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740075361; x=1740680161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWCrgzKwSAmlqPfVE5bpxDVia0fvBzrnlWlwqxepyGM=;
        b=nckoOZhBDFJQ/kazMmEH6PsZJea4VoO5CgQs+QN5M7QDcONSJmUZAd0YS3SeSRoiVw
         fPn6oqj2FP6rsr5Ni3eJDVx3Pb47JLTCrDvLrMnkByRP5qd1pLDNRl/vgH4fsDnNjUpE
         bg1s6t/H+0laaCBjSZXKJ6h0nFOObEkpoUwU8e+5QOmdwTK8rRuJ+ULn3WR3Yv/ZogQy
         0eubVelLu2jQnTb9xN0BpQJnOan2k5GfMMlqZIjOf/sm5mP3GbAUbofhUMdAvdKBrBm/
         zETsmKaU6jMvVd9icsIXz61gZco/RzftAdh+mabCwVeNtpHUg+0r/8yfcvqQp25cm1VQ
         TCzA==
X-Forwarded-Encrypted: i=1; AJvYcCUJF13F6pxKwqFwVpH45+OYS9jgk/4FKUSUoEV2muOt33ql+xlt1Bu+13AgwiMhH8VF/c0sfwVQg5dHRN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCmH+MUdtjiJOxSaNsVlLDM1kbRFikahg7TIaFG+w/W6OyZOSc
	DHSFfTAetR2EQP1w6lwlJtNHasXKuZSwuhVxeJ7hF/GMrX57H/eWsWuSgOtD
X-Gm-Gg: ASbGnctNaMCa2/FRbuFQjUbZ7rdw+SrXX5zI3OlRzMlH19AJ7z6wuiDwDFX0YRa7LSo
	MBgz3vG2wxuZW+NeclZ5W+M4hVch2c9xHuFoAFZ9TQvy6sRvIYHRNvE7ntXDb2Ib6/ot8w5UbKO
	1al0mOH4AxMZir1sUkeAog7iX9fR7YqOVe1DXm5P09Yvz+Xbbe6BWa0Q02eiXA0v9WCj+794gnC
	LUxQ7PZSmgLhSAu0GjDdRN5Ee7PE9Ta12+z+m3US0wCmWO6mao9Xmn2vfMBKeByeny0nhnW/Do0
	Ybh93Ieoa5CIbw6j/CfUvIJTarr2Eq/m/YAs
X-Google-Smtp-Source: AGHT+IFBvApFTx6FdvLqnSEaezh1/z56POt+ML+WwGEkhCLV7qB8w1fxJNivUR3kEEQ/zwfheWzcLQ==
X-Received: by 2002:a05:6a00:b82:b0:730:75b1:720c with SMTP id d2e1a72fcca58-7329df28739mr12465133b3a.23.1740075361381;
        Thu, 20 Feb 2025 10:16:01 -0800 (PST)
Received: from DESKTOP-P76LG1N.localdomain ([14.162.192.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7326ea62b03sm9457853b3a.70.2025.02.20.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 10:16:00 -0800 (PST)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@kernel.org,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: leds: Add LP5812 LED driver bindings
Date: Fri, 21 Feb 2025 01:15:40 +0700
Message-Id: <20250220181541.2341-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250220181541.2341-1-trannamatk@gmail.com>
References: <20250220181541.2341-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This documentation ensures proper integration of the LP5812
in Device Tree-based systems.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/leds-lp5812.yaml | 34 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++++
 2 files changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-lp5812.yaml b/Documentation/devicetree/bindings/leds/leds-lp5812.yaml
new file mode 100644
index 000000000000..1eb395230531
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/leds-lp5812.yaml
@@ -0,0 +1,34 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+
+title: LED driver for LP5812 LED from Texas Instruments.
+
+maintainers:
+
+description: |
+  The LP5812 is an I2C LED Driver that can support LED matrix 4x3.
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    description: I2C slave address
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c1 {
+      lp5812@1b {
+        compatible = "ti,lp5812";
+        reg = <0x1b>;
+      };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4e17764cb6ed..7efbd6f0c79e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23489,6 +23489,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 F:	drivers/leds/leds-lp8864.c
 
+TEXAS INSTRUMENTS' LP5812 LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/leds-lp5812.yaml
+
 TEXAS INSTRUMENTS' SYSTEM CONTROL INTERFACE (TISCI) PROTOCOL DRIVER
 M:	Nishanth Menon <nm@ti.com>
 M:	Tero Kristo <kristo@kernel.org>
-- 
2.25.1


