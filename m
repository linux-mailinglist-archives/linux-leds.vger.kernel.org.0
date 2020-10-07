Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF63328565F
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 03:43:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727014AbgJGBm6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 21:42:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725996AbgJGBm5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 21:42:57 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B759CC061755;
        Tue,  6 Oct 2020 18:42:57 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id x16so384310pgj.3;
        Tue, 06 Oct 2020 18:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=BSwgb5vSoUbb573urqabj8/K+d93yszEnYna0kzT394=;
        b=dqLL37wR8nDbV45dP2ly1+tI3LrHo0FcXEH9knPtdGi2U//1h6lWirvlZaFvWDkwBw
         OJDap5KFM1K+8wD31b0dUBFwzReQkeTuqcs0tBj6m/un5104ZgdvV0Q0cUdS02V7B0wc
         xc8hIrbH2fc+JdQRLxoHdcFi2A2M86bLFv6pfKjZn9E4zeT6+GlzR7lTg1MS0N3f5HVg
         OBD5hNT1YhILcGVEsWWN9UY+f0Uq9icLPyGsoY/NMJwI4npg1V1nZHTEXLi5vqo1IVMS
         p9MpCDEpSuG+kq49JBgiU7E/ZI3G8QY9ScvpHqm25ZoU2r1wuQpMLFxgsMG51p+1VKiE
         gIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=BSwgb5vSoUbb573urqabj8/K+d93yszEnYna0kzT394=;
        b=cfRS+rgYSbRflGshEfBrPqvzMkQX+6DG39+9BtDMUprP5tpS7Qpy1X0lIdFhcQ8/9i
         idP4ajPzIvbxJbuxoDXHazX/kW7Ycg53Q0tDTLmAh9ST2z7hwZICtAB/eyR+JL+RfJYs
         toB2cmxhSpngHAnp15c7cTZj/T1eDbzLlXZjYBRCJ0ZZFCZACZfu6WiukBUaS7uG9B5O
         Sism1TIqHjCgn8gLHi6yQk8VQ2deK+zaPA2FogVIQKAveTEECKRG4Oyan+5GXCtf7uhk
         qvuFbsRXflYB639BUPa6MvSsSIK11QcC395E1hqRTFvtb6KE9DBY6VgnXllL3k4a8gLr
         JX7g==
X-Gm-Message-State: AOAM5337+Q69UULyrFk/3V8tR1OcTSYHpb86BABPaU83Zs9l/JbVE0HE
        aiNZ4fQsWU4WVO6mhl16IqM=
X-Google-Smtp-Source: ABdhPJwOtctNYgd+bympQf2CnHiuVZiqRB8CdT80zq4aE5EcPTa+SWV7SmTq4501USU/lTgevAxUCA==
X-Received: by 2002:a63:1e0c:: with SMTP id e12mr907420pge.386.1602034976633;
        Tue, 06 Oct 2020 18:42:56 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:dc67:6c85:26f7:3457:384d])
        by smtp.gmail.com with ESMTPSA id a185sm485863pgc.46.2020.10.06.18.42.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Oct 2020 18:42:55 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v5 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Wed,  7 Oct 2020 09:42:44 +0800
Message-Id: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   95 +
 drivers/leds/Kconfig                                    |   12 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  783 ++++++++++++++++
 4 files changed, 891 insertions(+)

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

