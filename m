Return-Path: <linux-leds+bounces-4511-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 888B8A94526
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 20:45:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12C153B1181
	for <lists+linux-leds@lfdr.de>; Sat, 19 Apr 2025 18:45:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 954E01E1A16;
	Sat, 19 Apr 2025 18:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgFBig45"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6D81E32DB;
	Sat, 19 Apr 2025 18:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745088313; cv=none; b=P18zIq4eBWq+hFOW9hh/jNY0ZJsad6fm53Dwk+aMc9gOb7R4rABBWJLP/iNq5kq1fgMWBLnvv1mP/cX2NQYTHSp57ir0YzejtGCI6Kx95/A55tCxzR7EzuPCuqAq8NL39SpHr78EdNOEX7dSMPqiBDQWMEg3gZGao0F1FvF+hUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745088313; c=relaxed/simple;
	bh=n/s2ADo+b0i7nG5dHcMjYTx2QEqnguzqYqE4wCSoiL8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ilTLRa+VOlPhiwtIEWSTMweTczcrRncczqLqFPmdm/a6ih3Sv5Ai1bzKlb8ehNtKyQrGgftL/VQZfE0qmO+ze8vDyatFWLYZc/CFaM9MsdW49wD88q9lcQxTKbOZDuPfLq4Wft4zAOVWp56fv0zdptGN+1vjUBf72QI7Ea/AlJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgFBig45; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-30384072398so2355258a91.0;
        Sat, 19 Apr 2025 11:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745088310; x=1745693110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=AgFBig45t0Lc/+bqeW5LP81fskn8e4oIc7zHJV2MCfvxpuQnjG26EV/APio5G4T12d
         ijWZxgDaViakWBv/IjvtnqhTQq6wla0/YSKKMpSDxKwmCocH5n9aRbw6BNkrZPdFM+Bw
         w8An7rHcT+GAIADLYVeW6WytTY772rqYCJAY4Fag8G2hZ6wMKG2Ck90n9J8R7iokztTt
         fUlJBlJlEjidAo68nEAcdgueT0JMl9rb9FHxRZeaPIX+qJmUupm4rmzDVRN46dQjX/3/
         IB0X5BOvflmJOFvQdBhxg6+z9TjlVdmEoat/ZG01HnRcWTjJjCyoiBMVvHCi3CCHhtik
         WiJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745088310; x=1745693110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tfx8AHr/yIS8tp/7G1Y7pM5wDQkLVkrc9vIVDSWIJkA=;
        b=WyOVAHR1t1A2d8+CQSQnMxsc8zbguYSrSJJou6b2stbMFEwgHlVB+0Ytnas5DDlfxc
         xiFwlOLVV5RQ94CM0VVuzqk2zJBfEVmDd66yIDG1N3d8pLQVGSiZRlGOhCGdxeOMkQ/j
         a0fbuDB17GSnYybLAuVv1nTrUx+tKWi+FLbDwVU/5h1vzgnPhoRvTbPLGxJMVY1QIePD
         nzRuq0spR8jyn8nK8r3nv6QWTunDXVJ4GADq8vya7egIUNgnE+mgJIG2TYzi1av5vp6w
         flDmS3yRdxh1w/kzxCe35e6r8WfGFfckcLxJMKTRv2hrcLF4vMl8yGML7u2XOSqLsaD1
         CoRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXawRjtp7kjVg/LUy3K9YX2Ii0MaSKhjKoTF1IH19ZaHR9yKy+NP7XykiUEJxYpnXaBpGFeDwIKxmUvA==@vger.kernel.org, AJvYcCWgJLLDa8moP3pxINe4zJ1vyu63WmK/1RaunxL5jN5p+1NeSRyuI6hNqbs5QU8nUT8dR+QK9zC/Ya3A5S8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhjROWte7JxWQew4Jo1BxdRFTp/z+7566K2OC0vRBSqzWsBb3R
	Pnijp6MFn3T1xpNZsDmtQSKYoqCx18yNMQNfla7OTUlKjzqZHZ1V
X-Gm-Gg: ASbGnctS18qo18hHa52m9/0S6KinkXOVxM88pVGPTQtROF5Dr8e9APfEQeQe12d2Bkl
	R3kvr8H8H8r+TBnCQlEeIsYzlZGxdletlLlIKhdpZgcIIjJthIhyL339MO2AXJyOEBq5Bf1NFFI
	Sipv5r1DH065VAmtPFs+vMgp8dwMAmLJz8dO8inhH6UyeUHWzHjWX0teFTb2WXbD1syitl+N8HU
	MlEXBh4s90q5sbR2zdAyfLqzIazMvPFkmXZ89KPZ/g6sK1IBm/UO9mxlGPAUvsTfF9XxT0f2f/i
	76TIRMx4gZfNffPvIGA/reoU9I2xrQXJdD14/gBxjpt4Wn5yWC96
X-Google-Smtp-Source: AGHT+IHaD5VbdxmYFHvVrInIxyV+nvMOJgj8stgSxqmbbOJKY6CyLKec+pG+pX3FP4S5/b8szLRyPw==
X-Received: by 2002:a17:90b:3b8d:b0:2ee:aed2:c15c with SMTP id 98e67ed59e1d1-3087bbaeb98mr9411819a91.28.1745088310210;
        Sat, 19 Apr 2025 11:45:10 -0700 (PDT)
Received: from localhost.localdomain ([123.17.0.117])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087e1149b1sm3383052a91.40.2025.04.19.11.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 11:45:09 -0700 (PDT)
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
Subject: [PATCH v6 5/5] arm64: dts: Add LP5812 LED node for Raspberry Pi 4 Model B
Date: Sun, 20 Apr 2025 01:43:33 +0700
Message-Id: <20250419184333.56617-6-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250419184333.56617-1-trannamatk@gmail.com>
References: <20250419184333.56617-1-trannamatk@gmail.com>
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
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
index 353bb50ce542..2f058cf5d76e 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
+++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts
@@ -152,6 +152,16 @@ &hdmi1 {
 	status = "okay";
 };
 
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	led-controller@1b {
+		compatible = "ti,lp5812";
+		reg = <0x1b>;
+	};
+};
+
 &led_act {
 	gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1


