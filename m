Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134932DFB2D
	for <lists+linux-leds@lfdr.de>; Mon, 21 Dec 2020 11:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725811AbgLUKwU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 21 Dec 2020 05:52:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725807AbgLUKwU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 21 Dec 2020 05:52:20 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27117C0613D3;
        Mon, 21 Dec 2020 02:51:40 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id 11so6243330pfu.4;
        Mon, 21 Dec 2020 02:51:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=cPuxQSxzMWTU2G1K91YlflotqfV+c7j7rgRMPeG1ygk=;
        b=WYnpvh7A2/BU+oA+5c8Nxu2JyYVuDR6Z1fIOfwq5Oyejckp1lr9LLxg9neN2XsG6AB
         3ApHJuCK9wCpFmaUEe02e3InMRpO7KWbAkn2wK7Agqz3LaJ8BY0EaPrYnwWRVGobSG6H
         Jk3C9cjzOwqrVC1imhwsXAl6SQKijAwYmItvnyZb0QRaj9HZrAC2GZ6ikKvHnHWj1ofN
         aoBkgRVOo/lSmOd6r0sP/DgdX2XgFcZT6cCNI8EuqS/0j4KOIhmOpdkqoUCGiEUGTPIe
         +XKNGxG77LSdTVspNT3y1oa3JeIT/9Bjabcq0Ph/qbkNJGkcXx/LDmmehc5/usIA3aFU
         TkNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cPuxQSxzMWTU2G1K91YlflotqfV+c7j7rgRMPeG1ygk=;
        b=sTlJRDCuLMpK1Z+XIg3qS+SDoqpSOSwaLwln2ry3Z9lNAgrop7Nk9dxK3OzaSupitH
         GiqtA7l9qKld5RG31Ny7xFJ6khcNCWHx2WaQMQuBLGz92CAirs9OVP8gH5ktCYqHGvu2
         /6I+tgvi+jNx1AEXUceJdPWngBNio8Qh2wSDkmuYhX0Auajp5GGPmnGkFpUTJOa7gzdI
         xIIUE6GMede7RXf7ZF5G6wwafZ/QiCq5Ra5ja7ajTQzPeqXEoFhO/8jP8UzSSTJgLO/v
         2EEWgmwAbwXbkV0huiNDvXIWaUKLwvQLMniuizl+V4tirjLJC6GEkQ2SOQqbVGbTz1dU
         EVzQ==
X-Gm-Message-State: AOAM530sFxgRHj17/em8X63/mUycOhVf5TvbW2hT/hsgiyFrPzOu4orW
        RkuSArbnWoDNcv09HRAL8Qk=
X-Google-Smtp-Source: ABdhPJxtHBxoAlxeEaEjorEwBwekb6hvbRDr+kStQjV9g5bdCHeXCa5ZJuN0mINxC067EQlz839/yA==
X-Received: by 2002:a63:d855:: with SMTP id k21mr3814934pgj.399.1608547899772;
        Mon, 21 Dec 2020 02:51:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:469:a113:4308:e075:646d:7374])
        by smtp.gmail.com with ESMTPSA id p4sm15364193pjl.30.2020.12.21.02.51.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Dec 2020 02:51:39 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v13 0/5] leds: mt6360: Add LED driver for MT6360
Date:   Mon, 21 Dec 2020 18:45:49 +0800
Message-Id: <1608547554-6602-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In-Reply-To: 

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

