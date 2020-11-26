Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3A2A2C534A
	for <lists+linux-leds@lfdr.de>; Thu, 26 Nov 2020 12:53:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387541AbgKZLxE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 26 Nov 2020 06:53:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387504AbgKZLxE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 26 Nov 2020 06:53:04 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2042BC0613D4;
        Thu, 26 Nov 2020 03:53:04 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id t3so1545530pgi.11;
        Thu, 26 Nov 2020 03:53:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NB+hgipCPxO33R/oYTaZ2+/pLeRXsls+8i2W5CCQlic=;
        b=rOn0dxA51INWEnuKSagvPNzYlpdrzneszl/wskmyYiHXKCmxBmwmtLkeF0QiS83U8+
         jZK8NA1Ai61bqtsL8jOa5T8FBzUhHeJk7jezzWuOdFEeWOxEp0E9+5C4f5xiVvNZvFWy
         IvqgZU1JPoI9Gp8D2Xlw/y9qGNzYAtT6582pTEpfitmXzzvzsyNOY0C+b1j7mB+PHtFW
         IFwP2xxsCmcESQGIYVO4X7brWGrDyddQYuB1sVDdQgWSfMHxjynER3ytoydGx5YimljD
         cy2q40LWCON4pNQK4m0E//kHylReXgGPnoMdGHs3mnwpdet2xRyJtBhjAiOmbAUp2urP
         fYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NB+hgipCPxO33R/oYTaZ2+/pLeRXsls+8i2W5CCQlic=;
        b=A36+r4SrpDhqTHjVQEGC4yz7jiayudnPiOfKnWEI1D1iyd5HtzKccl4vm1emIyO2n2
         yamywFQ2kcAgwwC/ByZBK54UVetydHQFCnAZG2sB8zO82RV3OU0CxBhzTeMOl/Ykdpeh
         Mkb6humLs1KU63YIETdt2EUl5xBHnRJV2vSbBGIHqBhnwr+uY+yxAXaGGjKRz3JuyCPt
         A60g91xbNAu7SSwgWlLA9+GUwZmKnBwCUKEYyxUuwWyzwafUQAf0p1BeQA2WuJ1qcRZ+
         ay7xpfkin8GtjEaUoi+14mxULV2GMKQqrecj9Num0kI5TOdPpGLu196VhfbEg9MNdUyY
         eHfw==
X-Gm-Message-State: AOAM531//R+W8QaXc+YJ9KNTB8pAoiwddBFvR4zul5akjbdblzqwrsZb
        jfqhzW9NLvMvilvbrg7Yipg=
X-Google-Smtp-Source: ABdhPJwI4qEZTwkiIzlmjBp7u3mUWxJmwVlkf8Qv2IMVV4FtZaxOg35VzCo7nPoGVxyDmT05TH7fVw==
X-Received: by 2002:a63:2885:: with SMTP id o127mr2265597pgo.391.1606391583571;
        Thu, 26 Nov 2020 03:53:03 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
        by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.52.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2020 03:53:03 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v9 0/6] leds: mt6360: Add LED driver for MT6360
Date:   Thu, 26 Nov 2020 19:37:28 +0800
Message-Id: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
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

