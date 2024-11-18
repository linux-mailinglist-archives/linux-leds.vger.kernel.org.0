Return-Path: <linux-leds+bounces-3411-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 719159D13B5
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 15:55:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9F011F22CE7
	for <lists+linux-leds@lfdr.de>; Mon, 18 Nov 2024 14:55:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 775551AE018;
	Mon, 18 Nov 2024 14:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="nJ0hICrP"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829001AF0A0
	for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941702; cv=none; b=cHZxCNfK+smgeKqZN0/LcZw6gFPdxEsyUPB/UgbgCcXcMKDqyA3dNgB21BHCL+xMxkpqvB0g+bOWDiQAv3f0okgt3Qb30YxqL2vIrTJ0z/pM7ZoysiM7axRo5igZYQFIGKBPpcU9U9jwBq67lME8ur3SB5dKmFceM/3lwH4D1lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941702; c=relaxed/simple;
	bh=BjUHWeRL5XhFoFRQbACC2LDGQOEjVIksyw691+eLQ00=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=utkWZohGL6b3GYWSbwITeCbNLsj1gs/kyoPBHXBfDG6+IFJcc9j12ffnMgpuimKEXB5rtj2CCKGWJwCAXXJ5jWIh8Fqi33Vo5n32DhtX1yvIyJroxSGaDrnQLsVsQYwgdU/armXaT0RQcMsLaycgY1k2TsQT1NfaW9aKR4sYEkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=nJ0hICrP; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a9eb3794a04so552208066b.3
        for <linux-leds@vger.kernel.org>; Mon, 18 Nov 2024 06:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731941699; x=1732546499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rb5KhQmw4LslJ+rFvwG7oSd7/IR0vOX8Cf3hoYX7Tng=;
        b=nJ0hICrPufB4tMHHl0kCWKaL2Hv09jGWCXnSYjZMOi5CtWSi7qkAc9GHA2sQLB/l3U
         00sO3s5UWOJzesBqKTl76BN+95t5OWhiBxFTcwP3UganxQ0+uwjIdjZgnjFc9VeX8eDu
         Vhg2gwzKN4izAbRAKxIcOcEv2LVR1TU4XPdVrq7w7cPKZx/kZPumAhqIvHJhvCuDQdws
         XR7FLItvYyc5a6wuamkvjYdv4LTwrCFPEBLUR4pjtenJzeB/AUa3n7V7EvnMPFYvncXi
         vFeOuXQvE11XtM1+KG50IEjrobfLceFyxui6gRkX3lfnb0IyvngsfpaVh6Sf7G1T7MDU
         C/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941699; x=1732546499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rb5KhQmw4LslJ+rFvwG7oSd7/IR0vOX8Cf3hoYX7Tng=;
        b=rBVIJXCCpKX14T0G+IIfLsC0iD4cpQFWY8WOWqUwxiIR5JgiqgnWy9svcfjaD3zHGR
         /K+6/MXHRbn4NUkJu7nVAT6P1kkEj+8Hye8h2NJQbXfevrlONqxIIROKfEHYfkdrWQ6e
         7VEUmMPvbTCSPCmdgn3UJQsb7zC9BMWsO+jXQwZEzD4QHzW6+iSlNo8vrZJZ5n0FRJHf
         ZNW4S63Es8DfTrkB+TeeNGuT4Q3Rk91nbsw6ZYkVJuZ/5N0jdxDdnJShvL0yiKQv6Ovh
         2f0DpZFJoTpr964uUPW1mhIZDZb9aafmIYuqo0yO3pxp7NNi5t39ugaQ0/ioBASoAXhT
         shIg==
X-Forwarded-Encrypted: i=1; AJvYcCWKkq/QD0qn40m6heq1HTh2TgLYzPsROZdKMqStI+ees00Zl816pYlWr7eyigbMZtpIQCTo9n5sfHNg@vger.kernel.org
X-Gm-Message-State: AOJu0YxGm8Yd5Kyqu7mY76WQRrY02+WjyyuFDrlTkO8jMRYkuhnOiotJ
	rmWrnWIMxEQmQIUJtozq1OMYG7urZEYvargSmtaBCgdfhWzBY2xJQDYwhF1i2UVVhk7X4beFLFI
	GNI9CEs/PUJ5Dy5xhZCe+Y4dUYtVSyXlOpZ5YJjvEOjdFbb+Upcu/jJdaNVdZcXKOGONub8nQ79
	Zi1J2JA4E2SyjF51HaePRkLYCs
X-Google-Smtp-Source: AGHT+IGakfYoRwIFD+fAHqlh39MXBNvGeTyqIDQ/4FiU/c+03NRrIZyHHule8AgQu9QGgBrK3+YxFg==
X-Received: by 2002:a17:907:3d86:b0:a9e:c446:c284 with SMTP id a640c23a62f3a-aa48354f048mr1218450766b.55.1731941698849;
        Mon, 18 Nov 2024 06:54:58 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df1b642sm546125666b.40.2024.11.18.06.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:54:58 -0800 (PST)
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
Subject: [PATCH v7 1/3] Documentation:leds: Add leds-st1202.rst
Date: Mon, 18 Nov 2024 14:54:43 +0000
Message-Id: <20241118145449.7370-2-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
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
2.39.3 (Apple Git-145)


