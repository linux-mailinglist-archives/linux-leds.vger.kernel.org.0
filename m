Return-Path: <linux-leds+bounces-482-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C9281C0ED
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 23:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7D3F1F24667
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 22:20:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA40477B5A;
	Thu, 21 Dec 2023 22:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6JFy6sD"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A9777F10
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 22:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5534abbc637so1524327a12.0
        for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 14:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703197226; x=1703802026; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bHRh4Zo782phBDfDNmluNamLgss8RWVIYanlQ/IkaU4=;
        b=P6JFy6sDoemz6IrYoySKuCiNuFLXM800EGm/e5MMHrZ5q/TdD7x4OSWVljX0txLO5e
         5wqpkjBEkwcwHs70DZntIUoVeA8wCEInlH++VJzp4lvlyFRduGhxMdM9zBYMS771SlTI
         mh0qW/BZgHCCxj6WWmoU6HRm5Yh6eMumLRJjx9DJluQA8bzgi4rIGiwj/YM7Fy/NIVHf
         txoHbLTN77gLltRAKpuM2fev245aWA6Ec+ga5DCsIAr9UjSewoBtJ1Gdg8/54xYPYSRK
         2p4uRYfKuY1eTiARi8HSokJ8NR5nxtxV+SdSHdTHU+w6JAKa1oQaheTvqlCQdHU6/ynS
         DvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703197226; x=1703802026;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bHRh4Zo782phBDfDNmluNamLgss8RWVIYanlQ/IkaU4=;
        b=wZUcGAVm2YcSrfUQw1Cv53iZncRGGaFcRqE0etHlM7y0vn563G6GYGmrG3Fi+bGPeF
         satKuzJUgojHK5PK2alwjnP5e7f61egwC+Ps1oAMlwrstYwQi7atwOz1zqOyAR4bowkZ
         KpNGO2wBrs7aWMuXgAm1hsmi6hMo+7KSCe+Y3h6dWt1HK1qq6S9WPsgipvUfCj9HbhpL
         63LEOUpcCzEJuefW0Y/2lsX902ppW/20SbllrXJNsoWBsfg5Oqhc/rKKw0c9Zmewgz3G
         CxGZHZvw32jXLpgOyvRZwlysSZzRr4lhKJvW8p9D3vl0pPAWAvRx9UHo0ORB4hXZ/CAo
         1+gg==
X-Gm-Message-State: AOJu0YzUp3PHDfgQ+gO46C7SyszpmWVZVMSihjxd/3D8dk23ad3j2/r6
	+9wy9zOsSLYUjBf78SkX/yVOoFSqAkE=
X-Google-Smtp-Source: AGHT+IEs8aNAiekw9NiElE1W5I1yzVWAEb8zOLKrjOvaVJJPWuJRCR/cTOpnZa0Vw/Pq2K3cmKsBXw==
X-Received: by 2002:a17:906:5186:b0:a26:a631:f552 with SMTP id y6-20020a170906518600b00a26a631f552mr284053ejk.36.1703197226287;
        Thu, 21 Dec 2023 14:20:26 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870? (dynamic-2a01-0c23-b8a5-3600-c010-4b2f-ccc7-a870.c23.pool.telefonica.de. [2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870])
        by smtp.googlemail.com with ESMTPSA id ka24-20020a170907921800b00a26a80a58fcsm1014528ejb.196.2023.12.21.14.20.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 14:20:25 -0800 (PST)
Message-ID: <84a1bbd3-1ac7-4f37-849a-7f4d31698f76@gmail.com>
Date: Thu, 21 Dec 2023 23:20:26 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/2] leds: trigger: netdev: Add module alias ledtrig:netdev
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

Add module alias ledtrig:netdev to enable auto-loading of the module.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/trigger/ledtrig-netdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index 6cbba44dd..2df77825a 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -651,3 +651,4 @@ MODULE_AUTHOR("Ben Whitten <ben.whitten@gmail.com>");
 MODULE_AUTHOR("Oliver Jowett <oliver@opencloud.com>");
 MODULE_DESCRIPTION("Netdev LED trigger");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("ledtrig:netdev");
-- 
2.43.0



