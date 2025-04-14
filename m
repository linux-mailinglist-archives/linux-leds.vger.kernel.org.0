Return-Path: <linux-leds+bounces-4476-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D9FA88661
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 17:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 856C017C14B
	for <lists+linux-leds@lfdr.de>; Mon, 14 Apr 2025 15:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4580727A93B;
	Mon, 14 Apr 2025 14:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NlzZEn9q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0EEB2522A2;
	Mon, 14 Apr 2025 14:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642725; cv=none; b=DBtHvA2/EmSUvwhTNz0b2JRv9csl9Z36jXMfJhTVSxx7ru+7hAa95RPtSWEc0Mf7mXC8bfpa5Jt1YXdYG9gLOV7H9eFi749ErHFF6wpJ+jTAo3G/42CS4ymef4z+mhRR3Yz2MEyhFtI+FNQsP28Qch8EFFmN2zpKiJ/wMpPhcZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642725; c=relaxed/simple;
	bh=QDqC8cgaxxrZO/k+8+as3kewWSJMLkdCjrayksbChw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ovvbb9NcdNCnmnFJaxkatxE8KeNuaJUUBAofA0ucBOCLEUv6zt9iuUcMPftOQaGXr8l2RcitpDseDwbPqtzb4lUkEFNbNuC6zsOQUZpWMsRpGk06dsVc0sFgvPnU1HP6xI1vXVrJ34LcFn89L90fFUC2LrbUyiXE75xEOlpio0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NlzZEn9q; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-736aa9d0f2aso5048772b3a.0;
        Mon, 14 Apr 2025 07:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744642723; x=1745247523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8maSB2f2Prtrk+QZuEtUe9jm5FhyXuMpnjZGxdwtAI=;
        b=NlzZEn9qBmlZhlFRxQ9AtOg07WNMPkIwXVmkWjaMjgIzaDuaC1LohSlf8JOWY1ztxy
         4eAdzfOUAl4h/ATm8gOxi0XJXX8qUuvZtag0MTStUIFDx71KyCMgfavJvMhIEuTTnX7e
         eArFEE0afSVlUSxUlr1UQh6GhKZsx8HgzDjUccHHJAvLvxhnPmGnu14NjJZBr91iuCfl
         WndlZbVBKIR2HM9y4T0EhfUsLbG9VCyKDxL6uquoxzhmiL8Jgx8REEvQMz0SZgPDuUCz
         LuFsSLxsG8Q2JxagqGqBl11Zux5NbCtspPwLy9VH0UgmMNtTevcYvvjN7NZFUveCpzpJ
         WD4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642723; x=1745247523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8maSB2f2Prtrk+QZuEtUe9jm5FhyXuMpnjZGxdwtAI=;
        b=CsYT9a7NVUFnV7BKtVoUOL28T/mgAlnoeOLJ4FzWE6SMMuPc2NGGdNzS4ezPGgVS2v
         VVpm4qfuOG+a0ydsWqeZ8+CmBWp5H7xIfs5UkD4wpw9V/0ooc3cZakPvZPle+iaRIOAa
         5hTzutlhcBIfwZx2ji5sldadUl++In4XdgVkxKUsany5u3YbQCyph9Rp1g9HEJyeDl4V
         wDJQIsmI6oJJRp6SEcnS/tlmD7/SsEkTov7Ftp0kKrEGOJz6DOKMIjyJCDxDYvtIp+lN
         P6jtarDLyfxaDc4Lfp0TF3EHqW3B/qii4nkB6gCt3q6pYfsaswwcrNi693aKZvxG06kG
         HM0g==
X-Forwarded-Encrypted: i=1; AJvYcCWrOx1di1de/+5xjVUpW5HcT0vCLj4V9XYSPNYvQGt5ZDPlz0mEMLaai669Dd0cuForKCGLot3zxpebMak=@vger.kernel.org, AJvYcCXMYYRlMuBEHsTHZYE3J+OIG5Dc8RYUjWTsxzeyAG6v12RpzmIBqrRJMB8dgbLTNHAYB3SphpByXSHGUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIc6ZAXwyELBg17JdWHLIxu0LvGnM0QoGzmxZjZV/pDcZZJHsC
	AXRbvDC8qeWqvFpDMpJ0THZCWgpNBbb+LCc5jWnHSaG0C9Jehy6m
X-Gm-Gg: ASbGnctw6r8zyuX8eDsrH8kY9zZObplwZD6EqENNCAGyt52+74vzSttjvOjm0aUlSs6
	hNBWy3D/HZfWorIo97Q4cUa1+Nr4pAXjVThNHEOm0pxe4loGlnEJjiRVeO96Q7RkTawDdtqpkIy
	Gfm3cbYj/5U8cKuK6WoxdFVkvRHsNnSqQfdOkhPXRqmJ5zraEVC+qlOfTlOGc8L0UfoIbOj1J+A
	7COW/dJ9OuAadAwNmIfILFDfpQTNrqteWsBjFrso0CFICFTIiJQUQ1CJcxO0yK+f8EQ95XPbhvL
	dseuM3MoHQ8obodvYJoEtSsi4teMDyp01hUVJVAHlskjQQ+XJo/4sQ==
X-Google-Smtp-Source: AGHT+IH6TUb4w6CkwJKqaESEmRhri88QPNteJqCuSu1Js7zeTvNlFP6vHujel33GS/TdxmaNhN2K3w==
X-Received: by 2002:a05:6a00:4653:b0:736:3c2b:c38e with SMTP id d2e1a72fcca58-73bd11fb5ddmr13362815b3a.13.1744642722660;
        Mon, 14 Apr 2025 07:58:42 -0700 (PDT)
Received: from localhost.localdomain ([123.16.133.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd22f1071sm6632165b3a.120.2025.04.14.07.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:58:42 -0700 (PDT)
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
Subject: [PATCH v5 5/5] arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
Date: Mon, 14 Apr 2025 21:57:42 +0700
Message-Id: <20250414145742.35713-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414145742.35713-1-trannamatk@gmail.com>
References: <20250414145742.35713-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the LP5812 LED driver node to the Device Tree for Raspberry Pi 4 B.
This enables the LED connected to the LP5812 to be controlled via I2C.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..0dec6ce44c6c 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -152,6 +152,66 @@ &hdmi1 {
 	status = "okay";
 };
 
+&i2c1 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led-controller@1b {
+				compatible = "ti,lp5812";
+				reg = <0x1b>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				led@0 {
+					reg = <0x0>;
+					chan-name = "a0";
+				};
+				led@1 {
+					reg = <0x1>;
+					chan-name = "a1";
+				};
+				led@2 {
+					reg = <0x2>;
+					chan-name = "a2";
+				};
+				led@3 {
+					reg = <0x3>;
+					chan-name = "b0";
+				};
+				led@4 {
+					reg = <0x4>;
+					chan-name = "b1";
+				};
+				led@5 {
+					reg = <0x5>;
+					chan-name = "b2";
+				};
+				led@6 {
+					reg = <0x6>;
+					chan-name = "c0";
+				};
+				led@7 {
+					reg = <0x7>;
+					chan-name = "c1";
+				};
+				led@8 {
+					reg = <0x8>;
+					chan-name = "c2";
+				};
+				led@9 {
+					reg = <0x9>;
+					chan-name = "d0";
+				};
+				led@a {
+					reg = <0xa>;
+					chan-name = "d1";
+				};
+				led@b {
+					reg = <0xb>;
+					chan-name = "d2";
+				};
+		};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1


