Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 56F4A2C3E77
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 11:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728444AbgKYKvY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 05:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728006AbgKYKvY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 05:51:24 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E88CC0613D4;
        Wed, 25 Nov 2020 02:51:24 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id e8so1959792pfh.2;
        Wed, 25 Nov 2020 02:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=U/iwZD03hXqRuahzCXPW08p4leGFA6uirf6+jymbgcQ=;
        b=OmbF/JUdzm0+Ntw0wBAL+5B3szxFZbwVTg+ROKZoFzldL24Vhw0tfnFFcTe1Rc+BMN
         y0tqHB1m6nkYQ0SDjnwDiKm3ksLCWmFBJcoqP7lZYE1Tgj0OlYetc1fus0tXSYOfXxVv
         HPSTCF8iQq2vQZLaDoWIeFZUyK8Z/8Ee42Ae6t2WbUyX4BRAsppF8j/7Yv1Xh5h4lM0H
         U4r1MivMnmu1CYmciKJ5nULllnQhBp+3vgN0QUhBDWWj5nT7WcFZ1XcXooa4ZB6mSI2n
         cEKRqEq1fzHxfmXGGl0vPEeMs8zVLrJ5wiR5SerYllqZM03uMmTEas0x8M5IZofK38on
         v24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=U/iwZD03hXqRuahzCXPW08p4leGFA6uirf6+jymbgcQ=;
        b=O4g10nRUb1pT0rV4lTBeT4Pc3tWAWmPLFDVm2xosFE4+GhmBn8IXKwLqcLPyfSKwda
         rfyiDERTqZ7/JaMNpykVSJcTpEturW/RGOlR0SJdiH9vc7FjCm7bEaXJpg63kTR7pOM2
         oGyIqA7Pum4lgTJCpLjgHs6duzjuw6U/xo8nkLSjYQertuYDF1PW3hZZs/Gpwm4K+gic
         /38u71n/PoPJPtg7VMszdItO3sSnnQM7gAvf6V6RzU3zXG5P85o1zzmeRkHg8zw5nUQN
         ckomj9EUePRKn0RzvtHx1cW53oLjh5KT10LP/iGnAOWoO2GAbjSMzDx0f/W4v6HWKfS3
         J4tA==
X-Gm-Message-State: AOAM532T9NAoECMWuSrAf2/l7aZFM9qOAQM5co3A/iGbIm+r35CGIBwu
        KIantyzgR5xHq4iYz8rvdDc=
X-Google-Smtp-Source: ABdhPJy98VvQwRIYC9G1ew0v3JZ8r1JC9RxnrL1Mr+34Go7K8DlC6YK5rutFExMnX7fHYy2FmUgk+g==
X-Received: by 2002:a63:d1b:: with SMTP id c27mr2625241pgl.25.1606301483890;
        Wed, 25 Nov 2020 02:51:23 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
        by smtp.gmail.com with ESMTPSA id j10sm2049520pgc.85.2020.11.25.02.51.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2020 02:51:23 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v8 0/6] leds: mt6360: Add LED driver for MT6360
Date:   Wed, 25 Nov 2020 18:51:09 +0800
Message-Id: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (6)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor registration no-ops by return 0
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/common.yaml      |    2 
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  164 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  811 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    1 
 include/linux/led-class-flash.h                         |   36 
 include/linux/led-class-multicolor.h                    |    6 
 8 files changed, 1030 insertions(+), 4 deletions(-)

changelogs between v1 & v2
 - add led driver with mfd

changelogs between v2 & v3
 - independent add led driver
 - add dt-binding document
 - refactor macros definition for easy to debug
 - parse device tree by fwnode
 - use devm*ext to register led class device

changelogs between v3 & v4
 - fix binding document description
 - use GENMASK and add unit postfix to definition
 - isink register led class device

changelogs between v4 & v5
 - change rgb isink to multicolor control
 - add binding reference to mfd yaml

changelogs between v5 & v6
 - Use DT to decide RGB LED is multicolor device or indicator device only

changelogs between v6 & v7
 - Add binding multicolor device sample code
 - Add flash ops mutex lock
 - Remove V4L2 init with indicator device

changelogs between v7 & v8
 - Add mutex for led fault get ops
 - Fix flash and multicolor no-ops return 0
 - Add LED_FUNCTION_MOONLIGHT

