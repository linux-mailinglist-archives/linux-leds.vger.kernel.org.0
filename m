Return-Path: <linux-leds+bounces-437-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C868161A1
	for <lists+linux-leds@lfdr.de>; Sun, 17 Dec 2023 19:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52F99B21F25
	for <lists+linux-leds@lfdr.de>; Sun, 17 Dec 2023 18:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99391E480;
	Sun, 17 Dec 2023 18:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4pElLP7"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17EED47A63;
	Sun, 17 Dec 2023 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a2335397e64so82286766b.2;
        Sun, 17 Dec 2023 10:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702838804; x=1703443604; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OtiQVOsiziZolbXqEGsWppzN9yGgcFtqpuEfznXju8E=;
        b=h4pElLP7wleP5PqkUlNN2XyY5H/GFemCZmjUWeXzMt9S42AKs5prgZAoRn8U8Nd0qY
         vLBFALgQtLnei7fg8mHH81oR/NvDodLxmGRCZxez294Dfb5HQTFntsjNsW0By38FZRIf
         6IsuhyuF2hGu4ZTnDZoXlEjRc9AQzdbfAGwo1kFeTxE8DScWQWh0CbQO8sUJCD5PHUih
         oji2PnoIdBcodgAbAscll85CL6/4TGOYX0+BR/Z1WyKLC/9yovfpWO8ZDXxcInQGHwzA
         F1kGguzvaIfnvDqpvabuCi7MaWKInkmgJm0LIHtMEJEfnCfWF03C3zFhQGR7eeDXEtVq
         1uhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702838804; x=1703443604;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtiQVOsiziZolbXqEGsWppzN9yGgcFtqpuEfznXju8E=;
        b=NWch2jvptQGKzq6x/l9OoanW44YFPHPmAAA2sZjI+OTjGCAhnp0rFOmJ4dsBVKRAdk
         i+bixeqMya2ECj5JX9Plc5tMi6UGCVeebduboYT+qQgJuf2tsMs0Nijiqyq0KgtBqQgC
         U8HXVzGD1gKAEZuNjBI7X8m6fokkxFhfb1GhCvc3Up8q1ba7BXubZL0D6ujquZicyz90
         mXoPevc72ktNF+z13ZmTYwxMi8k7GctcKtIUKBuEhhvU99SnTp3rFEPIXYoRQL0VcCwP
         5QE8ilYfHVvTqdOtZ0Vqwj5KV3OGi6RdGZUnfPWwhDQZFuLpuLsCpzaWwMcFOSuAmPei
         znoA==
X-Gm-Message-State: AOJu0YxM84qbnKkNpsnYA5zp+/lWJRiV3M07O9Bw0KJpXi3mktKyezzW
	uP5UcDmw6NcplVB44TtVLL1yuU5psnk=
X-Google-Smtp-Source: AGHT+IH3MQX+U+JW9QkzvkcAXzqJOjuD9ufE8hcOsXh8BBfQTFadQKi/1H92NOxEWqbqT8JtVOjkdg==
X-Received: by 2002:a17:906:20de:b0:a1f:a0ed:6ba with SMTP id c30-20020a17090620de00b00a1fa0ed06bamr6858816ejc.81.1702838803953;
        Sun, 17 Dec 2023 10:46:43 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e42:9000:b4eb:1338:e451:9de3? (dynamic-2a01-0c22-6e42-9000-b4eb-1338-e451-9de3.c22.pool.telefonica.de. [2a01:c22:6e42:9000:b4eb:1338:e451:9de3])
        by smtp.googlemail.com with ESMTPSA id rf19-20020a1709076a1300b00a1f75d21bf3sm12520534ejc.6.2023.12.17.10.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 10:46:43 -0800 (PST)
Message-ID: <3fd5184c-3641-4b0b-b59a-f489ec69a6cd@gmail.com>
Date: Sun, 17 Dec 2023 19:46:42 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH RESUBMIT] leds: trigger: netdev: add core support for hw not
 supporting fallback to LED sw control
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
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


