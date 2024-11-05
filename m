Return-Path: <linux-leds+bounces-3283-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBEB9BD1CA
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 17:11:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D7C3C1C24DD7
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 16:11:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35D8B16EB4C;
	Tue,  5 Nov 2024 16:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="A28ZCbSU"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3E215DBB3
	for <linux-leds@vger.kernel.org>; Tue,  5 Nov 2024 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823054; cv=none; b=u0QcdwSAlbBfBYQ1vPaecPbw2GQW2TDkb9TmO6eXRmqPGE9i9J4/BnvZjIKbLrwWJ+B1FwISUMUZrSDfnMhSuiDKla09As0Fyr7LPoSTLEvbOc7+bRpCCZRzq1QXqagYYC7TBuN2mXGKLHOGNEQQhNG0c7ayIf6kfU+76YMMIOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823054; c=relaxed/simple;
	bh=GOR+kBMKKKTUIGtKRM9XCI7YPrZNWfva3GQbxSEtoSM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=Z25HAmRjvkUFS4sxJU5rL4fT6mqVdzTrH5R70mYbs2ngir+lFRFFwdxhizlim1Q+uFSFOaShfsKNpe5B/nxNfqGKnhxuB0VOiM/wmjjRvXycywA39oQRTBSJahWxFFRrc3WzMMFR3sXoKr3sJ8XD/B4wkYyUggGxWGGKwxvFmUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=A28ZCbSU; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9eb3794a04so142203866b.3
        for <linux-leds@vger.kernel.org>; Tue, 05 Nov 2024 08:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1730823050; x=1731427850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=I8iWPAz9+BWvksPjr7PaPX4v4WYSbjtCmVf883G/l4A=;
        b=A28ZCbSUe1sy7nr+smYopJ15aGJDyBhkG0ZSSY/Uhrw7QSx2w3rPwewWEXN3xKx8Oy
         88ICBj4vP2tP8ZHoj29LPsCL+AS2Oao0K08YCvwuUuymC/4F4NKPkuZx0p2egP0mADgn
         UPAjYBbmJUqrLG3YwSChwu7k0bRXofnEaaoacFRi1N7X8Gd/tWzpx8sM9Xhu7RPHzFsn
         eviUj7y93Vv4MOx0RwJeDXV1wdbYYt0pcltIuxSxg86PYMcQlymGBGSnekJ1RZJZVBq5
         AI9iJFqVOVfLIZnEwkVA6BmR19z42XFP2oP4kiWd8AhcHfZftDmkVMdsz12Wyz8ILyua
         QA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823050; x=1731427850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I8iWPAz9+BWvksPjr7PaPX4v4WYSbjtCmVf883G/l4A=;
        b=rcfpB0+5ZsCg1IZOuLt70+++koECcOi1ZdKRtgxJVM7CKz/oqtKUNIjrjGuzDk3QlJ
         o198TYNzdheidue7axvw4pzzR+h8k4XXKAKBb2Pfm7ndTkywgc477O+wqfQDAyBX0hvm
         FcB7NlR/48OjtJ0opZoiaib/z8ngkQO30ti13Af+rJ/KoxYPL57Xm+R+hcDHgBk4EJd9
         IwBTndaxcBHlSfev1fcXl4iWkQNB8iMeKv6QXTMYONkWadY0OMQZf/MySm8vSEdKydNe
         efeMmXQcDXec8NEJeDgvIx1ToDnx5Gz6DOUIu/wa1Hgg74lrq12bI76QzloO4jsRePxt
         0uHw==
X-Forwarded-Encrypted: i=1; AJvYcCXJe5eQCZI2MyacJnJJkl5bQffQ8Q48NFBJj71lxRX9wKyLFJwV8GsCY5rRE+8v3pC1HrG0KGsUAu4l@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc5kdtnZ7EUr5VAg0n4QA3h0cW2xO3aJyDlUpxyUHr5T1lJwAO
	TqNsgwcMg1vT7giB8k2HLNlx4pI27gjsnuT7vX+HotVX3YJRlPo3yz23dgpE161tISTFXwdCcLb
	hb6GB25jwaGdVRU4STB3WCezE1WgyPPqyWb2MrPP1eAdoF2lrO5H142BWSNNbDS5vY6jBqCSqeM
	QJ6WKNeUJPQ7x5l0WFkpkPJnnR
X-Google-Smtp-Source: AGHT+IGkmJfi7dRHZtTpmNCLlbGTZDSTQBEvMTQNo52T6AzDkPM1XFezL57iku5tpryplHLQ/GERnQ==
X-Received: by 2002:a17:907:948a:b0:a9a:238a:381d with SMTP id a640c23a62f3a-a9e3a6ca29cmr2346666466b.52.1730823049770;
        Tue, 05 Nov 2024 08:10:49 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb17f7928sm151184666b.138.2024.11.05.08.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:10:49 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/3] [PATCH v3] Documentation:leds: Add leds-st1202.rst
Date: Tue,  5 Nov 2024 16:10:36 +0000
Message-Id: <20241105161041.4813-1-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add usage for sysfs hw_pattern entry for leds-st1202

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
 - Changes in v3: Add leds-st1202 to index.rst
 - Changes in v2: Implement review comments
---
 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 Documentation/leds/leds-st1202.rst

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index 3ade16c18328..0ab0a2128a11 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -28,4 +28,5 @@ LEDs
    leds-mlxcpld
    leds-mt6370-rgb
    leds-sc27xx
+   leds-st1202.rst
    leds-qcom-lpg
diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
new file mode 100644
index 000000000000..e647966e496c
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,36 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED
+controller implements 12 low-side current generators
+with independent dimming control. Internal volatile memory
+allows the user to store up to 8 different patterns.
+Each pattern is a particular output configuration in terms
+of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern
+format, maximum 8 tuples of brightness (PWM) and duration must
+be written to hw_pattern.
+
+- Min pattern duration: 22 ms
+- Max pattern duration: 5660 ms
+
+The format of the hardware pattern values should be:
+"brightness duration brightness duration ..."
+
+/sys/class/leds/<led>/repeat
+----------------------------
+
+Specify a pattern repeat number, which is common for all channels.
+Default is 1; negative numbers and 0 are invalid.
+
+This file will always return the originally written repeat number.
+
+When the 255 value is written to it, all patterns will repeat
+indefinitely.
-- 
2.25.1


