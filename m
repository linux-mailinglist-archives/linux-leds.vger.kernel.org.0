Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4A1627C19D
	for <lists+linux-leds@lfdr.de>; Tue, 29 Sep 2020 11:48:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727755AbgI2JsW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 29 Sep 2020 05:48:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727468AbgI2JsV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 29 Sep 2020 05:48:21 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0355C0613D0
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 02:48:21 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id x23so3958104wmi.3
        for <linux-leds@vger.kernel.org>; Tue, 29 Sep 2020 02:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Fdw78sqmIZjRFiiGoYeaH8/l+grtKt5JqjIyTHzrRCE=;
        b=L0x7zsAyjtHZLNzl6I6wyAR3Te0YtIRHzIMQo0zs/HsqKBPDtAyhe/SvzjGENd5o6B
         LD+rqrkV3F3Xg95fgoTFdRiMCHYJD3NwpQ4hCbQ0B1qxTi97Zbvcj9cEXoOq1sZHdoqP
         GMP5wbANsXwzs0BLTvpEJBzFXRG3vAcqLurY6OdO4N+NnJXMsEOwDt7ADgkZF3hl+sgX
         BdlP5axXz4FEZrg/rfolgDMac3EQ81fOOyBxB8WzOHd8K338zi363Jq8UI3fHAYGhyen
         MnRSd1xO3/z2/c1KPfS6lVHiJGo/S4+alOFCAlLpP6ZWC8m9ShM3L0LFYkl8QO+/xred
         qnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Fdw78sqmIZjRFiiGoYeaH8/l+grtKt5JqjIyTHzrRCE=;
        b=cr8fZdsC+CXbThkf8EEYcV7cJuOn+Ssvc//Pbckuu7kbvHRy/J0SrejJKqR2oszPe6
         aSzxacbR9Y8E9Q1IEK10sILPnkNQPcLOJr+4PNIy7bfYfUTk5ChQ1Du6afXu9M1mgafC
         7HMxP2Dx5g8gwsXm0TPdhvYWsrqQwPk6DJcx33uA8vMayJEzR6cxrZRacSF+Pq/+eS0X
         0aL3eiyOAE4boeEkOp3wJDYSGNnMwyIH+QqqAWmg6IZ/+RJQPkXDx4Vym2tfWP9osA2I
         ygY1URxdcs9N9Q/wclzIg+h68TZCJSxygM94w6caJ8AMQRWqvrJMAg9D3d/c7INQvbKA
         FWRg==
X-Gm-Message-State: AOAM530gcCiO8tM8df5wETBWmeVrufqF5GsiABlSSs5sooEk9QB020sJ
        A7IFIsJxiy7gy5RT7pN6jBqHwf6g6Fs0qA==
X-Google-Smtp-Source: ABdhPJy8/VfZsThqju8D1wItGHyjGpjH9KZQIJKAnvUKhpHuo+NezaITAxPGQ1lQHzqDHLCVSBA3yg==
X-Received: by 2002:a7b:cf30:: with SMTP id m16mr3626898wmg.0.1601372900362;
        Tue, 29 Sep 2020 02:48:20 -0700 (PDT)
Received: from dell ([91.110.221.236])
        by smtp.gmail.com with ESMTPSA id p9sm2375565wmg.34.2020.09.29.02.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2020 02:48:19 -0700 (PDT)
Date:   Tue, 29 Sep 2020 10:48:17 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        Phil Blundell <pb@handhelds.org>,
        Samuel Ortiz <sameo@openedhand.com>
Subject: Re: [PATCH mfd] mfd: asic3: build if COMPILE_TEST=y
Message-ID: <20200929094817.GE6148@dell>
References: <20200917193140.5324-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200917193140.5324-1-marek.behun@nic.cz>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, 17 Sep 2020, Marek Behún wrote:

> Build this driver on another platforms if COMPILE_TEST=y. Another
> drivers may depend on this, for example leds-asic3.
> 
> Signed-off-by: Marek Behún <marek.behun@nic.cz>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Phil Blundell <pb@handhelds.org>
> Cc: Samuel Ortiz <sameo@openedhand.com>
> ---
>  drivers/mfd/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Seems fine.  At least on first blush.

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
