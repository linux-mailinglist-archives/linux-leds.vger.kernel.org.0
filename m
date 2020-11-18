Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DFE02B7BB5
	for <lists+linux-leds@lfdr.de>; Wed, 18 Nov 2020 11:49:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726596AbgKRKsS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 18 Nov 2020 05:48:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbgKRKsS (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 18 Nov 2020 05:48:18 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72A62C0613D4;
        Wed, 18 Nov 2020 02:48:16 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id r6so848418pjd.1;
        Wed, 18 Nov 2020 02:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=g2A3s17Ye8BDh9Fc+sUSVuSA9T79VLMzyJbnNNbmIfQ=;
        b=QS/0iyG2/W0EDHf7nKT/USCClf/WPG2j00cYYEruaImBh1uXdjpaGAPIZEdP/Xok7y
         mZVHjjf2URHw3dey111sWlSxj7ctKUjRbaZ0MuNET66soqQLm5x/HIvsWSrglJ7WEeaG
         57dmu+3mxV/euEClfekJ5BgvkscDmRD9ahyeKklmHAM8XlM4yr/lAjwwZ9tfjEYyc0aT
         ybpc5JM/uBW2sMwVVDQlTSDtLWtEgUN5TX6NkNG2aY0zcFEPByXOz7PYyxci3gpBvVCD
         qe3sS5/FXf2vOjlh8dEea6ipkfiUntjkpXz39KZW+vNCUFX6F2FAwoGIJ0PZ5L8xFHM2
         QGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=g2A3s17Ye8BDh9Fc+sUSVuSA9T79VLMzyJbnNNbmIfQ=;
        b=cTjo1PXPwTiY4Gr9lElQObCORH4yceoc15FWw2GdJUDjuwp3bwjWhQP1chZQWDwu+F
         dG+wcnzCv+KxpL3DHOnQiegIM0a9CDyc4RyJVnKl3ISu8DCkmljl0vU1lCHIs528inOQ
         oT84NMc7NbKfnHWNCuddJyGuD95mTgpQj3ofDKRf2uhV0qQQaCZgHsWiUEyoR6LzOUuS
         sTSeFjoCcca11T1mKAuQsRUAVavmeNHlKhsJu9t9hK+6DHTPQBk8K3UZfT8/IitikRr3
         Q82XlhcCjCKrcfas9XpygxxuIMJRs6mt0xZ0aeoM09aHTVSlIvdsFMNNnH/EnH4vevPQ
         FOlg==
X-Gm-Message-State: AOAM531rXawOwiAjdbUS569Mg5AmaSmnUMgZbtq0zzAVbQwT4Py6Xd0b
        EQ+hgoowbrS9Xk6DesY1huw=
X-Google-Smtp-Source: ABdhPJyzF/QItXUyTDu+k1QY3PlQWpE7hAtbHX+unKcUTHEGfuZ+KeWKN4LiKVykhuWHbDVW7F1iSQ==
X-Received: by 2002:a17:902:6ac1:b029:d6:c43e:a42d with SMTP id i1-20020a1709026ac1b02900d6c43ea42dmr3931895plt.21.1605696496004;
        Wed, 18 Nov 2020 02:48:16 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
        by smtp.gmail.com with ESMTPSA id a3sm25345154pfd.58.2020.11.18.02.48.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2020 02:48:15 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v7 0/5] leds: mt6360: Add LED driver for MT6360
Date:   Wed, 18 Nov 2020 18:47:37 +0800
Message-Id: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In-Reply-To: 

Gene Chen (5)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/common.yaml      |    2 
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  164 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  808 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    3 
 include/linux/led-class-flash.h                         |   36 
 7 files changed, 1025 insertions(+), 2 deletions(-)

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

