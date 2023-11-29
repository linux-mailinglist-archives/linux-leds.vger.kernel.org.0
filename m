Return-Path: <linux-leds+bounces-197-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D40C17FD485
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 11:41:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8893128342C
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 10:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 153DA15EA1;
	Wed, 29 Nov 2023 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LINjY8N4"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00A1BD54;
	Wed, 29 Nov 2023 02:41:53 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-332e56363adso4098469f8f.3;
        Wed, 29 Nov 2023 02:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701254512; x=1701859312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7H4B/924HyaoRAFkIk6lK/E+N1uo+pxAmQC4iccDwXA=;
        b=LINjY8N4Suva11owmw4ZDE0lxU+0ggW7NT+HvCxr+oUIEO5G8bLf2mXHN0ysflKjFl
         V89goo4lhy0iPIZxlc7TckwXSu2EMSPwqKSHg7QlSfg/vqCCkUFZjpHGJCJtNjfvONqo
         GzOGMTmtNPzktGnRFmxXgFmgzctp4eYiYfV+4SuknkmSLmZDCMkIWNKqA52JxcPz3KnG
         +gjd+nY5QFnIT5K+v6a/iJZhSlzamgQ9AwTk69cjZsIr7982TKEoOEqywEvoy5xkT8BC
         Wnh/SHGx0Y0Ya6s696anUhvnJ+sEg/ga/s/uOMXGSzHJGX1ujttJ+kwpJ7JhTo2L9net
         fkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701254512; x=1701859312;
        h=content-transfer-encoding:cc:to:autocrypt:subject:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7H4B/924HyaoRAFkIk6lK/E+N1uo+pxAmQC4iccDwXA=;
        b=VnijzAo8fuSFr7eT9Xeag7tGf/gR9zBbnMzki8spIdbbdbQhMEegbFlg8mrLJlo/zI
         UCIqiJev77RpiBjM3QssLj7YNm4I8Q4KZOBlYotSusZQ2emj2sNv2KH5iT8brtW5JdE0
         fJLT+FT/QlYoJImoqUns9wBUdUbxk1FGNB9/ii/q6lrrB232sRVKm6fg+A4ib6Vcgbhk
         NxNfV9G4Pd6qurTkXKBxdmHEb9/07JNlPLc+y6ZHqiSl9YE1ifKLk2yM2IdZDbV1VDhg
         6XnDTFkALPB0dNlSnBXp4Mh5D3ypktgBey0JsUr5R3oZtQC7x5ng/pLteu+YaNCfVnNs
         5nPQ==
X-Gm-Message-State: AOJu0YyVoyVduea++hPqgEhbfleuNpRK8FwkA2LG6IXemDlCS8N+lqug
	5ImtyRRBEteS+QhzXNXv1BE=
X-Google-Smtp-Source: AGHT+IGncGGAwBxF9KtE8pI1EFG5C0hP4V62tWSOJygxtujlh83Qi7ncVbU5KOFYUXN/NiJnwS2rgg==
X-Received: by 2002:a05:6000:1544:b0:333:156:bf00 with SMTP id 4-20020a056000154400b003330156bf00mr6485520wry.30.1701254512184;
        Wed, 29 Nov 2023 02:41:52 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b29:900:d9e3:6657:95d9:170f? (dynamic-2a01-0c22-7b29-0900-d9e3-6657-95d9-170f.c22.pool.telefonica.de. [2a01:c22:7b29:900:d9e3:6657:95d9:170f])
        by smtp.googlemail.com with ESMTPSA id o16-20020a056000011000b0032196c508e3sm3953839wrx.53.2023.11.29.02.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 02:41:51 -0800 (PST)
Message-ID: <49f1b91e-a637-4062-83c6-f851f7c80628@gmail.com>
Date: Wed, 29 Nov 2023 11:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] leds: trigger: netdev: skip setting baseline state in
 activate if hw-controlled
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The current codes uses the sw_control path in set_baseline_state() when
called from netdev_trig_activate() even if we're hw-controlled. This
may result in errors when led_set_brightness() is called because we may
not have set_brightness led ops (if hw doesn't support setting a LED
to ON).

Therefore set trigger_data->hw_control = true before calling
set_device_name() from netdev_trig_activate(). In this call chain we
have to prevent set_baseline_state() from being called, because this
would call hw_control_set(). Use led_cdev->trigger_data == NULL as
indicator for being called from netdev_trig_activate().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 7ed2d0b64..b58396600 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -251,7 +251,11 @@ static int set_device_name(struct led_netdev_data *trigger_data,
 
 	trigger_data->last_activity = 0;
 
-	set_baseline_state(trigger_data);
+	/* skip if we're called from netdev_trig_activate() and hw_control is true */
+	if (!trigger_data->hw_control ||
+	    led_get_trigger_data(trigger_data->led_cdev))
+		set_baseline_state(trigger_data);
+
 	mutex_unlock(&trigger_data->lock);
 	rtnl_unlock();
 
@@ -568,8 +572,8 @@ static int netdev_trig_activate(struct led_classdev *led_cdev)
 		if (dev) {
 			const char *name = dev_name(dev);
 
-			set_device_name(trigger_data, name, strlen(name));
 			trigger_data->hw_control = true;
+			set_device_name(trigger_data, name, strlen(name));
 
 			rc = led_cdev->hw_control_get(led_cdev, &mode);
 			if (!rc)
-- 
2.43.0


