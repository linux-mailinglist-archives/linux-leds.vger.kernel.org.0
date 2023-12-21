Return-Path: <linux-leds+bounces-481-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF5C81C0E6
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 23:19:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F7531C2313F
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 22:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB6877F18;
	Thu, 21 Dec 2023 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esKtZbNW"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B01B77F16
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 22:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2345aaeb05so150146666b.0
        for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 14:19:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703197157; x=1703801957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6f5RR57fd+rVIkWUHnyOwy0C3qohp7kmcKzK4zmzKuw=;
        b=esKtZbNWxl/mZDqM/BhYj4YHpsUYms9rcqtgwkdQJo9/lNR0zNDipenDIgBCPJZFUW
         F8PAPBOjvCUU//AXjFcGw+pZeZSfm36ai60Y1pHSfn0adfHRNKW+pDakqDLudGP5wv7b
         exb9b2HW6trjrM1P38DIpc/mTCpaqNJRZgusTjSfwjOy5mTFKMRt9Zp2lXozQC7k0S2Z
         UZVCDaRYAc8RC0/29SlKKO3/vnc1VL1MuX48fLe3UZBxOSq4ihfaMJshJtx6+DJ0na1u
         vztL+ZnYkjHdWtQNAdekJhfP16ASblPz0LaxIdNpNkkJdGnhs7ko5rxNyYmU5R9UkgnW
         aF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703197157; x=1703801957;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6f5RR57fd+rVIkWUHnyOwy0C3qohp7kmcKzK4zmzKuw=;
        b=DWdfgWtqdXOPnCiX4iOGMCcbmn+pmVwF57pnnuo/vaFylx1W6oNPYsn7yN1LfR+Wup
         EYL2vCQ+APSijrPnNqLQeBy7gD+epk9VQVsneokbuypfsvtkzmuLVIGptyrjpXQPmsJk
         ibNHk/tKszg/5hlPcyS+dA5sIBrzRBKWVsBoCOXBLE4TekE/M5wWm9EZDRR2dM+3oIUE
         h+CKHBE8Gf9F6CBThmahYqBCiljUi7i+TWsyEC+lWy27yXNTVNCdf0n3OD8PZrgIFcjE
         krx+QH7DJXblbrqSu8nu6G0jKkrrA3O+YZO7sDHNod/DoLvXTe/zjyiPDZ7KRHY2EebI
         Jlmg==
X-Gm-Message-State: AOJu0Yw1x9ffCT+ZtV39Wscb5HJD6mBb7e3KHbN+r4mYQ6SUXxBkj5G/
	0nKhWYL+DFDYG4N2y1uOFjWXjeBzJVg=
X-Google-Smtp-Source: AGHT+IGcWkV5/pSf7LPYL0hxdv4OKfTPka2DCx+RKbV6EEiAncE1tnKH994/WcL05UTlHcBAHHZBhA==
X-Received: by 2002:a17:906:da:b0:a26:9b41:3f8b with SMTP id 26-20020a17090600da00b00a269b413f8bmr247173eji.101.1703197157508;
        Thu, 21 Dec 2023 14:19:17 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870? (dynamic-2a01-0c23-b8a5-3600-c010-4b2f-ccc7-a870.c23.pool.telefonica.de. [2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870])
        by smtp.googlemail.com with ESMTPSA id ka24-20020a170907921800b00a26a80a58fcsm1014528ejb.196.2023.12.21.14.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 14:19:17 -0800 (PST)
Message-ID: <79adb260-06ad-443a-a68e-abe4498c3298@gmail.com>
Date: Thu, 21 Dec 2023 23:19:17 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] leds: trigger: load trigger modules on-demand if used as
 default trigger
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
References: <72c8b297-72a9-493e-a8fa-cc37ee460cf1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <72c8b297-72a9-493e-a8fa-cc37ee460cf1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even if a trigger is set as default trigger for a LED device,
the respective trigger module (if built as module) isn't automatically
loaded by the kernel if the LED device is registered. I think we can
do better. Try to load the module asynchronously by alias
ledtrig:<trigger name>. This requires that such an alias is added to
relevant triggers.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-triggers.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index bd59a14a4..71cb0aee5 100644
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
+		request_module_nowait("ledtrig:%s", led_cdev->default_trigger);
 }
 EXPORT_SYMBOL_GPL(led_trigger_set_default);
 
-- 
2.43.0



