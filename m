Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C130C1AA168
	for <lists+linux-leds@lfdr.de>; Wed, 15 Apr 2020 14:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S369951AbgDOMkD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 15 Apr 2020 08:40:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2898147AbgDOMj5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Wed, 15 Apr 2020 08:39:57 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00F7C061A0C
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 05:39:56 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id k21so3515626ljh.2
        for <linux-leds@vger.kernel.org>; Wed, 15 Apr 2020 05:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OqA/8dG2prhVwmEURquZIXO2IdbOBp6zMVqm7AbCTFc=;
        b=Vp/8MwGXc0e5fTRlrQlVtUVBwFVH1iHBXktSu+eA78qp1cOo202eSLWP1hZ2DuzMQX
         1Iup8npwAV30muiOJe7HoScRYaF7yBgVk+MEjmnjqxq7wauPlIvbEIpiTJSuJ1pvGI6T
         FdoBu7ZF5ie02Kkvjb99lsqayDaVTajhK9Mo6nV1TLKEcmNyLo7CsQoP3iVRBSnYMwYj
         KjtQGd5iZSPOfVpcEsJf/w6BRH3tFa7qmRcE6IidZN2U5/zaBmMKgp7PZnZZ4+LfCv5w
         TGOhP5Ir/dQX2sa1ow8dPdcvPY/OI27SaNwtGlx10zLO08Z/rQHIcgCnkjj0wp66+1b6
         bb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OqA/8dG2prhVwmEURquZIXO2IdbOBp6zMVqm7AbCTFc=;
        b=IFfDJrjku+r4K9Xaj7T9r4eh04zj48XBmj7Ayr36GaJY4dV3k6KtfszyejlaeFoZOY
         JnncDIlrsm+3vqmQQa1surjas9g1n55J26CO+Kuvj0MDlHf/ML72X/u+2vXWx/lmoUZG
         qiQYj969pCsBhWqtoRd1VgKGK2zE62y85mBQg+1HIAFS8WO5ow0DzkFuRo9cfOPkaGsz
         gb5zZ/c+An2YKLlVLGPYCUI0oViSGEoaQttLTHU++uko3ztq5soAKJOpxC7lxXQbxEWQ
         cYQN0b/52cC/ye2rK2kIEiRvDmMEVixvsFnMTUhj32av6VvoBSwD9hx4/Uyrn4mQQeUh
         pTXw==
X-Gm-Message-State: AGi0PuajjcDdbJLHUo16WLRpQcEQ+Fx0XnsAyHuiefMRcpSQObw4EbHS
        1av2T7sFN4v1OMjTctunw7MItQ==
X-Google-Smtp-Source: APiQypIfPU+Mrap7+Y29A3LoBrXWPywyZbp5lY9FXPlQqtJNlIWUFgk9/S94isluz0p9HMypQ6INKw==
X-Received: by 2002:a2e:5841:: with SMTP id x1mr3187456ljd.86.1586954395171;
        Wed, 15 Apr 2020 05:39:55 -0700 (PDT)
Received: from localhost.localdomain (c-f3d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.243])
        by smtp.gmail.com with ESMTPSA id u12sm5536059ljo.102.2020.04.15.05.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 05:39:54 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH] leds: lt3593: Drop surplus include
Date:   Wed, 15 Apr 2020 14:37:50 +0200
Message-Id: <20200415123750.114086-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver is already including and using the proper
<linux/gpio/consumer.h> header, there is no need to include
the legacy <linux/gpio.h> header.

Cc: Daniel Mack <daniel@zonque.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/leds/leds-lt3593.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index c94995f0daa2..9079850e6ea4 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -5,7 +5,6 @@
 #include <linux/platform_device.h>
 #include <linux/leds.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/slab.h>
 #include <linux/module.h>
-- 
2.25.2

