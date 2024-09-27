Return-Path: <linux-leds+bounces-2865-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AC3988BE4
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 23:39:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3332C1C21854
	for <lists+linux-leds@lfdr.de>; Fri, 27 Sep 2024 21:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E97361B07B4;
	Fri, 27 Sep 2024 21:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F1uE9ifm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B6BA1B0111;
	Fri, 27 Sep 2024 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473106; cv=none; b=uhpkdGQhdAg+tQiCc2rKsaZRgPduMPyHdhd6eZ14SboeeKeNAwhNwjiopTFb2p1OpC8g81AzSoD/KDGVrk+VvOU7TD0zYIWQaT8nmYlF6Xluq5gmom8ZufKKgW07viAkT+ZRW3zqugAVpvZCLvYmmInLMFcPstR9jK1uJOfs/gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473106; c=relaxed/simple;
	bh=LP0T9ijhkfsTFjsYgPVVYwLZmhS4i9wAwBo/aro0Cng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fETI0XIBmQfUCOK/r2yBHCtihYVh2ALwWz6PS0F+m0GNr49Ab3yZ1bddxBbsqJqRv2RNMF2QBoxHvId/xJAdcMPb2KdPQ4yZXL9fMHVAQV4so0PNgHyE7QittEDydBW6KgvqthgO64CatCMl66AKhU89RKk4SsnCVhoHQLMx6IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F1uE9ifm; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2f761461150so38699281fa.0;
        Fri, 27 Sep 2024 14:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727473103; x=1728077903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6CbgyIPXZfp5qeH1V+hKQ72ahkA8DcOtFC4oIU4X64=;
        b=F1uE9ifmZhxYDhE77hQ4Sv/dv7TfEcCTlbbxyOY99/vr++JFk8qQuKLjobn2c86Xks
         bZ73ucdBjBwGE1F9fo1nBDfiLzZisHRdSKcFsHfMKSXVmUIVWAv18dthy/v6Wy1Gn4XK
         y81ADEhUpDObYSQ4c0nCGpCpUgU6GLioazrTpzcFwJNd1EfFdJ/0Kp3mwGhpTN3NdG/p
         nHbNrMtQj0gdEWUFi+1nOcSvVPWtk2+oUZKM66loa0rXHHnj/QO7onxwno1VHOB9OIVC
         +jjCvGewqtR6Y7cWhXryZAIwDEwHMBF8PL1C9wqYEyWaUhbMdMCphy18Ay3vhFOhS5hp
         Vy2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727473103; x=1728077903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6CbgyIPXZfp5qeH1V+hKQ72ahkA8DcOtFC4oIU4X64=;
        b=n6prN0682DBgEmUlkUxgfcGii2LWV7Gj+0wKur3uJGTZhVlJ+jvdfV8ViI+rQH8IHJ
         TLZUAFViLi0VGKB2cc3SRDeLD/dnXY1u1c8NfSRNlmwEYxTbwr6KsCxjRxXPd4T2prlp
         iJNLdgUMVXbW3YcxqV9oviijvC3uOLz6OwoV7BnR9vdEFSzuNXf6DzIvgvKRAsD9EiuP
         Nyo0t21MIkYo+6W9H4nXqiiQUuMQ+3L+ETkpkKpQ64hUD5cKAlB/k7nF2sJTLpDOZCc6
         wlj862n3wkKSQEm5aaHtun4X0d4H0iYDAzDzsmiriyjWTaAiOpgaKV4HDNVC+aDOE42d
         fxBA==
X-Forwarded-Encrypted: i=1; AJvYcCV1H8W7QwX0azHnBjMvFDeMPgkEKB4ACwxIR3clHlrIp1EQM8/5fVSnWWbZDhJeQofW+VqclbXK41bN9mQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqnnt4fdzyHgG9CtYa/xFd0WAj8DOJTsftl01DMI8asZRPnZpJ
	vUy0jeGwbYMUUL0hbkRKXbWq/Ip1jgnkJjj8FhyUu91e82h6BEbkj/csMbRQ
X-Google-Smtp-Source: AGHT+IGd5FrdFaI0DW0cbUKCWEseXq5X4OahRdYbj7LLmQ8wpaSfmCQPc19+dhAbWbCVrtW+TCxNPQ==
X-Received: by 2002:a05:651c:220a:b0:2f7:5337:52ce with SMTP id 38308e7fff4ca-2f9d3e485damr43550141fa.11.1727473103223;
        Fri, 27 Sep 2024 14:38:23 -0700 (PDT)
Received: from [127.0.1.1] (2a02-8389-41cf-e200-6e73-3ff7-9936-9d4d.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:6e73:3ff7:9936:9d4d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2978a04sm179174366b.144.2024.09.27.14.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 14:38:22 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 27 Sep 2024 23:37:44 +0200
Subject: [PATCH 5/6] leds: pwm: Remove unused local leds.h
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240927-leds_unused_leds_h-v1-5-46fbf41ed4ae@gmail.com>
References: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
In-Reply-To: <20240927-leds_unused_leds_h-v1-0-46fbf41ed4ae@gmail.com>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727473094; l=722;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LP0T9ijhkfsTFjsYgPVVYwLZmhS4i9wAwBo/aro0Cng=;
 b=YHPP0KTcW7KBJfpaipimlNULmgD7W9x0vmLyxznvddaqeCJWNudFGic0TJTSrmFabKjhnv0+O
 6oEm2TSqmqpC3AWGfCXiULmQZ25/csnnJMK+zorZTnMzfENU8c5H0um
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

Commit 156a5bb89ca6 ("leds: Move led_init_default_state_get() to the
global header") moved the only element leds-gpio required from the local
leds.h to its global counterpart. Drop the inclusion of the local leds.h
as it is no longer used.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/leds/leds-pwm.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e1b414b40353..be4d2febf376 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -17,7 +17,6 @@
 #include <linux/err.h>
 #include <linux/pwm.h>
 #include <linux/slab.h>
-#include "leds.h"
 
 struct led_pwm {
 	const char	*name;

-- 
2.43.0


