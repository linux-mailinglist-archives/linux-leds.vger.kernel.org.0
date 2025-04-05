Return-Path: <linux-leds+bounces-4413-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA4A7CB7B
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 20:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728C4170E6B
	for <lists+linux-leds@lfdr.de>; Sat,  5 Apr 2025 18:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE851DF263;
	Sat,  5 Apr 2025 18:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UjVC5mk1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0161A9B32;
	Sat,  5 Apr 2025 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743878027; cv=none; b=GJBUq5x8OaVUqyj+4W2+wrazOlBIytroOLzKRlwF2pl61MZbWiCvbYwZLWM2ds6zbpQSrk5eKRlseiv6a6Y/xcGTV0c+riQTpFOlCgPJfN0uxy4q+YlCcUekd+5ebnNf0myiWjyA9N9zvx1yRVa4c3eYG+UMxfomNjnCJC6gkXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743878027; c=relaxed/simple;
	bh=adlsqi9cDh5CUVWqlUkH6jJ1oXdf11spKwjGarcFbFY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BzQSnXHgHR6/6NXKtN2DiXg51TsDffFKvYLyFnIdswhfOebISsbiZ08HRIivRG9zHAyNZzfvTnHoLHFRwtDz0wkO235HTDgk7sfcSTnjG1OQ1OcInWIMlq2LZ1OPPf7vBsP4+z8TumSYqm9AgY9rdqf8hVtP3nFG6nXyuUsJq9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UjVC5mk1; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22438c356c8so30415295ad.1;
        Sat, 05 Apr 2025 11:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743878025; x=1744482825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lah29CGR6ZmLIrH0ggK8Bgi5lyRmbNLxjK/+B6OWkPE=;
        b=UjVC5mk1cdEVQs6V18XSERHIORavmRgOurs82IgMuujwdaq0cx+kgPqIPPnLdvGYT4
         LGDEuGfVXnyuwrmdiFEjgIbhN7MXIMkuav2s9rZCjKxUnY4EcrC0I4Bygd2nH6bzKnsA
         WrZ4bbenZS+2WQP9Hx2szl0sMdpIQMpAaydFBeDZ7Jr8tWlbJBIFhIxSms2zrpW4JHrr
         HauYh6E1xdtj747Qb99rmn/vXOB3Hh9uGEAkjC6KJIYISFoARHX1xAG98FSzOzKrnh7K
         /3XszpaVWT/cpUz/rtrPcHTuKH1P7NkVVE+l/XHfuvbrg3jpM4VdcwD63NeMYBCxNFXc
         Sk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743878025; x=1744482825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lah29CGR6ZmLIrH0ggK8Bgi5lyRmbNLxjK/+B6OWkPE=;
        b=tJvZnZ0CKdSK7EX5QfrRjL/oGCmfMyRRSX6GlKlCoxuzVr6A0dFHRx/+byuesGF57U
         yuQXcb0x/NDf1O5HkJavylAdEG77b0E2VC7t6qnQvUr8ZiaT0WYyM3J5xMwptj8zZs/O
         Cg78b2lZTmdRCmBz6WbbGuV5sbNBTYZizOyDJfgjMAo8NnMqxl1PW8SgbuoPPjZqFp/Y
         NNKwMqx6JEYEz7YoxRajjRJDmUEWWbhSYjgzh10nTKBL1O/7zRuvbkQvBcqxsqN0Ftiu
         /fGOriUkqdS/EY4uG6Et8ajFXOJv+v0xy+INGAnsL8SuvEy7tPjbYzDRCdd+0ZP+Fhzu
         3Izg==
X-Forwarded-Encrypted: i=1; AJvYcCUcsvhrFmaB16E8zL0L5HyeW5QA5A3MhwxGRXo/qwPvDuWZTJd1bweOlJ3oWWjh/bbFu1G/eYnOw9SGQrY=@vger.kernel.org, AJvYcCVkTPH953ns0y5FefZGNdMbj18B+MbuoLMWXOUa//Tz5+X17GPYq9wjOPOlR/wug5ctaeqrgDkqpqwzZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWoVCEOjK42oFHybsLMjmULBLJgAv4IDfsJHrd2BopHGlqXfTF
	Z59bIqLcf5qtYHjb1PGGmlt3wz/Lw1ZzP1/vAGJzIy2UpVCq5EFZsH/zTMpL
X-Gm-Gg: ASbGncvl5ywvzNScjXfZZgSFviyx1e27wCyKzNfjE6z8jHAz8ocSICO/wOMSE+oQNUY
	77vtVDpGxv2eKUPaSFbX5P8RvZ7P+XSsr7aFz3Ccka2mb40MrC3erCAqDf8vOAUBaqA3kEq7EuQ
	9a53bclAA2EXUzoT9dH8Tj/ZOe7VpMK7qKkFWvXU4Hz0D0LgkuAaQO5rnDnuKSTVOlXwUDvtAoh
	cohSW5Dw8T8aLSe/8jKva8vYjyVDqKOFryMS+WpoAWDEjIBNMzEv5GVWdCnFfvDtJpzLWdtn+5W
	lKnWo216626J5U8vl5zcEX8kL9f6FL6UJgM1EL2mZEjsDOul9kR+UJTQ
X-Google-Smtp-Source: AGHT+IEL3uFEaa2KMYtGNodtvxv53/uyoItq+AHWxgI7PROekxe/jguHwe72D9Lp0b0kkWZqIVIh4g==
X-Received: by 2002:a17:903:1c9:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22a8a8657f7mr113783795ad.12.1743878025496;
        Sat, 05 Apr 2025 11:33:45 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e61dsm52980965ad.190.2025.04.05.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 11:33:45 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
Date: Sun,  6 Apr 2025 01:32:46 +0700
Message-Id: <20250405183246.198568-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250405183246.198568-1-trannamatk@gmail.com>
References: <20250405183246.198568-1-trannamatk@gmail.com>
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
index 353bb50ce542..511d358f7692 100644
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
+						reg = <0x0>;
+						chan-name = "a0";
+				};
+				led@1 {
+						reg = <0x1>;
+						chan-name = "a1";
+				};
+				led@2 {
+						reg = <0x2>;
+						chan-name = "a2";
+				};
+				led@3 {
+						reg = <0x3>;
+						chan-name = "b0";
+				};
+				led@4 {
+						reg = <0x4>;
+						chan-name = "b1";
+				};
+				led@5 {
+						reg = <0x5>;
+						chan-name = "b2";
+				};
+				led@6 {
+						reg = <0x6>;
+						chan-name = "c0";
+				};
+				led@7 {
+						reg = <0x7>;
+						chan-name = "c1";
+				};
+				led@8 {
+						reg = <0x8>;
+						chan-name = "c2";
+				};
+				led@9 {
+						reg = <0x9>;
+						chan-name = "d0";
+				};
+				led@a {
+						reg = <0xa>;
+						chan-name = "d1";
+				};
+				led@b {
+						reg = <0xb>;
+						chan-name = "d2";
+				};
+		};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1


