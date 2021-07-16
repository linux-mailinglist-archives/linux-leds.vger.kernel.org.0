Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5375D3CB460
	for <lists+linux-leds@lfdr.de>; Fri, 16 Jul 2021 10:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237940AbhGPIgW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 04:36:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237315AbhGPIgW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 16 Jul 2021 04:36:22 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD559C06175F;
        Fri, 16 Jul 2021 01:33:26 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id u14so9242820pga.11;
        Fri, 16 Jul 2021 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X5q1j0paT44yX2vEBK2m7+VzMGiDCsPQaSzFTe7w0v4=;
        b=KBtVbG4c2pdIMp91T9YBKrsQnC0+fWoyMnxR4IeJjxuyZRcZowc/8FnhGw8JHx4TxD
         MXWk5+lmpiiGv6wzfi9tpK3Qm+a7O6lm1jfa0Ux8RXbs3FqH8cdM5J/N+7zXZp9vEsrz
         ahvUkXXtyWF1t3CJD96HkuAZCfCTPw51J6LHy+uh9kXp2VnoKgbnqVjypvdyHzZxMItT
         Fx/49T0EuUHD4cJkl0E4EX7DapilVrjs99omlaXfFon6jNb5kUK74fSMaffsQ+PXaAvX
         opSShv5cnAaJ4NAlL01bANMh/W3GkVgha8P8RVDb9I2XrWpYiDEx6tFag7dpywHrf/+x
         WPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=X5q1j0paT44yX2vEBK2m7+VzMGiDCsPQaSzFTe7w0v4=;
        b=jzU0WEbeJpCV2/1h+XNg1/ng6Dy8njhUYu4TroAUfLkOreiRPYXG9APCh9IVhXyzCX
         rbnYNGG81bBhcHU5Xj4+EarmCs0THW1Jz1VF0hq6J2Nz5fbs8i3khwe93ZfCLdSj934c
         hm9n73ay7xRgtKLdQLJ02oC6CF1ypaUYMcB0gys1kQ+fXqul4uvGHPnr2bZ+graQqBKz
         NtskOJmanZlii9m++ghstqUO+hF0dEhgixOm7k2qX3r4PDYIU/Ek7ipAAQ189n2MXBsT
         LMfD/v6mgtr23vX8MoJ2JNGWwycDLRpzBsvnb6CIr1HqkMR61PIP2XFbDg9ezYP82OnV
         dS0w==
X-Gm-Message-State: AOAM5309IetgTWYOucfcaXmyPShxyFOw1LVA/YmgF/3NPBLCdqz9rclw
        8Upf8pqI3Vjk+kqjyFIulk1SEoR8CKI=
X-Google-Smtp-Source: ABdhPJzB/wadrrjrmtiy7fOXu0qmDMmFUnV/TyKXl2Axja+ylouz/y83MeReqhGaqX6Ep36cSpvI/w==
X-Received: by 2002:a63:f654:: with SMTP id u20mr8895757pgj.89.1626424406363;
        Fri, 16 Jul 2021 01:33:26 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
        by smtp.gmail.com with ESMTPSA id 21sm9425633pfp.211.2021.07.16.01.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jul 2021 01:33:25 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v15 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Fri, 16 Jul 2021 16:17:29 +0800
Message-Id: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 ++
 drivers/leds/flash/Kconfig                              |   13 
 drivers/leds/flash/Makefile                             |    1 
 drivers/leds/flash/leds-mt6360.c                        |  910 ++++++++++++++++
 4 files changed, 1083 insertions(+)

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

changelogs between v13 & v14
 - Move driver to flash folder
 - Remove LED FUNCTION MOONLIGHT
 - Keep 80 char per line

changelogs between v14 & v15
 - Add ack in commit message

