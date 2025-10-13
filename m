Return-Path: <linux-leds+bounces-5753-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5B3BD2EC9
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 14:11:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8015D4F1BB0
	for <lists+linux-leds@lfdr.de>; Mon, 13 Oct 2025 12:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9AB27055F;
	Mon, 13 Oct 2025 12:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtKU2jBC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB3E2701B4
	for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 12:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760357435; cv=none; b=FnNQC77ZZOazqM8tr4kv5GDP4OIT/C4sZzI/kT2izWhRwZhFYtRdjDUAwP5Yh82rYUXgrf1VNKsf+/djF0pHs0EOl3/VKF/7JrCDHMO+7qqmCX41/Y/ejveDUxZyeu9bhWr8RzR9Ikz7WPTMhL4i5lh+RhoD6WgFEmesrGgKBhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760357435; c=relaxed/simple;
	bh=sGDSBrzW0zgF5EQSKaXU8a9r9euCxs3JkLMBFsQHFa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BIpAbZ8gOKVRpxtpfg5k0wQ2N9/Gecn/6OvOOMX923GhOdqPGhCBHm8SnfRGoH4qlm7M5XSetMsbgNPe34wHviVyQ0LqyFaFuVj6ZcSzT587v68PoSXKq4G/bfswU5XNgZm+/7Bu/T1AZqDNOq8xwcSHGgcAP0GfjYXRDAXawrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtKU2jBC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-793021f348fso3694216b3a.1
        for <linux-leds@vger.kernel.org>; Mon, 13 Oct 2025 05:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760357432; x=1760962232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hLPMhjPfSb7sTToqSESPvRBiXI0kbCHKCBEKr2X12A=;
        b=XtKU2jBCgR3BptFqL5hrIVla71PqIUjAFQi6l0k1WavM5k1amvw6SREGkkwhCPSkkR
         MBx6KiyU4Dfj2WNlPDtiR/qyeW5exOVzi0vPJiDbm0C4fUt4u151ucbrQe0isTERPBGB
         uBOvFjzvEgk5z5WiFEFxBUABuSxcSvkwcF3ZpxJfTi7RSYOyHkenjLLsQdr1/S8P/XqY
         CbsNQkvhH3hO/ePVsVt+oMYjn5iddkzYu+Hua2cvcC0NTnTspR2X7yosfY+TK7Q12OVM
         yQQw8p7PnUq1DN3vShSxG4+sVkX1h9uzwZMh8wof1MccyNaqHFKXlxiNdD9w2EcGnDX0
         JCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760357432; x=1760962232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1hLPMhjPfSb7sTToqSESPvRBiXI0kbCHKCBEKr2X12A=;
        b=YMoV/Mv/H/C5ZIsaztRALctu/evDG3UhwNymFiV6xZsN9iuKQWVoW6ZLd3lNWgQm12
         5L0L3p8Atz581RUejO/wzZlBPDqGEhg3Zd2ZydNXqCueRfbWOE/NHPnDI6iKqctNHsJQ
         wXeFmOgdpGYJimRcBEvVmgl5bq4uiMbK01+PwofjMm90tLn1n567PqhVluzFwAS++yVC
         RD7VEQP3kUdpC8K5BnaG05P253qaOAr3c+so6yewhEzL/ltBWD8ru1DkQOcTsMb//EiI
         cK0owx9yWuxQdOIxDFhX9H+oVZR5i2weOH0oT+U3D+tjhznSg9/ZtUHRMEcu4XXQe6kr
         a9dA==
X-Forwarded-Encrypted: i=1; AJvYcCXk32mXLrkz30Kzzz5vblPq0Kc3tVBaawzjfqgmVaYNaiHMArnhR26Ox5HgKpAD0IX37kfQUWmqDs8r@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+/CFss7GoBil+KBmloPQYZf3ae/cTRvrCXJCuR9xO8coAS2Co
	T7Jqq/u51U2GBAYKeQYUV4Rq/o5QKStUPaGJx0bBh4rE+bUCFy5PGxps
