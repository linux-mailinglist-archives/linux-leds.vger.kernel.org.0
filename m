Return-Path: <linux-leds+bounces-326-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828780B6EF
	for <lists+linux-leds@lfdr.de>; Sat,  9 Dec 2023 23:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 174701C2042D
	for <lists+linux-leds@lfdr.de>; Sat,  9 Dec 2023 22:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 987F31A72F;
	Sat,  9 Dec 2023 22:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kukz0fcf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0D8E115
	for <linux-leds@vger.kernel.org>; Sat,  9 Dec 2023 14:51:33 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a1e35c2807fso437759266b.3
        for <linux-leds@vger.kernel.org>; Sat, 09 Dec 2023 14:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702162292; x=1702767092; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gDfMItrwUoSAwUO1KwAE9f7psNd5O8vy+NAM6SG9OkA=;
        b=kukz0fcf4ZnQijyNqVCJ5hgZiHZAJTMQeyuPIvvjFQLTyvoRvIZAGox5kZPMxtb57U
         O5TSTbQcPvHTIi8oxCfhWiICstWIHw1FXwGlFqj8rijC4Bp0203+1q4Ca95rFtCYENhB
         LaAbaVolZv3PsaEA3dE4dJTHWZlzZukF/jlVWkQXAvoNMm7SZ9jJlXLwr2ErJBoEG6tS
         gAn+osHPKGhxzp72VLow1gBMS6mbhX1FeZsNOC8EDgLfppKXog3u+lHF3bjHa5m+MDKK
         cy6dRwTs/pvkXyDtmSNJwXetKqlw/Rgsb4OhkqSFB1uKlJJ3D6gwdXYbVyPlXo+/j2vP
         MGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702162292; x=1702767092;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gDfMItrwUoSAwUO1KwAE9f7psNd5O8vy+NAM6SG9OkA=;
        b=IW0aZTAz7k3gS5Vo9N6UZbfTi0w7Ohfx0btGv+mwWMkMjDUNlRprwS2QLnAPIhObA9
         BUalTBBte4XiMXobTgRadw/BvtyWhmbU52H8u+1yEKPOpgyh8TgLnFr+EZzyNEcb/MpK
         BTAbal5VoTkZ8ti9DpKbQlg6TRMcVUejbjle95oGQTLkogixY4T+U9Sx7OaeCrV6IuNN
         lch3nMH2bSpMA15CesXA765u2iiGUi3vnyIupWPG0bAbt7dtu0ogZ3/3fZLlBTg8DiC2
         ygi2feaBEdeC6cHVJnN03doeF5yxC8CoV/ZSgkK6lMOAiFoeKqjGYDVnOan4vGefbOYq
         /6Og==
X-Gm-Message-State: AOJu0YxnGjjkT9mvZSDh6eG98vMq0eAqOytjz+eYtzDmxKzqjmWcv6HW
	r78W2RBQBptv/opn/JjXLUo=
X-Google-Smtp-Source: AGHT+IEraR1xR1QlduN/uYCa0N4zfKaph8ASPV4oWVyHO/iSqsZmT3+yzBxR124vSI29IajgAhFEmw==
X-Received: by 2002:a17:906:2246:b0:a1c:7242:4d8c with SMTP id 6-20020a170906224600b00a1c72424d8cmr929414ejr.81.1702162292035;
        Sat, 09 Dec 2023 14:51:32 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f10:8000:d512:8b24:38b6:5405? (dynamic-2a01-0c22-6f10-8000-d512-8b24-38b6-5405.c22.pool.telefonica.de. [2a01:c22:6f10:8000:d512:8b24:38b6:5405])
        by smtp.googlemail.com with ESMTPSA id cb6-20020a170906a44600b00a1e2aa3d093sm2659030ejb.202.2023.12.09.14.51.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 Dec 2023 14:51:31 -0800 (PST)
Message-ID: <c8aa079f-acf7-4cb8-b198-d16fcc5778c3@gmail.com>
Date: Sat, 9 Dec 2023 23:51:32 +0100
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
Subject: [PATCH] leds: trigger: panic: don't register panic notifier if
 creating the trigger failed
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

It doesn't make sense to register the panic notifier if creating the
panic trigger failed.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-panic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
index 64abf2e91..72297a845 100644
--- a/drivers/leds/trigger/ledtrig-panic.c
+++ b/drivers/leds/trigger/ledtrig-panic.c
@@ -64,10 +64,13 @@ static long led_panic_blink(int state)
 
 static int __init ledtrig_panic_init(void)
 {
+	led_trigger_register_simple("panic", &trigger);
+	if (!trigger)
+		return 0;
+
 	atomic_notifier_chain_register(&panic_notifier_list,
 				       &led_trigger_panic_nb);
 
-	led_trigger_register_simple("panic", &trigger);
 	panic_blink = led_panic_blink;
 	return 0;
 }
-- 
2.43.0


