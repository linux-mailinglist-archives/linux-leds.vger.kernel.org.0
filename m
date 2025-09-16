Return-Path: <linux-leds+bounces-5514-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AE8B594AB
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 13:03:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAFCF1BC76F3
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 11:03:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3663F2D12EA;
	Tue, 16 Sep 2025 11:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2ZLNIF6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E882D063D
	for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 11:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758020565; cv=none; b=mRS0C6SSHcmhJQ3CsgNmmknUwipk+IzZ8n0s+vg/KSAVZCFU4U94PRS6KZngw+Bt7WU+Risg0Ns4+X14mwwMxgsa2NPhxtVbemm2flSYiol5yql3D3nOJseZKixHqHxpuL8nLKzGgTeAHi+UpBLUnqFlMVJhYUXv+ZiDuDg0BSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758020565; c=relaxed/simple;
	bh=4ugWzdLxwH7TW3xz+VsZ74Nu20vH+O8v7BzSqvng7pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j2F63I6bOoo18U0e4Yabfyx/v6cV7JILHccLBVSobt3flom/xGB1MN+EwxXXB0DlIutNdDCwl1J2PTN52RRrCj0Izh5Nhfp+tyLgoT9GRGGmbfUNvd+chSAn8H+I10IrzlouWw1sO1aeOKzcAW+kK8YcS4eyAztActdDFHOX1/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2ZLNIF6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4c9a6d3fc7so3238405a12.3
        for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 04:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758020563; x=1758625363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlc7jsJk6p6gKdRTeiAfm5hIuEV2gvb0B1/cOcqj4g8=;
        b=E2ZLNIF6Pvy13OBvsngXIj+rt+60xM/gjUW3PSD7bMpMxql6FBvQAIfjGiOCNy6arS
         /vWNqwsfOA1hzA7CSRhwv2HAbFt25CZMoonSbhEva7c4FtA/Tgtyd26AjSG3+gV7X1uH
         hnc0aei1+ZBJYslcVY3V1tcY/4OfUfFpMDI4/wIZ/4BDWsYr7WWVqgFFxGK5kvoibb/H
         H9OA2mDW1UCn53wppOf7U/epp0Uxe2y8eUIThHkeM7A6Kb5nkMJp6Clzt9GpbfG5Wf25
         Av785BNNoppLNv1QJreT5ta9Xde73m2ZRRtEmUXy1CfaXrTeYrj3bNGFM0CWtnDqzLDz
         ib3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758020563; x=1758625363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nlc7jsJk6p6gKdRTeiAfm5hIuEV2gvb0B1/cOcqj4g8=;
        b=J6gYQD8UKOUyNG9bjnuyy4pLqtzdde2G+r0ztp2U42mdIswgkoGI/R8evoX/HSl9LC
         kRKA9hyRz5R+RFyzyvqpP27b0ShmqJfPdi5dDXx++KkDvN3xhxgOFpN7fRNu3GxAhayr
         CEq3X0DP5189wYvNlWaKbgtFK2hBiRACJhIwTQvLseZ/XZBHZlilE5gH/meRZL4BZhKK
         ljrom1E96gZiaKVApOBrhi7+Li6cty4y6BFNcknCGZICnOmrDZE3qSCB1aWJYHarWGT+
         nGp5JCt+WxpZW2Yl70xBr+ksCX8Zm6wm+2g1VFYM9RYe0Oiwlhu2sKk5zPeQtVI/kwip
         lzig==
X-Forwarded-Encrypted: i=1; AJvYcCX7Av9SurEKUcqcOEB//aJAkPqBXYPAwdyIUNvxEak4uJ7sdXIMI/ozeydb+L9BVT7tzJ7xysbIZt+6@vger.kernel.org
X-Gm-Message-State: AOJu0YxChpB2t50pdnFCUzK7cbdmWCCFUnynSNZlhgMqj7ljJ7HnjMdv
	+lw2Sxi+0ThbQcVygkwno5kA0fT0QnCyY/dnEvRNh8HpRjH3hVJcajsz
X-Gm-Gg: ASbGnct+uNY+IXPMfmGYJoGkzFhv1/rcz5NXOB0w1PpQQKPxmJKDSXaTGDx+eBWEqPs
	f8MO8Psld2bC62XJ7B3u9ochFMH5u9xN2UsQnCgDgBVly60dUphAlCm2IbUAVb/hNFAkxTq1PO5
	1mgNelZa6h2wbqUsNvvk8Uiy6OPuAFybcw63TPegq6cW9KSXTC0suiSDNCpS+C/g86qKz0wxcwZ
	5l7imOCLaaeUc5AQWnWmcxzHUzGXvkC2YQNqJ/z1r9xdAtM5A8j6mwcxS2SWBLMkQBeVAStGjMC
	gmHecXTtMspnU5jdfz/ZQUZSjEabV7D0N778jUdEEh0wj9iciMVQZuYZ+jzD84YsSddfLQZ7sUC
	y+W+UNMg+fXJVpuOmnpkEGjm/aRIu+ip9HZSwOtNZkACm
X-Google-Smtp-Source: AGHT+IH64sLUcDgQBMHjtimcEQQJfjOUS+/VsmBxNDcrcn0Ck9ACmp62pRLDSs+pn4IEA+FDfafriA==
X-Received: by 2002:a17:902:f546:b0:267:bdcf:9346 with SMTP id d9443c01a7336-267bdcf99ddmr39744695ad.27.1758020562681;
        Tue, 16 Sep 2025 04:02:42 -0700 (PDT)
Received: from MRSPARKLE.localdomain ([206.83.103.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304ce8sm158761725ad.128.2025.09.16.04.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 04:02:42 -0700 (PDT)
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
Subject: [PATCH 4/5] ABI: sysfs-class-leds-virtualcolor: Document sysfs entries for Virtual Color LEDs
Date: Tue, 16 Sep 2025 23:02:16 +1200
Message-ID: <20250916110217.45894-4-professorjonny98@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250916110217.45894-1-professorjonny98@gmail.com>
References: <20250916110217.45894-1-professorjonny98@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonathan Brophy <professor_jonny@hotmail.com>

Add sysfs-class-leds-virtualcolor to document Virtual Color drover sysfs
entries

Co-developed-by: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
Signed-off-by: Jonathan Brophy <professor_jonny@hotmail.com>
---
 .../ABI/sysfs-class-leds-virtualcolor         | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/ABI/sysfs-class-leds-virtualcolor

diff --git a/Documentation/ABI/sysfs-class-leds-virtualcolor b/Documentation/ABI/sysfs-class-leds-virtualcolor
new file mode 100644
index 000000000..60b878791
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


