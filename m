Return-Path: <linux-leds+bounces-281-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB1B8078CC
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 20:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68A5E281E2A
	for <lists+linux-leds@lfdr.de>; Wed,  6 Dec 2023 19:43:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C161747F64;
	Wed,  6 Dec 2023 19:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyRipRph"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B8AD46;
	Wed,  6 Dec 2023 11:42:54 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54c671acd2eso208439a12.1;
        Wed, 06 Dec 2023 11:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701891773; x=1702496573; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:cc:to:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OtiQVOsiziZolbXqEGsWppzN9yGgcFtqpuEfznXju8E=;
        b=TyRipRphHg+dffllnri59mcInt5PZp/+KqGuCEzFMdpNIVpBxKR6VzMpzlELxDcc44
         unpp4CHBL6G2Rt+DRts5+2O4k+a2VaThUT8CvdMeM+MmFA01UVHyqQbECdAOQyEc/Mro
         ZpOVyStJtNai3sYM9lAgFyqLo5s3Th2RbjwAPtQNrmDiv6+zyyBBeidY5iaCntZ5swxo
         CC8EWgpozi0kQzm7EtHcsrKtqQQ4czgyhCmXsKSPgoXkEVkLkt9hG9u1hjyg4UrbbuIu
         X/P2e19/atK1oWtXc7+I1B1nu1jCJXJruQ0wOr5F0B7zuyWK98FxvRfWdBzPDtIGwY0i
         0yKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701891773; x=1702496573;
        h=content-transfer-encoding:subject:cc:to:autocrypt:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OtiQVOsiziZolbXqEGsWppzN9yGgcFtqpuEfznXju8E=;
        b=Xykq4FtAlLjWx7pil/fd+d7B17Tu9JvXdiEi+o/qOWHKRRS6Wqp46rn+bP1f2Zk1uw
         MS1XCzmo55nlrAZTPJj6Dtex/NZSnfpW5XwuZKqaNCZ82h3XpLvzVUpkVUfQb4Mdeb72
         8U6qj5CpRg7qr0xdNNRdaxHfLrYPUPIgnqQ+Iio+DG0OcLrc/XGxLH3aYMtKHe40UWWS
         RpU/qRMo4FhufPoktWRMpo94/ljimME9vuhwBMqb4wBhhKr2TKhO8gtqouacLI++PX52
         wTxgp99/lZ95ONz0IMebP5NFIzKiqNaETrL6Zpnkgloj1VWxAZId5whSAJ5DaEow+n++
         w3JA==
X-Gm-Message-State: AOJu0YyUzys0qXoYr6Ahd05JZB6JEJefURiu31qvNvCgLkGAYxzCUs3z
	SgjdVnZv3WC67tzB98fDqhY=
X-Google-Smtp-Source: AGHT+IEqfFq80DzCK47QMH4f6Exh6ehHg8uW5GTxKK17K1RgZUmaHP8V2xB7yyKSuOIBp9Emx77zoQ==
X-Received: by 2002:a17:906:3408:b0:a19:a19b:c741 with SMTP id c8-20020a170906340800b00a19a19bc741mr780717ejb.145.1701891772448;
        Wed, 06 Dec 2023 11:42:52 -0800 (PST)
Received: from ?IPV6:2a01:c23:c486:e400:94df:9494:ce6f:5fa4? (dynamic-2a01-0c23-c486-e400-94df-9494-ce6f-5fa4.c23.pool.telefonica.de. [2a01:c23:c486:e400:94df:9494:ce6f:5fa4])
        by smtp.googlemail.com with ESMTPSA id bi18-20020a170906a25200b00a0c3b122a1esm341627ejb.63.2023.12.06.11.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 11:42:52 -0800 (PST)
Message-ID: <91e9f4c6-d869-45be-be72-ac49a3c3b818@gmail.com>
Date: Wed, 6 Dec 2023 20:42:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH] leds: trigger: netdev: add core support for hw not supporting
 fallback to LED sw control
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If hw doesn't support sw control of the LED and we switch to a mode
not supported by hw, currently we get lots of errors because neither
brigthness_set() nor brithness_set_blocking() is set.
Deal with this by not falling back to sw control, and return
-EOPNOTSUPP to the user. Note that we still store the new mode.
This is needed in case an intermediate unsupported mode is necessary
to switch from one supported mode to another.

Add a comment explaining how a driver for such hw is supposed to behave.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index d76214fa9..27f090bc8 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -38,6 +38,16 @@
  * tx -  LED blinks on transmitted data
  * rx -  LED blinks on receive data
  *
+ * Note: If the user selects a mode that is not supported by hw, default
+ * behavior is to fall back to software control of the LED. However not every
+ * hw supports software control. LED callbacks brightness_set() and
+ * brightness_set_blocking() are NULL in this case. hw_control_is_supported()
+ * should use available means supported by hw to inform the user that selected
+ * mode isn't supported by hw. This could be switching off the LED or any
+ * hw blink mode. If software control fallback isn't possible, we return
+ * -EOPNOTSUPP to the user, but still store the selected mode. This is needed
+ * in case an intermediate unsupported mode is necessary to switch from one
+ * supported mode to another.
  */
 
 struct led_netdev_data {
@@ -306,6 +316,7 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 				     size_t size, enum led_trigger_netdev_modes attr)
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
+	struct led_classdev *led_cdev = trigger_data->led_cdev;
 	unsigned long state, mode = trigger_data->mode;
 	int ret;
 	int bit;
@@ -345,6 +356,10 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	trigger_data->mode = mode;
 	trigger_data->hw_control = can_hw_control(trigger_data);
 
+	if (!led_cdev->brightness_set && !led_cdev->brightness_set_blocking &&
+	    !trigger_data->hw_control)
+		return -EOPNOTSUPP;
+
 	set_baseline_state(trigger_data);
 
 	return size;
-- 
2.43.0