X-Gm-Gg: ASbGncvQBZgCVeepDIpLC/YnsdVWjtgo+NfO0frx6+dPMcquJFeCSzLFqfeNawVq+/h
	j9oJBQSj0jcw7TRDShpHuRo1nKZrmrU7EFGG/QEog+Ti7xuQu/hN4fq0i8eP6rmi+Sfot3IOtv2
	38b+8YC3w+5Cwmv2pc5q3a0yEKltZksxl/zCm6tR/+SXmz5rJDinsYgG+7rJkpMLVzdEkuqvx1B
	kwkGAojKCnPBVMu1KdCMsRlAOyQH9L2ZKMIKXsgIiW94zq2rTlv/LE/ZRN+FXxPAqo4NnDR5opY
	lkgvaOUdD0kogXlUd2zv9RU+0cUo3Gd8aZX6710IeQr0nnpZl27UCEKMw2OClPBbYeLewKqtYp0
	BUNc/+Li9/UmHLWgICAu7V4lPiXzdXN8jw4egE0KPjN10D4Bw7Ena3aT9ORPHUIGNZYzVv6I=
X-Google-Smtp-Source: AGHT+IH9GduPzVmxfXpxE+Vv9IEFmCnMu8tf99lg2QF8G2VGK3RBdrnZwqLRjBpByIPy+yj5nhZfJg==
X-Received: by 2002:a05:6a20:a106:b0:249:3006:7567 with SMTP id adf61e73a8af0-32da83e39cemr28536785637.35.1760357431843;
        Mon, 13 Oct 2025 05:10:31 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.98.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df48a83sm9633354a12.31.2025.10.13.05.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 05:10:31 -0700 (PDT)
From: Jonathan Brophy <professorjonny98@gmail.com>
To: lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jonathan Brophy <professor_jonny@hotmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: [PATCH v2 2/4] ABI: sysfs-class-leds-virtualcolor: Document sysfs
Date: Tue, 14 Oct 2025 01:09:46 +1300
Message-ID: <20251013120955.227572-3-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013120955.227572-1-professorjonny98@gmail.com>
References: <20251013120955.227572-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add sysfs-class-leds-virtualcolor to document Virtual Color driver sysfs
entries

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../ABI/sysfs-class-leds-virtualcolor         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/sysfs-class-leds-virtualcolor

diff --git a/Documentation/ABI/sysfs-class-leds-virtualcolor b/Documentation/ABI/sysfs-class-leds-virtualcolor
new file mode 100644
index 000000000000..eeebb65604a5
--- /dev/null
+++ b/Documentation/ABI/sysfs-class-leds-virtualcolor
@@ -0,0 +1,43 @@
+What:		/sys/class/leds/<led>/priority
+Date:		August 2025
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+Description:	(RW) Priority level of the virtual LED group. Higher numbers
+        indicate higher priority. When multiple virtual LED groups are
+        active, only the highest priority group's state will be applied
+        to the physical LEDs.
+
+        Valid values: 0 to INT_MAX
+        Default: 0
+
+What:		/sys/class/leds/<led>/blink_delay_on
+Date:		August 2025
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+Description:	(RW) The time in milliseconds that the LED should be on while
+        blinking. Setting both blink_delay_on and blink_delay_off to
+        zero disables blinking.
+
+        Valid values: 0 to ULONG_MAX
+        Default: 0
+
+What:		/sys/class/leds/<led>/blink_delay_off
+Date:		August 2025
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+Description:	(RW) The time in milliseconds that the LED should be off while
+        blinking. Setting both blink_delay_on and blink_delay_off to
+        zero disables blinking.
+
+        Valid values: 0 to ULONG_MAX
+        Default: 0
+
+What:		/sys/class/leds/<led>/brightness
+Date:		August 2025
+Contact:	Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
+Description:	(RW) Brightness value for the virtual LED group. This value is
+        applied to all monochromatic LEDs in the group if this group
+        has the highest priority among active groups.
+
+        When read-only mode is enabled via device tree, writes to this
+        attribute will return -EPERM.
+
+        Valid values: 0 to LED_FULL (usually 255)
+        Default: LED_OFF (0)
\ No newline at end of file
--
2.43.0

