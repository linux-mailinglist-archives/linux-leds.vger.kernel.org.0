Return-Path: <linux-leds+bounces-2864-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE1988BE2
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 02352283714
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538DB1B011A;
	Fri, 27 Sep 2024 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/7BXHbh"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB451A01BE;
	Fri, 27 Sep 2024 21:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473105; cv=none; b=egOqpws2yg8jJPBwz6h5mOOEZMTRnadRAaoUY9GHma1fsJ3LNkpQfoiBYCtFd6Nm+3AYMPPWgXPkDmDBrJe9s1MVG97Z7+fvW+xlBH2Gd0Y9cgaPUYaCvX4Jitq8HA/loZn9edrrs8GeGXt79B0yUKI5Wwd1g7sCu/gXaa27JsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473105; c=relaxed/simple;
	bh=YOeQsa6SrzSY24cx2WpfGMj5ASvNWNSAqhkRs6HTHPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6lSmp/trssgyyClBrIAdNWwNL9mMhzOH9Beej+WLTQq9TNYM15nV8S/CNLb9RcNRA5OR8kEA/aPwGPGurBYoarwxmz4htwX3x4QmcUhZP6Pj5O4eaqBoCMvmjdHIrI8S5oUSC2OuY0miTAL9IHwshXmu1m/iPj3D1Qq/9FAINY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/7BXHbh; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7a843bef98so330583166b.2;
        Fri, 27 Sep 2024 14:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473102; x=1728077902; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCdtxwo1U+OBHn6pgJSbRmn/A6Zt0b43Qo1bC/fhSkE=;
        b=b/7BXHbh8nO3EOzuydOokRW7ZGo+0PDZiuCm3UUp1MUfAd56nbTaz+p7XrX/YihtjT
         L0HiaO7su6B55rtn1gw9g/hzAiuinD8KLgbdw0QteYDvMe+5YNeSyRD4lJuCko8O/e7f
         qwLsXN0qiU++oTxXgEw/hzAk4cqq3Z/Mr3kqwvqSPPAp8RRbSPBPvGP2c27DTkDm+a8n
         1PQ9MiFDbsPPjSxjctNCdaYjmPKJcjBq49QjEJZDsVIbYqO9d7C5A/5KTquHPLq57EL2
         uYwq+OCdST/KRtN4Wne4U/Jzpa1tGZGjkR4rR8/0vbM/sNNsZgbWF0vebQz5DtG2IytS
         /HJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473102; x=1728077902;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCdtxwo1U+OBHn6pgJSbRmn/A6Zt0b43Qo1bC/fhSkE=;
        b=LPD8Q5nsNbU7XYe1d2iDZmvJmYftZW5T56DGWUUI9CpcLBUG8cSQcA9nyQQp1ODaSS
         dNgVbSxfsIUyibHduUJzunj7WQFhhdiZP0UyQge94+lt7mIawh9Tiz5riJXEFta3mURh
         /XTnqcsQcUPQH2i0RMemMhFUJ3ljjwGOWh2DpOjVM8LMDck2X9vONoXOkX+NFbj3cgq+
         CsLi2ima3bTw2kUweUIOUL/A5Xl2XhISfNKEAkXwxJebYtnrQhe88nURlgfjBJVDp8Cj
         g8Lt5TLa1rgwJby1YdA9hNvQ5PAj3T5rsHQMTS6L6on+CVxYrqs1xA1qGbBx1pLFZJ6e
         i+Tw==
X-Forwarded-Encrypted: i=1; AJvYcCUiDgl10Sn1Ci8yKrYraLygRTzuiOrt9OChikYdAw4OsqkIBqWwr+83GhSVWsEP3TAY+PGwYLXO0iG85VM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyY7hiCi8wFDqujj4icNMSOi/K7uBWEifN9YwnnouB313+qYr1
	KNCysCJrOygI7SjlLUGtvhBV4//e1I8RR9tDwWvuRBngXCLC9Xjw
X-Google-Smtp-Source: AGHT+IEHrSDMz7tYdxN1Iza4za+Uytw1qRAXfbBtrvAAvLOL4j0QreBQayXJCDC65FiLwoulRYmCcw==
X-Received: by 2002:a17:907:6d10:b0:a90:df6f:f086 with SMTP id a640c23a62f3a-a93c48f1d1emr441727266b.11.1727473101612;
        Fri, 27 Sep 2024 14:38:21 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:21 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 23:37:43 +0200
Subject: [PATCH 4/6] leds: lp50xx: Remove unused local leds.h
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_unused_leds_h-v1-4-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=609;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=YOeQsa6SrzSY24cx2WpfGMj5ASvNWNSAqhkRs6HTHPk=;
 b=83iVmD2s7V7dBx/Uxq5MzXy+A5NExVpf0fFrXvwgFFSb6MPo5zN9y2YA9oEoWuZ319WZiwLLf
 zlc8liedRlJDLANYot9hztk0Md+1qwf3bUNz2OdnY8AzjYBpz868Hlv
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

This driver does not require any element from the local leds.h. Drop
unused header.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-lp50xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
index 175d4b06659b..a4e45078a567 100644
--- a/drivers/leds/leds-lp50xx.c
+++ b/drivers/leds/leds-lp50xx.c
@@ -16,8 +16,6 @@
 
 #include <linux/led-class-multicolor.h>
 
-#include "leds.h"
-
 #define LP50XX_DEV_CFG0		0x00
 #define LP50XX_DEV_CFG1		0x01
 #define LP50XX_LED_CFG0		0x02

-- 
2.43.0


