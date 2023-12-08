Return-Path: <linux-leds+bounces-321-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 960FF80AFFF
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 23:56:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A5481F2120F
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 22:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B06041840;
	Fri,  8 Dec 2023 22:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQc0kFOm"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 649051985
	for <linux-leds@vger.kernel.org>; Fri,  8 Dec 2023 14:56:43 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a1db6816177so341347966b.0
        for <linux-leds@vger.kernel.org>; Fri, 08 Dec 2023 14:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702076202; x=1702681002; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DO9cVGgMhKbQV4yvktSm/6sQKmx5ZehySM2xGZjeXmY=;
        b=dQc0kFOm4Q7Af0oOAimMqYmePu4/L3MmgeJMIeQg8r4GLYGDAyIeyOWMamct0qoC+w
         oSARaCGZI8NbxKEfR7TSgNQ5MgsMNAhAAneWClHiTFenifci41q4+K1lO6e57mcTMAcA
         CJHVFhcR9Hf2KtQBtbUDuIs062RU6Rmvz27AVmQT9wqJuWUVeDTKrmfXseAD8Z1Qvlw1
         RcmEpyr72q5tl0YRilS+tz9a8ReOq3aapHaQHiH2LL10BIH/mvWzDtrqou8o2JW8bbHI
         E9gBJj5Yoo70p7ltAj4nhcg49myCuBKtu2EDGcABE4uRV/As3bDZz+HglT2nmwklW9F7
         BZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702076202; x=1702681002;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DO9cVGgMhKbQV4yvktSm/6sQKmx5ZehySM2xGZjeXmY=;
        b=hCW/X8eKTbZTwUezU39DKZ/wTo+ioLEGbKofp/fa+Rq8SqFAfq1ZyXibjnBr/WKgFF
         Vr+QpV+cgzOgKRCZhRD1APKAoKtFboaf3F+vwa+oLy+kY1ed03/9nBem9IlrfHUDjpTa
         IiGjN6Ia+5JJnfPV7k5GWgPxm3vZRmPNZFAN0clWU/EZQLjow6NbZlXML2E2S+062vdi
         Daq+3gasjwcCXY0+2yJsfIWs1U4uSOO2aws0aUm0QDuoNWGo23wrVGxCDoHQnu4rzi2f
         nDQXKEzoPcK3zui8XaPkKh2y35nefDqrSXhlpYLHK1vJEPzpL37aoFrTy1DIK/1OKkPe
         yrpg==
X-Gm-Message-State: AOJu0YwOqdDFCkbMDS3V8eFtMVh14fFFIM+/fQrgMtFFLUuuy5VVg605
	XM2Ac72a2GvpbtmZdOu1Y90=
X-Google-Smtp-Source: AGHT+IEwBZrGLVG3XLmwyq4xQ3zxaoLje/ixDuKmzdB2llnFGcl5LMjFL7/ZNfRf51dMoEJkVEXI+Q==
X-Received: by 2002:a17:906:245:b0:a08:1224:abd6 with SMTP id 5-20020a170906024500b00a081224abd6mr248220ejl.3.1702076201557;
        Fri, 08 Dec 2023 14:56:41 -0800 (PST)
Received: from ?IPV6:2a02:3100:901a:3400:1483:699:fdf8:5536? (dynamic-2a02-3100-901a-3400-1483-0699-fdf8-5536.310.pool.telefonica.de. [2a02:3100:901a:3400:1483:699:fdf8:5536])
        by smtp.googlemail.com with ESMTPSA id ld4-20020a1709079c0400b00a1df88cc7c0sm1476683ejc.182.2023.12.08.14.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 14:56:41 -0800 (PST)
Message-ID: <d90f30be-f661-4db7-b0b5-d09d07a78a68@gmail.com>
Date: Fri, 8 Dec 2023 23:56:41 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: trigger: remove unused function
 led_trigger_rename_static
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

This function was added with a8df7b1ab70b ("leds: add led_trigger_rename
function") 11 yrs ago, but it has no users. So remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 13 -------------
 include/linux/leds.h        | 17 -----------------
 2 files changed, 30 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 6a5e1f41f..bd59a14a4 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -269,19 +269,6 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
-void led_trigger_rename_static(const char *name, struct led_trigger *trig)
-{
-	/* new name must be on a temporary string to prevent races */
-	BUG_ON(name == trig->name);
-
-	down_write(&triggers_list_lock);
-	/* this assumes that trig->name was originaly allocated to
-	 * non constant storage */
-	strcpy((char *)trig->name, name);
-	up_write(&triggers_list_lock);
-}
-EXPORT_SYMBOL_GPL(led_trigger_rename_static);
-
 /* LED Trigger Interface */
 
 int led_trigger_register(struct led_trigger *trig)
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 1bdf7f5a0..4754b02d3 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -527,23 +527,6 @@ static inline void *led_get_trigger_data(struct led_classdev *led_cdev)
 	return led_cdev->trigger_data;
 }
 
-/**
- * led_trigger_rename_static - rename a trigger
- * @name: the new trigger name
- * @trig: the LED trigger to rename
- *
- * Change a LED trigger name by copying the string passed in
- * name into current trigger name, which MUST be large
- * enough for the new string.
- *
- * Note that name must NOT point to the same string used
- * during LED registration, as that could lead to races.
- *
- * This is meant to be used on triggers with statically
- * allocated name.
- */
-void led_trigger_rename_static(const char *name, struct led_trigger *trig);
-
 #define module_led_trigger(__led_trigger) \
 	module_driver(__led_trigger, led_trigger_register, \
 		      led_trigger_unregister)
-- 
2.43.0


