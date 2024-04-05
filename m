Return-Path: <linux-leds+bounces-1417-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A07A89A5D9
	for <lists+linux-leds@lfdr.de>; Fri,  5 Apr 2024 22:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBB0B282FDC
	for <lists+linux-leds@lfdr.de>; Fri,  5 Apr 2024 20:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0D3C172BBF;
	Fri,  5 Apr 2024 20:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGb716Zu"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4B1172766
	for <linux-leds@vger.kernel.org>; Fri,  5 Apr 2024 20:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712350392; cv=none; b=aPZCpibt3DQiw6l4fzbUAU3F/DKYNr376Pgj2sJREL7Aa+8rT+ABLBizVMJIzPYxpt02I602wzE75MAA5kuvb03c6T0vnNIB2VkdbuETxw6Tn1M6W/ydfVSPUZUTHqQjY5H/4HhNoN8zf89NQqxDbhs9rCciR1OztXWdD88/JHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712350392; c=relaxed/simple;
	bh=ZHtJw4O/OcfcmAT7SVssjm77ZuozvRvCyzYnyQzNxwc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=bMFCASgQhPFoot9qI3g++OFlTTP9QBIR5zlccXu+52jjFGyfat8dAVqxOKw17b0X2Nnhda0uFkrWHfq8oW45+ci8sCriOQYBuHsKaY+AD0cxKOyLHLeOw6pxQvc+F4YKiY7Pz2KfiCn2cy/kDqOCFYvrC2snlb7+92LP5Y6IZJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGb716Zu; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so6473341a12.1
        for <linux-leds@vger.kernel.org>; Fri, 05 Apr 2024 13:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712350389; x=1712955189; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTqeqoNIlbi68ICGYQ0O84/JiX1ipYLCjq/fPeB1Xa8=;
        b=NGb716Zuq1p1cbBMWzDYHbkFlwjkUjNR0Zh8eRlmSxj/VMrPeASY8hb1AEHzq3NGJ6
         MvYlilU7hBt3Ht5P4JrP58KdU7pydZ/2YOdNm8mxyQ3ZxCo9Cp6cPUgS1CfM23uJOs+r
         TBUQm7EZIY/Bnys9MO16S76qMLhe3yIJl8HsITi7huLk+I/uviLCzQWmEJWztvqNQTPv
         ph9s/8hmNd6VZMIo9qO2v4F7lTaw+6FnIWXDuzIG2S5OAkUATzhzJqN+6jPk3CzzyHqr
         1GEkQpmQgP4w6jkrlV2SPXYgbxR1UXAl+9q3GROWNi71quq8/MKc0ML+JekyKc7S1LQq
         2LAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712350389; x=1712955189;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PTqeqoNIlbi68ICGYQ0O84/JiX1ipYLCjq/fPeB1Xa8=;
        b=P1kg3UOz2nPUnLvg4Ob/sPMcYq46DA+vrps3Zzwu/1tNJXpzqLxgqbaFMmsj1htneI
         Q0mJxrh64uDEvlZMZE44PoU6W2drJUFgPVTt46nzEtGpaBqHwpbFKzknl+1/jI3aHGDJ
         CxFwiUQdUOXu3kLJ405Mll6729wwXbE40Z/gZGRzpotZFvL1Yk66o0wk95j7XDg+4rrM
         bnSx9IIUOMpXngiKbHWKPE18D5cC9lkbLEOzhiJ8UQCm8fGWuegMjafROduJTY45KqF4
         +NUT7ealn7V6mwuRRBJsdmKZoD95v9CQDVvOcMbblvVQCNJthQqRqNlmG5SiqmfTO/bz
         wWog==
X-Gm-Message-State: AOJu0Ywl1fAlv2iQghRW2k39OaEc9x5WOT0fXl+Dn9ZaTFHSGPCVVF6a
	CnMRf+kKhpfNWN3m5dDKy4Zc4sVlmLV3rif8VhPp2v1wHm2VxfNY
X-Google-Smtp-Source: AGHT+IFIQ4MACBVIxDcwuKS/lOvNs6w/eh038yUZJ4g160L57hBBBpCX1XG6/NVxfzb0fcTQrT5hMA==
X-Received: by 2002:a17:906:f20d:b0:a4e:df0:e9e with SMTP id gt13-20020a170906f20d00b00a4e0df00e9emr2426771ejb.24.1712350389239;
        Fri, 05 Apr 2024 13:53:09 -0700 (PDT)
Received: from ?IPV6:2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79? (dynamic-2a01-0c22-72bb-b200-e0e0-cd27-7a04-5c79.c22.pool.telefonica.de. [2a01:c22:72bb:b200:e0e0:cd27:7a04:5c79])
        by smtp.googlemail.com with ESMTPSA id dr20-20020a170907721400b00a518c69c4e3sm1219229ejc.23.2024.04.05.13.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 13:53:08 -0700 (PDT)
Message-ID: <8dc929e7-8e14-4c85-aa28-9c5fe2620f52@gmail.com>
Date: Fri, 5 Apr 2024 22:53:08 +0200
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
Subject: [PATCH] leds: trigger: netdev: Remove not needed call to
 led_set_brightness in deactivate
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

led_trigger_set() is the only caller of the deactivate() callback,
and it calls led_set_brightness(LED_OFF) anyway after deactivate().
So we can remove the call here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index ea00f6c70..22bba8e97 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -724,8 +724,6 @@ static void netdev_trig_deactivate(struct led_classdev *led_cdev)
 
 	cancel_delayed_work_sync(&trigger_data->work);
 
-	led_set_brightness(led_cdev, LED_OFF);
-
 	dev_put(trigger_data->net_dev);
 
 	kfree(trigger_data);
-- 
2.44.0


