Return-Path: <linux-leds+bounces-322-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4E280B060
	for <lists+linux-leds@lfdr.de>; Sat,  9 Dec 2023 00:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F4A2B20ACA
	for <lists+linux-leds@lfdr.de>; Fri,  8 Dec 2023 23:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B769259B50;
	Fri,  8 Dec 2023 23:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgmBVojr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080F010D2
	for <linux-leds@vger.kernel.org>; Fri,  8 Dec 2023 15:07:40 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332d5c852a0so2740392f8f.3
        for <linux-leds@vger.kernel.org>; Fri, 08 Dec 2023 15:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702076858; x=1702681658; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spP9X66hM5rGTM8qKMkdHu/Sc5PXIhd2gwQI4iKeCWA=;
        b=TgmBVojr3ylKxMHfcRblrklreO8HWnHEc+T3ZFKZagLe4XZgIpUpNjYPvNNgAGutps
         +HgHC678VDEt1xA0cys75AiAIH5lTEykpMsLj/eaJxOHUSEC1CjXPOr/cOC5fKkh6J71
         3bZCdDg7hGvPgpfLe2not1AFss4AVyhz5XGRAY5TMpQwWBearZQQ8YgyCmINq1R0+iyz
         9MRgrapePTjp2HypBXZbcW04/BCIpe1jDu9rxXGigEGFw89UWJUfhOy+Rj5rn7sHWG7H
         VC4qwKwGUr2F9qHZt8iuccAsgt+FB+sjLHfP8uGysDfWQ42gPwAZH2UnKM3quq0IMboB
         jbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702076858; x=1702681658;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spP9X66hM5rGTM8qKMkdHu/Sc5PXIhd2gwQI4iKeCWA=;
        b=DTr6OtgywYKmV7zCX9BXtM29BC/h5BcUsp4dz7n+PgltGa8lOjG5kNlhWgTNO4zeRd
         a3YdiMtXoBUF4nZuralG+B7nG6O5HMX/qDrRlN/t9yPVTjcfAn5Ccl2x73X35OINFuY9
         gPjSRrkAmjoUmbOYdu25lAhpCkAgZLEucnFDSMD+sl9+b09vRoPq9FAIXkV7oQsioKjy
         bZQqGT0oz8YXuEehVkubuXK1us8l6iOYl+T103RC1WUX9TZGloNg85U5zsrHuMjYQZJk
         Vfw/pl869JTP/nUqmtebpCIpvPfOAuG+F5+30ajwsLYVyznhkz3RGmH57PZUz8IYS8cZ
         /Hkw==
X-Gm-Message-State: AOJu0YzHgnTJ+q3LKp0ULT4py5HgdfV6fW1heGa6YAjeNS8IY2qm1gLc
	iD9vF84diPPEwH72Wsc2HKV4NODrlqI=
X-Google-Smtp-Source: AGHT+IFfkBaRf9knnGO4jKeEcZYxQGIgfA3i2XR3+mPKRgHKO6kbiXuJ6YC5BfJrluEh3BfGD8yz2Q==
X-Received: by 2002:a5d:678e:0:b0:333:4462:4145 with SMTP id v14-20020a5d678e000000b0033344624145mr378300wru.85.1702076858298;
        Fri, 08 Dec 2023 15:07:38 -0800 (PST)
Received: from ?IPV6:2a02:3100:901a:3400:1483:699:fdf8:5536? (dynamic-2a02-3100-901a-3400-1483-0699-fdf8-5536.310.pool.telefonica.de. [2a02:3100:901a:3400:1483:699:fdf8:5536])
        by smtp.googlemail.com with ESMTPSA id tm6-20020a170907c38600b00a1db955c809sm1502357ejc.73.2023.12.08.15.07.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 15:07:37 -0800 (PST)
Message-ID: <b74a17c5-0158-4da8-8830-9eb6ee26fcdd@gmail.com>
Date: Sat, 9 Dec 2023 00:07:37 +0100
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
Subject: [PATCH RFC] leds: trigger: load trigger modules on-demand if used as
 default trigger
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even if a trigger is set as default trigger for a LED device,
the respective trigger module (if built as module) isn't automatically
loaded by the kernel if the LED device is registered. I think we can
do better. The following works for me, however there are open points
regarding the module name/alias.

- Is it ok to assume that module name starts with "ledtrig-",
  or better add a "ledtrig:xxx" scheme for trigger module aliases?
  This would require MODULE_ALIAS'es for the existing triggers.

- Is it ok to assume that trigger name doesn't include whitespaces?
  Or better remove potential whitespaces when assembling the
  module/alias name?

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index bd59a14a4..ab79b2c71 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -250,6 +250,7 @@ EXPORT_SYMBOL_GPL(led_trigger_remove);
 void led_trigger_set_default(struct led_classdev *led_cdev)
 {
 	struct led_trigger *trig;
+	bool found = false;
 
 	if (!led_cdev->default_trigger)
 		return;
@@ -259,6 +260,7 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	list_for_each_entry(trig, &trigger_list, next_trig) {
 		if (!strcmp(led_cdev->default_trigger, trig->name) &&
 		    trigger_relevant(led_cdev, trig)) {
+			found = true;
 			led_cdev->flags |= LED_INIT_DEFAULT_TRIGGER;
 			led_trigger_set(led_cdev, trig);
 			break;
@@ -266,6 +268,13 @@ void led_trigger_set_default(struct led_classdev *led_cdev)
 	}
 	up_write(&led_cdev->trigger_lock);
 	up_read(&triggers_list_lock);
+
+	/*
+	 * If default trigger wasn't found, maybe trigger module isn't loaded yet.
+	 * Once loaded it will re-probe with all led_cdev's.
+	 */
+	if (!found)
+		request_module_nowait("ledtrig-%s", led_cdev->default_trigger);
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
-- 
2.43.0


