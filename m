Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A19772E237B
	for <lists+linux-leds@lfdr.de>; Thu, 24 Dec 2020 02:48:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727591AbgLXBsL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Dec 2020 20:48:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726288AbgLXBsK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Dec 2020 20:48:10 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9386DC061794;
        Wed, 23 Dec 2020 17:47:30 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id w5so689784pgj.3;
        Wed, 23 Dec 2020 17:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=tzHgEMUxRYvZKqB5JDDJlTYF56dY3pbo9pa3hpqmyT0=;
        b=Ab3/L3mcNLH749pYNhvPsW/MYdN3CmkTMilrLXOcN8wv+fd/sv5H3FZsMTSvgkBNYq
         0HCb1af3OyRXTacf6hC7ssOqNleUS5iTIL7f3d7nMWkWnFmZTQ+Bz95TAUxqlPpTlSay
         lHSJLwAqVcAjYokAxOes6+mSIeJJEA+f3qR8XRW8+lmGTEf4wcl+GV3rmp05XbsdS6HH
         H8tRHOFZ8oM+i+0cc3J64iMkElPwrodeMIz8ntEQZRk22+W53LYhsVjpyLsOlxUr7k8P
         /Ge1usTYj5SSizMS9EbKh16fp4DaMO0hRrUfwlyh77QEmBtS0vm0JHx82SVQ/8TAMjVj
         N66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=tzHgEMUxRYvZKqB5JDDJlTYF56dY3pbo9pa3hpqmyT0=;
        b=ptDzs7qO0phOBB1wAkEJQUwS6rOLZj8JsQvAEEum5CDVBobLT7W1UlMckT/RytrJVi
         7HaWyNUCYd8Rkfz703pB3DsXxF/+xG77ia0wRyjKlhFilo0md/iM+Zg98ye/pzZmmgHO
         rABrK0l36myrlDWzQB54hp0Jz6zim9ht3JEk5Ouki1j15MOspR+nzMmf8KyzKo6T5Zbm
         7vNWFKauN42vKb01f5hlgicX0IXjUMyq8HKHPnfR/iIsbfgGgD9G08BIcP2vODBmcUqZ
         BAw9zUldPw8G13O5yvN6Kh+KplYO1LEpby8llfdniYm8nCx4MtabR8J0TC4B+babfGun
         s6QQ==
X-Gm-Message-State: AOAM531gb9mZS3K53TOIWqrieFIt+Ht7SM4R/UzRxbXDpyAR2ZkaBSs+
        8g4GqJkjOPoHDK9TNMLGhlc=
X-Google-Smtp-Source: ABdhPJwcKlgXQ2M9R+IC8gRzixZ8H6fSSw05E4sNNAVfAbUxfs9mlCV8Da0LH5UF0Fy8mRVzzrTmjg==
X-Received: by 2002:a63:4f04:: with SMTP id d4mr27002623pgb.225.1608774450193;
        Wed, 23 Dec 2020 17:47:30 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:492:86cf:7e4a:b265:b394:eefd])
        by smtp.gmail.com with ESMTPSA id h16sm26604516pgd.62.2020.12.23.17.47.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Dec 2020 17:47:29 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH resend v13 0/5] leds: mt6360: Add LED driver for MT6360
Date:   Thu, 24 Dec 2020 09:47:15 +0800
Message-Id: <1608774440-21655-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (5)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor no-ops registration by return 0
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  827 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    1 
 include/linux/led-class-flash.h                         |   42 
 include/linux/led-class-multicolor.h                    |   42 
 7 files changed, 1049 insertions(+), 36 deletions(-)

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

changelogs between v8 & v9
 - reuse api in flash and multicolor header

changelogs between v9 & v10
 - add comment for reuse registration functions in flash and multicolor

changelogs between v10 & v11
 - match dt-binding reg property comment to the functionality name
 - remove exist patch in linux-next
 - dicide multicolor channel by color definitiion

changelogs between v11 & v12
 - Fix print size_t by %zu
 - Fix dt-binding name regular experssion

changelogs between v12 & v13
 - Fix kbuild test rebot build error

