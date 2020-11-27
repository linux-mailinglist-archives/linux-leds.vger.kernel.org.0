Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2CA2C5EEF
	for <lists+linux-leds@lfdr.de>; Fri, 27 Nov 2020 04:29:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731215AbgK0D3G (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 22:29:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727037AbgK0D3G (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 22:29:06 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177CFC0613D1;
        Thu, 26 Nov 2020 19:29:06 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id q10so3294791pfn.0;
        Thu, 26 Nov 2020 19:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=5Rgv32VZUwFhjMObiccjuovgZTw3dAi0BO9MVS0sHMY=;
        b=s8qbI4Cy7S7Uecnh5irZ4A3ADqna0oAGoJ7ZDUN/vODsWdJN8MFz1bUg5HMfzdjQse
         BXloh82EmcS3ARrzTvPbYmh0N7eRliD/AUt+BdMuxm21OwRaZg3pVHquIpE2MYDQ+ju5
         iL6Zg2sBq3iI0RQrhdPdErunvzy4/bP2W3T1j7fpGVK0qt6SmQCwsLOX0xyFRKDnVIh9
         96zVwn6O+HPzyoC6cTYxtsq/bZSf9cPtqKhL9S5KO6rMxyuqbVuZwREWUWX5CGwFa6ZT
         H1wUsWbCFuNrmLOMm01oaW7YYc87yqiiL0Gv+9Sl/LWkJn3btC32a5LVI0fI9pnQFHLl
         4hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=5Rgv32VZUwFhjMObiccjuovgZTw3dAi0BO9MVS0sHMY=;
        b=ueCWsT7I4nrCXnLCKJh+22NhnD2ZXMbKDomJQlzMJC+qdJ0oYhaVLirzB8UgnMEFLN
         tvGk31cXDAHZN7YOa3HHDwG61kW3xpC0zuZdmKBQ1LVp6FsWhd7bDfxz7nSAUREnJQJ9
         Pn5MgbQTl06BIzhwIi0cUFtKpoEKrYxG+38KhZ8rQlX5OJyjtqY+ZpJQzODYIPcLVX3a
         g47J/xP/ry5qtnwZvIlmIFX8R8Nh/1FAfhvHcIo8k2I2j+soYh05+wR4E253meRYiToU
         +mUZFBYLAO1fO5U7hJ53qo9TOLIEpgRiz/arpqufTzoRdVFYzUzW5yVW2hOxWB/ZtEAQ
         SzSg==
X-Gm-Message-State: AOAM532+fbdsqkMQTX/zmX1CtaCeKZs0dZKwqwhz+Zqvr6QPIXo3EPH3
        h9rFLpahombdERXXwSQTZtQ=
X-Google-Smtp-Source: ABdhPJwaSMxuHN2zvV6khR85zt3NEzpQh2zWdKfxVYpuwuNdippLrqPOwhcTdzavJw2iXmmpFBaXFQ==
X-Received: by 2002:aa7:8801:0:b029:18b:5878:30d6 with SMTP id c1-20020aa788010000b029018b587830d6mr5224265pfo.77.1606447745521;
        Thu, 26 Nov 2020 19:29:05 -0800 (PST)
Received: from localhost.localdomain ([101.12.27.127])
        by smtp.gmail.com with ESMTPSA id m73sm6063962pfd.106.2020.11.26.19.29.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 19:29:04 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v10 0/6] leds: mt6360: Add LED driver for MT6360
Date:   Fri, 27 Nov 2020 11:28:50 +0800
Message-Id: <1606447736-7944-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


[PATCH v10 0/6] leds: mt6360: Add LED driver for MT6360

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (6)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor no-ops registration by return 0
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
 include/linux/led-class-flash.h                         |   42 
 include/linux/led-class-multicolor.h                    |   42 
 8 files changed, 1039 insertions(+), 37 deletions(-)

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

