Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D858D41587E
	for <lists+linux-leds@lfdr.de>; Thu, 23 Sep 2021 08:55:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239406AbhIWG5K (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 23 Sep 2021 02:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239358AbhIWG5J (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 23 Sep 2021 02:57:09 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918C7C061574
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:38 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id d13-20020a17090ad3cd00b0019e746f7bd4so1029933pjw.0
        for <linux-leds@vger.kernel.org>; Wed, 22 Sep 2021 23:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmWq9SbwrmVcYQXqbOudIpr4L0AR6cg4qMF13tN786o=;
        b=On0oxMzCr2gt/8NejZK3kYR/EO3dvskZYTlcGLu8gDKR+DnZf5k5y/rjK6myt08FKq
         E8B27+oFGcZ7XXAlkmpWzHn3vdIEgCmbuGuugm1fhOfqg6+JqaZAYM7H8WKsegqpGtt4
         1hOCHLvJkXoe3t/Ct42W9nKgIXHq5uXAZmYmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AmWq9SbwrmVcYQXqbOudIpr4L0AR6cg4qMF13tN786o=;
        b=SR+4fr6vGC6ysq+pI4TkcAe+/ndrbr8ZDoQ9XSQkF19UXiOAnJveEY92IFQd4a/IX5
         lS7RXELVkySjdyOcUebNJi6EQX9YwaMaJ6dSgRrYnCZdtClyuy8V5/zrLbcFgJmOGDU0
         OZQg3yQ+mLNFc9O6vm04K3wUzP9C/b1z3pYRqqjJumoB1Vz2Vrl/gIFSCCgwYPs/8LVz
         q63FGHYAKEVVN3GRxXJz32prDSRbXlc5aCiDOlnuod3hPVWCtVZHESm/b1s1ExpV/mRK
         V7d8WJAi5Dk8Hq8txCKmJjkq1rHcBymub5Ykn03tBOvaSuuFRj+6AQZl+nqMG5BG/dIO
         o1eQ==
X-Gm-Message-State: AOAM531vIvpZiGkXdNRObbRQz0YrjYSvJneMqYUE8gqoGY6sGOJO/Tgs
        Vm1nYgo+fnEAeB1QCyJca31YDQ==
X-Google-Smtp-Source: ABdhPJzwl9SAOMvhQ9teA4ReWM9oVUM2ZPM+DZVNLVyVCtjew7NBoOmLZS6RHuD9OjQuNz8J5ui5zQ==
X-Received: by 2002:a17:902:7882:b0:131:2e12:c928 with SMTP id q2-20020a170902788200b001312e12c928mr2876342pll.74.1632380137887;
        Wed, 22 Sep 2021 23:55:37 -0700 (PDT)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id e12sm1581888pgv.82.2021.09.22.23.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 23:55:37 -0700 (PDT)
From:   Daniel Palmer <daniel@0x0f.com>
To:     devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        robh+dt@kernel.org, pavel@ucw.cz,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH v2 00/11] gpio: msc313: Add gpio support for ssd20xd
Date:   Thu, 23 Sep 2021 15:54:49 +0900
Message-Id: <20210923065500.2284347-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This is a little series to add a compatible string for the Sigmastar
SSD201 and SSD202D to the msc313 gpio driver, add the specific offsets
for the pins on these chips, and then a bunch of DT wiring stuff so
that the LEDs on the M5 stack unitv2 work and it can control the
power switch for the USB connected.

Changes since v1:
  - Add a fix for the led binding to squash the warning about the
    activity trigger in the unitv2 dts.
  - Fix up the regulator node names so they pass dtb check

Daniel Palmer (11):
  dt-bindings: gpio: msc313: Add compatible for ssd20xd
  dt-bindings: gpio: msc313: Add offsets for ssd20xd
  dt-bindings: leds: Document "activity" trigger
  gpio: msc313: Code clean ups
  gpio: msc313: Add support for SSD201 and SSD202D
  ARM: dts: mstar: Set gpio compatible for ssd20xd
  ARM: dts: mstar: unitv2: Wire up LEDs
  ARM: dts: mstar: unitv2: Add core regulator
  ARM: dts: mstar: unitv2: Add io regulator
  ARM: dts: mstar: unitv2: Add DRAM regulator
  ARM: dts: mstar: unitv2: Add wifi switch

 .../bindings/gpio/mstar,msc313-gpio.yaml      |   4 +-
 .../devicetree/bindings/leds/common.yaml      |   2 +
 .../dts/mstar-infinity2m-ssd202d-unitv2.dts   |  46 +++
 .../boot/dts/mstar-infinity2m-ssd20xd.dtsi    |   5 +
 drivers/gpio/gpio-msc313.c                    | 266 +++++++++++++++++-
 include/dt-bindings/gpio/msc313-gpio.h        |  71 +++++
 6 files changed, 389 insertions(+), 5 deletions(-)

-- 
2.33.0

