Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3557FDCED9
	for <lists+linux-leds@lfdr.de>; Fri, 18 Oct 2019 20:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443142AbfJRS7t (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Oct 2019 14:59:49 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53477 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726421AbfJRS7t (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Oct 2019 14:59:49 -0400
Received: by mail-wm1-f67.google.com with SMTP id i16so7212635wmd.3;
        Fri, 18 Oct 2019 11:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tZnkkMS8Ppjf38TtJcQbsEMS2EZYYG5QiaTxSNSCmAU=;
        b=rrxq9qqc7DgaH0HdEaOBvv78Dadshyt0uH4Z2FokNryqzqMWRO9eBvltcFm378Xa++
         bwaJgv2+CmHnK4W62vOlGirt6vd3UCbbdZ17FAS7Tnxhlnwmn6t2YgwG2KXuUqv/xh8/
         JWMuZtrDA78BqXBQhp5njd+VT24TGBglgmNqUCNydzutvdXmW1FqwEczsgajwiwItPje
         1xuEjON5lFv9tDjd8ilU5/Gh8uJItE6kxL4/1KehGMCuhIroFz/aqjqNaQ0JB32vMbSq
         aSCqW3xJGB/xwuuw0EmLIAET75ep0kSOzGDGZS4YwKGHTymaRw5Pb2V3rjqLclTaIJi0
         RTUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tZnkkMS8Ppjf38TtJcQbsEMS2EZYYG5QiaTxSNSCmAU=;
        b=On+/kORuJ/FGhBOLJXwNWqSN6F+2ZGF5A69BujmhASFAbryA+MZAAgMbMYYlNN7FO+
         YiOnsX4/wqims0WMMRzMAHSJjU8eiC0/+Chj2xN2DUzHnmrDK+0fpX+V0G+u6BJkeOON
         pwygawzHEd1J69Bw2BW06ySM5UZdWo+KFUw2TkKvjPCeCp7vpEDDwTaDb+qMqYdpRNcM
         41RyMXp9kUqoxVRnKOK9AAIPD1wqZbNGvKKhrFksvnj+l0iMJO5I3/+3MXV+qCJAZ7cX
         rfCZqPJbUtV7L3wvJ/gBVRkFDdy9XGGovd1mClDHIkRKoKrzihQdzNPEMfMsN2XQoOFx
         S2jw==
X-Gm-Message-State: APjAAAXKGP90RfegZxF0zAb4vjUifzFik05fCwfMExvol9VuolJ7vfwX
        m5BshmJGDrIxcPyzz4Kh3Zw=
X-Google-Smtp-Source: APXvYqwOa7xYCv/z3IBAcMPtD7kUb+dbcqrunj0PNN8ffzwuvTxLzcPJEazdIN4Y+Utte6EaBlzaBg==
X-Received: by 2002:a1c:5609:: with SMTP id k9mr8690094wmb.103.1571425187005;
        Fri, 18 Oct 2019 11:59:47 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a204sm8327224wmh.21.2019.10.18.11.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2019 11:59:45 -0700 (PDT)
From:   Florian Fainelli <f.fainelli@gmail.com>
To:     bcm-kernel-feedback-list@broadcom.com,
        Stefan Wahren <wahrenst@gmx.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Eric Anholt <eric@anholt.net>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     Dan Murphy <dmurphy@ti.com>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: bcm2837-rpi-cm3: Avoid leds-gpio probing issue
Date:   Fri, 18 Oct 2019 11:59:41 -0700
Message-Id: <20191018185941.14223-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
References: <1570964003-20227-1-git-send-email-wahrenst@gmx.net>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, 13 Oct 2019 12:53:23 +0200, Stefan Wahren <wahrenst@gmx.net> wrote:
> bcm2835-rpi.dtsi defines the behavior of the ACT LED, which is available
> on all Raspberry Pi boards. But there is no driver for this particual
> GPIO on CM3 in mainline yet, so this node was left incomplete without
> the actual GPIO definition. Since commit 025bf37725f1 ("gpio: Fix return
> value mismatch of function gpiod_get_from_of_node()") this causing probe
> issues of the leds-gpio driver for users of the CM3 dtsi file.
> 
>   leds-gpio: probe of leds failed with error -2
> 
> Until we have the necessary GPIO driver hide the ACT node for CM3
> to avoid this.
> 
> Reported-by: Fredrik Yhlen <fredrik.yhlen@endian.se>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Fixes: a54fe8a6cf66 ("ARM: dts: add Raspberry Pi Compute Module 3 and IO board")
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Applied to devicetree/fixes, thanks!
--
Florian
