Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA062CBAEF
	for <lists+linux-leds@lfdr.de>; Wed,  2 Dec 2020 11:50:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729531AbgLBKrk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Dec 2020 05:47:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729465AbgLBKrj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Dec 2020 05:47:39 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 021A0C0613CF;
        Wed,  2 Dec 2020 02:46:59 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id e23so828287pgk.12;
        Wed, 02 Dec 2020 02:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=sxwpW4/HVr9IelDA6cDLbeJJnX5WGx+OvjI8RRJKBVE=;
        b=tFNnhNscDh6wGQvdD8bV2PLbX3vfebe7dPJcVpXpVRPp/bPhBdJKVrHJqvwNpTZOjt
         U8+nTrwsAGhNT86JL8thxhbduqIN97ajS4drnOpNkJuhnD1CKrTFruvQSSTZpzMOYc+b
         ABFmuc6w4XxNYiNe1AWk5DlKLG46hyiDg8/M7zl0+srje5QZuuf0A8hzn3mu8yUMSu3s
         fwUSa4Oz+AJ5uFahoBdOcEiMAlShXQ4SZV8/2RDAtdRk4k/V96OzOxnKFNtWn+sxpqVl
         98UuJA/HKMGj6/tF3tCtlGq7jTIj47iyk6PFUgnQX33tKCnAZaYzP72v6Ge+03XjJ+Wl
         E3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=sxwpW4/HVr9IelDA6cDLbeJJnX5WGx+OvjI8RRJKBVE=;
        b=HnnBj/oufKIFwdQ55r5aWjkabF/qKIJ2IBHf597kAlFdeGT25NPyDeTFSYt+yQMnPl
         nDV0d9VeOoXvTQYeF2r5qxLJm48TRzKe8JIQ8BWEzCECFH7gY4q/IpDfKme5mKJffZML
         TvaALfc7DCHmA2IgOYwJCFLP1HDNmN51wXsc/gMnojo9XloDx/RxI8poOauK3Rax7ukA
         ecrF9oIsGZP2uxxB45qhS/pECE5r2F6PBSfrXcSmS37x/RCZvjv/UI1lxjP5dsPYlgVy
         gnc5iLAz8CNIUb2pNu9hRz2ZVSqvgUitlNWtMmy0GXpDiWspYkAgTqgDTtqdCRSO1pSw
         Wcsw==
X-Gm-Message-State: AOAM533f6NDlFKfaUVzWEhN7gR/hMvRykOt6PoR0KFthW8lTvunF8+YY
        20zuS9dCmXNF0BN6o7fYVfo=
X-Google-Smtp-Source: ABdhPJwc1ozay0nQL7YcKeKqxZTjP4EJXPLR2hOZkCjH6hLcF3k7h7OoqAS438V9+E8LJ/WYcBqjmw==
X-Received: by 2002:a63:1b11:: with SMTP id b17mr2064181pgb.1.1606906018584;
        Wed, 02 Dec 2020 02:46:58 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:561:5929:abfa:5e69:aaf7:6f59])
        by smtp.gmail.com with ESMTPSA id e14sm1648109pjt.17.2020.12.02.02.46.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 02 Dec 2020 02:46:58 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v11 0/5] leds: mt6360: Add LED driver for MT6360
Date:   Wed,  2 Dec 2020 18:46:46 +0800
Message-Id: <1606906011-25633-1-git-send-email-gene.chen.richtek@gmail.com>
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

