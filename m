Return-Path: <linux-leds+bounces-480-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B04E81C0E0
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 23:18:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69227B216CE
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 22:18:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C883577635;
	Thu, 21 Dec 2023 22:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iettXVdk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466CA77B5A
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 22:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2330a92ae6so163210166b.0
        for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 14:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703197094; x=1703801894; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+HmNsa9++S8Ide5uEHjFOJEQkXr7Onogm6DQgSUy/E=;
        b=iettXVdkwAg6AUuYhKDqX3AAE7z78e388rTGLOLZfJcz+bukXgxe+ay11vma6BMiVj
         O4pua9INIPlkBCurRUfOef7atE2UECxbvrwvA0FKP+i2myyiByjwCpw0b7UiaL2oysha
         bI/Wss8wYaCNVRSAB2RbnGe7Rn1oGzgJrfqBAsMGfUaI/fJYh0DilvW98Oxt+Qa64SPh
         ikvZ72L6c3+UNyzqGvyCKpPNmdLmslaxPvNBUJ6G0wzqqWmZPV7pScRsSV4beDbsciNl
         4MWw+FKjSWPfxab+pZCb3tr3wguhXztK+QeThFtC4FIevFUhYdoooIj0Fzx+fKwN9WPE
         nP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703197094; x=1703801894;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6+HmNsa9++S8Ide5uEHjFOJEQkXr7Onogm6DQgSUy/E=;
        b=aGfbA9q3qWNl+ubFxEWYmiT0ItKi08yadGj4u3VNJOfQfXcSkuVoOrf6ZMK8Op33GS
         bYJhA3ZD7UZO2IkKYUw3TOTMLaMTs8h5CiSvM+kEQwX8mB7zawYXcvTmntsdZgNpyTSC
         t3rgCK7gkpU3B1pbu68Bp85EoQts+Y4h09gXgX4rjbugKtXti3ZjouoWS+TaYmLpvBby
         8Bh5KG7sfE4GKRvNt27Lq1NX+Z5eY+haTN+J50nt+5f0T8KLu5ogw6/aDNEs58vXOYhu
         Sd/xk+Uh4ZigpV/aNIZy/imXD9tzsfm9oSKooA6Iwt1p2mH8CRPWg2zUsItZDrRX1a6x
         ydNQ==
X-Gm-Message-State: AOJu0YxXu1NW7KTj2r5G+zWVFdLvfSkXtF4TSZYa9J2cCYBvKqbrT7p/
	QXDt7MxOXNMuSyQvqmhDydo5jIMw9gk=
X-Google-Smtp-Source: AGHT+IEXIyVJFjC+DknQbyfwFgNQGmVRJcdRNQtlwSzr3gpzGFpXDLw1ocAzGU52SgNHOYSVAbVy5g==
X-Received: by 2002:a17:906:a38e:b0:a25:f5dc:cb24 with SMTP id k14-20020a170906a38e00b00a25f5dccb24mr239291ejz.145.1703197094295;
        Thu, 21 Dec 2023 14:18:14 -0800 (PST)
Received: from ?IPV6:2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870? (dynamic-2a01-0c23-b8a5-3600-c010-4b2f-ccc7-a870.c23.pool.telefonica.de. [2a01:c23:b8a5:3600:c010:4b2f:ccc7:a870])
        by smtp.googlemail.com with ESMTPSA id ka24-20020a170907921800b00a26a80a58fcsm1014528ejb.196.2023.12.21.14.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Dec 2023 14:18:13 -0800 (PST)
Message-ID: <72c8b297-72a9-493e-a8fa-cc37ee460cf1@gmail.com>
Date: Thu, 21 Dec 2023 23:18:13 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/2] leds: trigger: load trigger modules on-demand if used as
 default trigger
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Even if a trigger is set as default trigger for a LED device,
the respective trigger module (if built as module) isn't automatically
loaded by the kernel if the LED device is registered. I think we can
do better. Try to load the module asynchronously by alias
ledtrig:<trigger name>. This requires that such an alias is added to
relevant triggers. At first do this for the netdev trigger.

Tested with the recently added r8169 LED support using the netdev
trigger.

Heiner Kallweit (2):
  leds: trigger: load trigger modules on-demand if used as default
    trigger
  leds: trigger: netdev: Add module alias ledtrig:netdev

 drivers/leds/led-triggers.c           | 9 +++++++++
 drivers/leds/trigger/ledtrig-netdev.c | 1 +
 2 files changed, 10 insertions(+)

-- 
2.43.0


