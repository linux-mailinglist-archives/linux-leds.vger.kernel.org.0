Return-Path: <linux-leds+bounces-603-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA7882E24C
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jan 2024 22:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73D9C1C208CB
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jan 2024 21:46:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6E61B26E;
	Mon, 15 Jan 2024 21:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCnVJ968"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA311AADB
	for <linux-leds@vger.kernel.org>; Mon, 15 Jan 2024 21:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-336990fb8fbso7268305f8f.1
        for <linux-leds@vger.kernel.org>; Mon, 15 Jan 2024 13:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705355180; x=1705959980; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GMTuu1+H/vpARvI1RSPvO+iWDC/HDK3YtZH7Q67uoD4=;
        b=dCnVJ968XA/o5/PomvawKzoS136eWYhId3LhGoq2cfzeQuc8zVQ0Jt/pW6/SN44mIG
         hRCn7JJtTY6kPGn5/VklbRMi27RqrFsqMhOnarcYRbqukMo4eFdQLZ7Rq74vzuyQeUcJ
         h6GeSheEdnLpRvsFV1AjjRo/YNtWzs+eBq6DS5yVd+oFraypzG51AzDoMeBD4/kZJF30
         LS4lwtAZM4DzspG2l2w/gp5b0VSgRwl1VoPY2aC2uV7QO18g8fMRi1vkhAGnwI0T3h0w
         ZNaKbOGnLVlyzr9DS0QFcDF8OSJHkdZ3s37LbM3DPPiyq5puYSGhcF5amwJYAMReC2B5
         opXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705355180; x=1705959980;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMTuu1+H/vpARvI1RSPvO+iWDC/HDK3YtZH7Q67uoD4=;
        b=Z0bpLlTpkjba1Jw2ifv21bTm9UYTdn+lPkY7mmVnLDcwOEdFNwdHil1BREz2Qz70T0
         3tnIGPi/klOf2zKkbb92eLyQaWli6fSPz7CFDWEFmCqefuB2ZTq5duquuuTHTZv0jEeD
         ZpvHGnsB3RLA9/Q5mqagDJXvgNxxtOlZ37FMoF3YImXfLvHgIo7Dd0zzHur0qU0o7c12
         tavGqTB6ncPCk41pdzyvFcAZzhmYlF9t2nfaOGPplES1v/KSNvY2sul8TTkfRP1pERVp
         EzybLGKHtKhgu3W2vpsrWgitR7NaLM7JwXhpNaDi16HzK9Hlq+SJ6Ne9pJm8puFOlyr8
         Mizg==
X-Gm-Message-State: AOJu0Yyo3BABQ23NUa/xPI3FLmIc6FiNSb+RkP5A/FpDzxZpLgTyQ4U0
	hrUlPDvZH/Kz9EYKMuFB82oZ+ovXULk=
X-Google-Smtp-Source: AGHT+IF25shXQmnuepkUjTy65IGlcwqlSB+d+hj6xmTTeGQbtHghqhXhErNPEAQjmJ9912vvdse0jA==
X-Received: by 2002:a5d:49cc:0:b0:336:6197:8b73 with SMTP id t12-20020a5d49cc000000b0033661978b73mr3115243wrs.104.1705355179722;
        Mon, 15 Jan 2024 13:46:19 -0800 (PST)
Received: from ?IPV6:2a01:c22:7af7:3c00:7597:3236:4ca1:6867? (dynamic-2a01-0c22-7af7-3c00-7597-3236-4ca1-6867.c22.pool.telefonica.de. [2a01:c22:7af7:3c00:7597:3236:4ca1:6867])
        by smtp.googlemail.com with ESMTPSA id d29-20020adfa35d000000b003375009accesm12930905wrb.50.2024.01.15.13.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jan 2024 13:46:19 -0800 (PST)
Message-ID: <7e94d26b-d772-4a07-b0f6-bb3111b9ff75@gmail.com>
Date: Mon, 15 Jan 2024 22:46:23 +0100
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
Subject: [PATCH] leds: triggers: default-on: Add module alias for module
 auto-loading
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

A bigger number of board device tree files, plus few drivers, set
default-on as default trigger for LED's. Therefore add an alias for
module auto-loading.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-default-on.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/trigger/ledtrig-default-on.c b/drivers/leds/trigger/ledtrig-default-on.c
index 8207f85ec..8678e64a5 100644
--- a/drivers/leds/trigger/ledtrig-default-on.c
+++ b/drivers/leds/trigger/ledtrig-default-on.c
@@ -28,3 +28,4 @@ module_led_trigger(defon_led_trigger);
 MODULE_AUTHOR("Nick Forbes <nick.forbes@incepta.com>");
 MODULE_DESCRIPTION("Default-ON LED trigger");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("ledtrig:default-on");
-- 
2.43.0


