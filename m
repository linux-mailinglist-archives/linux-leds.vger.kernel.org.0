Return-Path: <linux-leds+bounces-484-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9B281CF7E
	for <lists+linux-leds@lfdr.de>; Fri, 22 Dec 2023 22:32:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D129E1F23D3E
	for <lists+linux-leds@lfdr.de>; Fri, 22 Dec 2023 21:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9131E2E84F;
	Fri, 22 Dec 2023 21:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VfOSuhs3"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10ED2E844
	for <linux-leds@vger.kernel.org>; Fri, 22 Dec 2023 21:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2cca9a9362aso12221211fa.3
        for <linux-leds@vger.kernel.org>; Fri, 22 Dec 2023 13:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703280750; x=1703885550; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YmfPk0JG6Y0PYnNk5FXcJulwSj+MKmmi4CzVlgxbhbI=;
        b=VfOSuhs3rDtv5REv2LFyaD8SUJuIaBnxq+vzYe1Yke8d98qt5BPbYp1MaEdT2IrJNG
         MEVsDaspSNS/hG2LsQkvNErM6Qai4vIEQg4kNJSP617zKYFTE6gC0IRkh/8Tr/1ni/YB
         603Dik064rl+Oz5jyjpBAz2qEnjLw04eaVMFrAG8d85RAbRfcxPJkVFUTIlOWSH6Ifez
         SxRLWGsSv19qVwXd2zzF4TpU59t8I8h+7LxOy2S0i2QQ3vB+zPRZ5ar6+412QZueju2V
         YqSWSJ2z2QfKMsEgtaJ+eOwZouQ2C+FKub5sgQ0ptloIAagjytb5gFt+VcqTJwLE6kRs
         ajiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703280750; x=1703885550;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YmfPk0JG6Y0PYnNk5FXcJulwSj+MKmmi4CzVlgxbhbI=;
        b=MDRe3DsN2w7O7T04xKIZp/Lwpzxcr0GvmaaV9MQjH83zb84Z1u5COf8eKWGEgOMO3d
         VYpgd2LkuRbyzIKpRFjebcA8Q+q8ypdb+uE2k+qQugKBZGeVLl+nfT6tvRGf41xvSypj
         V404kvLxD7zjBF53DNGfBQGZI/PxnoWSpwcHQ03wL1bTCq+Y7xHlqTLPLFsz64aJEMrQ
         YNrBcxUyLsgVlPFOu+X+UoQM9T/QXy+viXSrLI9t/dIRHTY2Vej+siQ0tMtrlDyf/N4A
         WYYSilhtOaWW7MPQ7mVZNLiAXW5RMcaiv0jO9iuMDVOoT0GeYBqIlOnZpfrR+LuIUWtY
         6XbQ==
X-Gm-Message-State: AOJu0YxgnllRuL3JNF2K1KwN5b0D7YwnT0UO1zPGFMAvbIPLe+lNm6Rm
	KktMN5waP8GNcXUz6MZSoXf/y2CT/e8=
X-Google-Smtp-Source: AGHT+IE0TlA1eF03aKYzGr5xRfSTaQsMlmdwjgGQqrIunS0kJVwOpN8aEo5k+qEkVi83xWxeaDCpkA==
X-Received: by 2002:a05:6512:2185:b0:50e:3082:1afe with SMTP id b5-20020a056512218500b0050e30821afemr443748lft.22.1703280749437;
        Fri, 22 Dec 2023 13:32:29 -0800 (PST)
Received: from ?IPV6:2a01:c22:76fe:e700:90c7:5d23:5f70:b2c6? (dynamic-2a01-0c22-76fe-e700-90c7-5d23-5f70-b2c6.c22.pool.telefonica.de. [2a01:c22:76fe:e700:90c7:5d23:5f70:b2c6])
        by smtp.googlemail.com with ESMTPSA id x11-20020a056402414b00b0054b53aacd86sm3050911eda.65.2023.12.22.13.32.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 13:32:28 -0800 (PST)
Message-ID: <f33543de-3800-488f-a779-1fa282614462@gmail.com>
Date: Fri, 22 Dec 2023 22:32:28 +0100
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
Subject: [PATCH] leds: class: If no default trigger is given, make hw_control
 trigger the default trigger
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If a hw_control_trigger is defined, it's usually desirable to make it
the default trigger. Therefore make it the default trigger, except
the driver explicitly set a default trigger.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-class.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index ba1be15cf..24fcff682 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -552,6 +552,12 @@ int led_classdev_register_ext(struct device *parent,
 	led_init_core(led_cdev);
 
 #ifdef CONFIG_LEDS_TRIGGERS
+	/*
+	 * If no default trigger was given and hw_control_trigger is set,
+	 * make it the default trigger.
+	 */
+	if (!led_cdev->default_trigger && led_cdev->hw_control_trigger)
+		led_cdev->default_trigger = led_cdev->hw_control_trigger;
 	led_trigger_set_default(led_cdev);
 #endif
 
-- 
2.43.0


