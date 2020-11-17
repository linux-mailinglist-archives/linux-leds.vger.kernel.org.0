Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E4CD2B5D90
	for <lists+linux-leds@lfdr.de>; Tue, 17 Nov 2020 11:59:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727962AbgKQK4V (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Nov 2020 05:56:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727952AbgKQK4T (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Nov 2020 05:56:19 -0500
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5FE3C0613CF;
        Tue, 17 Nov 2020 02:56:17 -0800 (PST)
Received: by mail-pj1-x1044.google.com with SMTP id js21so246399pjb.0;
        Tue, 17 Nov 2020 02:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=NLioOEcjfW/MmxTk00oamg+ivAVVHPp1FiA+wpjNbWQ=;
        b=m16pyCmzxROuHGcdnv2Xv4oL6krzQq0Gt2whfw3SxwIGX6hcYcu9GDcMI+kZfnOlfk
         JwynXS8svraxDwOQL3//C8AK+vnlfskp4OstdzkF7aFMPq+YqWNlGyxVp6zcQfV8vnuN
         PzcyaR8upFUAwpppzQDFaiLB91QxvCk4cDbczEqh8PHlS9rlBXdWyUoZkECp63RijA7f
         EDqgMuWJsBOvjyFZJ/rmui1rv+e9d9AEt8YCO7ebt6V/Rm9Srto8iN01GghqLq6x6MSW
         QJg5zleOp+e2usSrbOkRlcw62xxT/aqw0U0dRKwvplQhqd/9qlUvCVgeBZR9oQC+6unj
         kT1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NLioOEcjfW/MmxTk00oamg+ivAVVHPp1FiA+wpjNbWQ=;
        b=o52Y1h2aZwe5Ab2phQON6yJyorFbwZpjumXnmXj0O8BTtN69d6gKv+6JesC7IewraL
         DnUXJttNkANqS35MRopDpe3kDVK6PolHcAnMZKmAuiVw2191m7FtuzqO4lgOb5qCUG4l
         32FxDHjxvlEz3KUbVILgH24PJmsOX45gC/bRkOTSdlHKYZAL3Og6R7iYya9ahQLKYYvr
         pe8i/BCpzHjW+/IrmiJ3p9wQDSJyYk4v0AC8UKF6ZTgX/MIuyk+/QD1BLO9pAt4J61cK
         migJpl+z0aQTPuLOfBF6NlWa1duPjCa8woXdy+yp5r1/KQ0rFZrajr/Fn909UKXuEORX
         mAlA==
X-Gm-Message-State: AOAM5317EewSMSTs/ETHqOY794C6QgCC0AsYoJiCIU2JLzAV9xT6fDYu
        d12apqY8dxSDmV1xNFRogQE=
X-Google-Smtp-Source: ABdhPJzOnlyq5JZKywoPCUL0ozBIsDw0gn8Ce0wd4hCMagPJR9P7t/9xKX9Pruuso/Sx+MXfdcBbOA==
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr1101286pjb.204.1605610577432;
        Tue, 17 Nov 2020 02:56:17 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:462:32e6:3119:2966:5eda:751d])
        by smtp.gmail.com with ESMTPSA id j11sm17708214pgp.82.2020.11.17.02.56.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2020 02:56:16 -0800 (PST)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v6 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Tue, 17 Nov 2020 18:55:35 +0800
Message-Id: <1605610537-18085-1-git-send-email-gene.chen.richtek@gmail.com>
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

changelogs between v5 & v6
 - Use DT to decide RGB LED is multicolor device or indicator device only

