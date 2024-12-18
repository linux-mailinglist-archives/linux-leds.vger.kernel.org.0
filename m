Return-Path: <linux-leds+bounces-3659-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0E9F6D14
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 19:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3B36B18955AC
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 18:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 226BC1FBE83;
	Wed, 18 Dec 2024 18:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="lwy+j4Wc"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB541FAC54
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 18:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546014; cv=none; b=HshFxCh2jAjOlwgCMe2Xptiy12iA/XwXNFov/wmKEKPwRiLBAJDO6eMYU+hJwNfLy8tkyaGVwRfWzSCYkciaGtXK/Z8RHcy/32Aiwd35FAXLTpLnd+19rWfw+k3dCHtyI2S5DChv2NBETBHiq3syVAFF95A1uWcLUUI/ITY14Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546014; c=relaxed/simple;
	bh=yUgm/e00b9okvL8FQIt1pQWjJRf7o7EajmQsEBPWpCM=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X5ALV27gzLnVxGH1Px3lc3k7WldEDYnQCI0WHWCLk8hEgpniT/63PYaW/tYxIxFXOb/JEs7comwRDKByqKpwlTxXThPQQQ6VQycb3QPzPLsIOxrU2Gdz8TNZDkxvh2pVXHY1HjnBHAonol4nMcZr0jR+lrE41sZcAw3I6/nyus4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=lwy+j4Wc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6aee68a57so1003317366b.3
        for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 10:20:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546011; x=1735150811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4xgYTs1uKZic+a0Z84dr8kghnwyat7Njf7fQHRkX1TM=;
        b=lwy+j4WcrtJx/LRKjeMBfjtnk5Q+i+uggdhpnaKngFK2Ngq48KInFL/3kre8g+WQ2N
         Xrvtc44IjuxC3/Um/aGKVJnIUIbYaC06PdU+pqAE+CzXkOKFQSnLnKpfOkvwZhPCnDAX
         QaVX8hjGdFJn0NLlK47BJLVZocmjM5hIG73kTtdp9e+RqlBc8pgn5BEYDaOiIIV6dGlV
         4zJS7UAJDmdcv9/sp4Csqeqys7SiGiQVyVytcOJ1opClBNiqww2yyQO4XTK86JgrQu0F
         CcNLupHpGU7qu+4AeWSv09JYlSgcU8kBo9RYvcKAhnLV5sL7Rd38hgYZuZZtJKIMrFah
         a+UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546011; x=1735150811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4xgYTs1uKZic+a0Z84dr8kghnwyat7Njf7fQHRkX1TM=;
        b=HxHKiVttl8ij+cv57tn6mPPXsBxXxMd2Qbl1BPJh5vmzbtKjrPe/vj/ycHP3vMdPPu
         fOga+BzptVcaya/Fnk+fxJ7nsQZtJpZt4RuHrZBSYT9xt5IvxmZP3xz1dpU34rv5frJI
         nrYSDsKzu03oqQunGVpfutIt42KH7BQ5TGQQZqYYYM++p2sOdW4fiNbUG3+HJxSqQs3I
         o9KlikbdmXb0P0qOpJajCJOnM8T/YbNL98z5UWCCPWaTBFjegB2FA0hpLxOfZEuPskbZ
         T9cpC6Xs75/UM2mOj8uRi+7HHolkbSpNFRtSYTaMONkGhGfWEte/qCN4g88mDMS3XKYr
         HEmg==
X-Forwarded-Encrypted: i=1; AJvYcCWWBBC7gB1RR1y4NOwRihsQzZNYcYgDyv2BYgeL4nSsmE7qoAWb4AOErXsDaA/x/lV5RfAaT+mz/i2E@vger.kernel.org
X-Gm-Message-State: AOJu0YwOO8/FUVUyeZoEf3D0n86yZc0dn0AJYdTPP+eA8hQuqSzNNnSh
	b7CiHgzpiYXLjvj2NVx0K+s23poQzQZEVOHqSbeIT8wYZQDShg9iCPrgS+SbLWL1QQE51l45bqz
	nHJq+lfrGhJCwS80ybGlxQpKc22D2jqzS+s6Vo5JeUVcq813vwK2K8d/pyhfamFdra8FDcyBYl5
	Ulcs3OYssYFkNz13Zyjcq7lonQ
X-Gm-Gg: ASbGnct2NBT5o9kqe5oTf52jKZjB3khtlU5s9DUx9zleXxXAX8kwy4uSnA6pq11YRU3
	EbGjCtiGAS0G2YYiy/p53l43Tk8YM6D0R+uzb11fBJid5Nc3La5rYfJsFXeXACIeEELm19B9zN9
	IdUrAP0cB8UBfBGXDz4daWO0S2UMR2T6bo2aY8WvOG0MB+he/ohVjpDG4R0Htr5dlx4xwE7NG3F
	/J2dcqEMHH4KhomYzFinqhY94RQzjc17SScs4a6FGTP3l9qbxsMHM4VkAwa86ul32Ocuf4JmKk3
	a15zXuTCgtwZn0hiHW2quJr9qYG3i+kX
X-Google-Smtp-Source: AGHT+IGqkZCbHBeaeQDkO34rckU4JQ+A5yErdOL+yP/X6itJuFkgf6vt4ylr0sO5NrVVZ7UUhNuxRg==
X-Received: by 2002:a17:907:7850:b0:aa6:81e4:99b5 with SMTP id a640c23a62f3a-aabf471f8a2mr370930466b.3.1734546010576;
        Wed, 18 Dec 2024 10:20:10 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359fdfsm584825066b.93.2024.12.18.10.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:20:09 -0800 (PST)
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
Subject: [PATCH v10 1/3] Documentation:leds: Add leds-st1202.rst
Date: Wed, 18 Dec 2024 18:19:53 +0000
Message-Id: <20241218182001.41476-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
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


