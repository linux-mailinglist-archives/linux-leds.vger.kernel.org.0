Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE9403D2DA1
	for <lists+linux-leds@lfdr.de>; Thu, 22 Jul 2021 22:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhGVTos (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 22 Jul 2021 15:44:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhGVTop (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 22 Jul 2021 15:44:45 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D866CC061575
        for <linux-leds@vger.kernel.org>; Thu, 22 Jul 2021 13:25:19 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l6so4069572wmq.0
        for <linux-leds@vger.kernel.org>; Thu, 22 Jul 2021 13:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bWOglEXneCe0PHtfAi6U5rGAZdENzuqXwwNQPu+6IxA=;
        b=E1Jj7yXW5K+FXmgOkFcIKpMpgi1h33D+471tj8iUWmfCyqF8ujyTALiqzXQAuR1cPv
         zfScK8CrNNuWMWyOFe26eT0Fhuuiz1+BxHNBjLYWaF7VqM9r6ziRhcK9pKsw/h5qxYR0
         LqkwdKWLOvOacfMO8RfBRJP4HhH6m1wEupv+lY5ndsU90uYDUMsvO5P1NrbysdV3Obz7
         mLRL+Zs1xA7Px/kqQXvhV3llLi/P7GERB26WxkNNOYKK//UfL/L3duPsvZKGOp7bmc/E
         ZEzldflHUDasV9J+K+BhvsL/fGZrPcvOgLA3A0Su8FEI3ku9Wnm5IeJv+mEU7vwHFyZf
         LPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=bWOglEXneCe0PHtfAi6U5rGAZdENzuqXwwNQPu+6IxA=;
        b=fzMVamCABUcz4AmUsZqcMU7JeVolQs/ZTITzB8aQNTxDPJmQ6C8N9jLyipqPzqZx1l
         PNUiy1PDJZX5lq59imEAmJfbQsmohUJwDTNmUsJt+ReHq86FHSRWAVeIeEbIwK/eK23P
         bjSpV2tz85wWeXdEwwcZp/GXz0OKAvQ/OZMa50EzJsZeku8jcRo6TgrPPV8jtzsyyCfy
         LKbIkPhogwmCjJfvzuYf7c9yq3TZZBRDKLuJQ8R/D2OkKshQoDChbNao+mjiKN5PiKjw
         G4XVj+q4Sckr3MfYnPQ+SHoFQQtnsjtaVM5cG/ik8POo2nZ/IHjNG2xxHmBVjiayqCE2
         f6Dg==
X-Gm-Message-State: AOAM531tHzM7wY3rpGSZpb7pJl2LNKIHkQ9FaynvyWDuUfX9j+TADZjn
        EkOS4N9vQyrrYHPY0zgj8hJO3hE+ORs=
X-Google-Smtp-Source: ABdhPJwjn+71sF12LFhtLhsfZ2sHko8ZYN/L98pDCPnwqJ1f0qEHOCnMLDUi001SXsmaMaPda9PJhQ==
X-Received: by 2002:a1c:7e53:: with SMTP id z80mr8037526wmc.153.1626985518257;
        Thu, 22 Jul 2021 13:25:18 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f3f:3d00:5025:6a08:c954:44d4? (p200300ea8f3f3d0050256a08c95444d4.dip0.t-ipconnect.de. [2003:ea:8f3f:3d00:5025:6a08:c954:44d4])
        by smtp.googlemail.com with ESMTPSA id a7sm20894730wru.67.2021.07.22.13.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jul 2021 13:25:17 -0700 (PDT)
From:   Heiner Kallweit <hkallweit1@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: [PATCH] leds: Don't emit brightness set error message if LED supports
 hw triggers only
Message-ID: <f80b57aa-a542-1d6b-50d9-6de0520f2871@gmail.com>
Date:   Thu, 22 Jul 2021 22:25:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Working on a driver for specific network LEDs that support HW triggers
only I got error "Setting an LED's brightness failed" when switching
to a different trigger. This is caused by call
led_set_brightness(led_cdev, LED_OFF) in led_trigger_set() because
both brigthness_set callbacks are not implemented. Let's suppress
the error message in that case.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/leds/led-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 8eb8054ef..1104a7f0a 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -130,6 +130,8 @@ static void set_brightness_delayed(struct work_struct *ws)
 		ret = __led_set_brightness_blocking(led_cdev,
 					led_cdev->delayed_set_value);
 	if (ret < 0 &&
+	    /* LED supports hw triggers only, therefore don't warn */
+	    ret != -ENOTSUPP &&
 	    /* LED HW might have been unplugged, therefore don't warn */
 	    !(ret == -ENODEV && (led_cdev->flags & LED_UNREGISTERING) &&
 	    (led_cdev->flags & LED_HW_PLUGGABLE)))
-- 
2.32.0


