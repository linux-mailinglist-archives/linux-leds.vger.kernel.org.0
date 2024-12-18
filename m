Return-Path: <linux-leds+bounces-3664-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F12CE9F6D65
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 01EC17A1C54
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:34:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 125031A23A4;
	Wed, 18 Dec 2024 18:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="dAPkBYvf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F00E1FBC97
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546852; cv=none; b=rTXGYmPU0gAqL8IjJ/c3aO4q6qBiQY0DtgYxs0vewqsMfv9JmourWMzFZPN9MfHORwZ/kVS0Jak5DG46HiIdQGB+CvUNkqihblQiEANnjkqwG+hbL5t2dQDctxnMKwKchP3eRwXV0FxJQclrlIqoZ0p9h9ZOEfGmuPGnSp7P0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546852; c=relaxed/simple;
	bh=U8PM7OFW1gKiR8tXuTfMQZQozHR9qO5pl1a1dCYeUcQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WmaE+RnjyCnSYzNW6Zb0kT4xMzw8uIzI+nU7cFMuBzpqaxqgf5Eb85LnOa0dPOqjGHn2vR9XojNYBXZ22mUhZoHuVy5WkojK+8csjKKqTyztgvznoDPR5dsm1Wo31JakO229lbOvFhXe7VPr04XD+2YWPz3KC/Gwg/zvFnFGqVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=dAPkBYvf; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aa66c1345caso249079566b.3
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546849; x=1735151649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FpTyr3pOeqBd4fVeHV4awepAm1kO5/z7MbR3xj/v4EU=;
        b=dAPkBYvfM52gDlSCOSrRTowFOZOa8EYFtX6oh5U8kZlrNNrA0c9A5MlN9kuEnlggt4
         rD1AqIyldC+gl6J+jMRyH5taWFtAUOZg2jvtyOPTdt9xDRCgM2SP4Cqj/bgXl5eySIoZ
         ADQXoWC+B1vD79I21wShJYom7Hs7OxU4P+VPWJExwWjdYHNSui5ciLkHJpaY2p/a9Ypt
         /aDh6VOxqC5b5uj+oYbITaGAdqQWEOg2Fz/tcdQ4Wale/pLQiGw5q44P4dJMRDyTlVjm
         IouaMxsrZ1GIQjkYnpg4nISl7QrsTFXP61LC4Sg3niA5F27yOoMkxgzamQin7gSgQOvg
         7Mog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546849; x=1735151649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FpTyr3pOeqBd4fVeHV4awepAm1kO5/z7MbR3xj/v4EU=;
        b=CTWHCTZWFw5ecO6+kuIjFMF1TjSDLjVgZbXlIl9pJ/2JiREq1xPwFpfjG42fDgeT2v
         eSM0iJMLp3HAK2FbCX79srIr2NTsZ493Z74gxmT7p4e/9U+sF0/e6/bh3kr97UERBpuD
         lSb8Cx20QAOnhPVxH2TyAFIL7sn8Q/LqDscN54zkt8j62KNkYXmzwl52nVkNHHZhUS7u
         S/iEujQ/unj4sxezqjo+yrZJ2EFR4M9EefpWdivy+RjLqSgfO/6+jmE8v2UdyLr0mqup
         5TR91Y2pWEPg/kxGraCdFEvm4bCY1nmLpx7xTmw6228M//8BYzbYdf8mfxoUJydtKPm3
         nb0A==
X-Forwarded-Encrypted: i=1; AJvYcCUuiV8kSz/8AQAc6qscKxOj2AygdTDeq/kXCom48cttYPrXrdE6MQF8Z8DIlnaO/PzbLDLpKSsaLwt5@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0nxT1JxUuqSns3VbsN2TAVz4isbMacsf6tzdecVbHoEA4QUTn
	oVgIZUm7DHeXZsO17kyMQOKV5UDxvdxDZkzxE73qp+KNW7ECOzL2od96f/q0DaUPG9sBaBCEBN7
	wVNoNQVkYtFwwKms9tYxNypj/PSSiqZkERUl9RBV+I8NQgV2zcGLc5J1r1ZXbBqSnPeuf7VPLis
	1cWeSbNHDdILeqq6pQ5IxMc89n
X-Gm-Gg: ASbGncveO5VL60VKQXkDJ0dW7gQY6260yybsCpXZQMoMzFK1C9Q9w0Tn/I8FClnH4Ui
	ru6MXUlwdLIkHyXGrKZXtPHYtzack6BDLWBrvaPcp9I9Jc2rurSD9o69RYe1lh6NgtlVmO/HrcS
	SvITWZVznz2E2hxz9/P0u7qro7hcdy+tq0Vxwm/MtC5lBOWSxzmPz3IGIVqngup3v4AX1pX0qiL
	s4LprHM5NX+vyq+ue1aXlZixhZpM6D1xXFnXYgORLm6FY4aMAl38PH1EhaGvGSsHTTvXiPuYjhR
	MS9W2bzl1hY8QuKASAhTVVJC8ESvpF68yYQ/2HfjBjU0Jqn5h/H+5R3XJRRCRH5diLB2q2+teFV
	+
X-Google-Smtp-Source: AGHT+IH2PWkcdNyGTKokJaUWWhT0r1CKLpFl11CxYkcaFXYiJrP3t69tY7W2UAINnz6wjr2BPUp2mA==
X-Received: by 2002:a17:907:7817:b0:aa6:6885:e2f0 with SMTP id a640c23a62f3a-aabf48f7236mr333656066b.46.1734546848513;
        Wed, 18 Dec 2024 10:34:08 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:08 -0800 (PST)
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
Subject: [PATCH v11 1/3] Documentation:leds: Add leds-st1202.rst
Date: Wed, 18 Dec 2024 18:33:57 +0000
Message-Id: <20241218183401.41687-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
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
    - Changes in v4: Update format (line wrapping) for leds-st1202.rst
    - Changes in v3: Add leds-st1202 to index.rst
    - Changes in v2: Implement review comments

 Documentation/leds/index.rst       |  1 +
 Documentation/leds/leds-st1202.rst | 34 ++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+)
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
index 000000000000..1a09fbfcedcf
--- /dev/null
+++ b/Documentation/leds/leds-st1202.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+============================================
+Kernel driver for STMicroelectronics LED1202
+============================================
+
+/sys/class/leds/<led>/hw_pattern
+--------------------------------
+
+Specify a hardware pattern for the ST1202 LED. The LED controller
+implements 12 low-side current generators with independent dimming
+control. Internal volatile memory allows the user to store up to 8
+different patterns. Each pattern is a particular output configuration
+in terms of PWM duty-cycle and duration (ms).
+
+To be compatible with the hardware pattern format, maximum 8 tuples of
+brightness (PWM) and duration must be written to hw_pattern.
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
2.39.3 (Apple Git-145)


