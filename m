Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B04FD2D5386
	for <lists+linux-leds@lfdr.de>; Thu, 10 Dec 2020 07:02:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbgLJGCT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 10 Dec 2020 01:02:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727004AbgLJGCT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 10 Dec 2020 01:02:19 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EEF9C0613D6;
        Wed,  9 Dec 2020 22:01:39 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id f9so3015228pfc.11;
        Wed, 09 Dec 2020 22:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=AzWxFLY7pNZaeT3/xb0mQOVSBc85yc1XVJMoO/4h93Y=;
        b=btBGJnNwXko0u3o32l76Eel7YEXjoyDFa8RM0+X3IeXp+pNa3Ch6hQzyeJzN9TT/Yf
         A+gOWSRu2PF8aDRFLAHSVd4uYi+imtTAwiu2DlrEW7kgLVCF+vhTqLxMoyMpGqRk6XHI
         aj3ykPytUxyEKFHtUIWMdLAIkj6ZfTk3lOX4ABHgzszT122safOjd/iiMaZ/gXR3y32c
         1nfVJL1/Fwp3cAQf1LvzPu0c+gfhFDU2TDRDxlZXKNIdMPuJzK6rF0Ppkv3WEoYYMPwS
         E2Rv9aWRdSr35nbqESK5bW4iSLs/P+BOJPYaUtvbPe6+pL4jkyUIXILPYfc1zdcI/fey
         9k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=AzWxFLY7pNZaeT3/xb0mQOVSBc85yc1XVJMoO/4h93Y=;
        b=Q/CNE1F/u3Ks7qQt6LadlqK/dEuldM6eZFN2mSuY7DqhOiBvDZ1nsIz+b5AOBQ6/XX
         4CRNXFw9fNO6VtPxhGnHuU4+aw2UIKxF/YvZgS9pP0W2PD8qAjCsgZ3dHSevrkBZ2ok0
         QeMxGXW0N/KUn4USR55TtI4LAuZ3jK8AEpgdXb+kP8RNgPX0iScdGKns47fXo4pVMwaQ
         QbKjG1MkTslf5IGUddimOxQTvOgdmpKa3G4JAZftTY3MfbHeoN4aeHu0irdwFuG4DSzg
         DyAP+pfO0sSGBRaQTOMkHWpaHVo8HX4EyAwVXWHJ2Ynbo3YARIJqlyE0nwQfY0ZzXtp6
         ZL3w==
X-Gm-Message-State: AOAM530UHNXyjVZR+Rw7sNNN+ls6Dnut9HOIdzuvAN8yswx6ISk5wX03
        hdSaqcriNzLJb2Y4vVApTFc=
X-Google-Smtp-Source: ABdhPJzsiSmV/F5GXNMJ0EE1mhNhLiUyLcgxJWbJljMbl4eSmJ2tg6JTjzwr+yzn4pnjrykJQYAL7w==
X-Received: by 2002:a17:90b:a04:: with SMTP id gg4mr5911162pjb.8.1607580099216;
        Wed, 09 Dec 2020 22:01:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
        by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 22:01:37 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v12 0/5] leds: mt6360: Add LED driver for MT6360
Date:   Thu, 10 Dec 2020 14:00:52 +0800
Message-Id: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
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
 - Fix print size_t by %lu
 - Fix dt-binding name regular experssion

