Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26FC6252C9A
	for <lists+linux-leds@lfdr.de>; Wed, 26 Aug 2020 13:40:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729057AbgHZLjx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 26 Aug 2020 07:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728992AbgHZLh3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 26 Aug 2020 07:37:29 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8FBBC061756;
        Wed, 26 Aug 2020 04:37:28 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id z18so756749pjr.2;
        Wed, 26 Aug 2020 04:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8soih7ZxN39aNjkTCbL3poEBD4/UNqwDrB6uxoTytTU=;
        b=a4kvzWmO8jtGJVQYuSq1G+cXV23TSB5ZzHJjuG0JOBeKi/R8IEB/qOR26gSrDElDXG
         ZAerrY/Pa8CT2fSuFA9MLiHuTWFR3bbuzeyt2beKXyUbjCALT0LayevgzJ9w5rtMp3Nh
         SfEGPgeaBy/11OOomsVR8fT3Wkd6L5f6vf2WloNM6PdXH7kQCphTYPsOxzBL/owxjjuW
         j6KmvH6F0+L4ZKgaZfT6JjrnAy0vXSueDHC/xzFwNO2HBkLPXVNI+YlDGvobIvqjUz7Q
         Gr23ZiXDTHrFa2sZMZzuKJcq1cYjZk/vNRp4j1erZ6HW/QEVO04bbDZswylV63WdA38r
         i44A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8soih7ZxN39aNjkTCbL3poEBD4/UNqwDrB6uxoTytTU=;
        b=lcMN3zFxQF0FWBOQg9iOOE1KyMXtwXRo+9Bw/kw0uI5S4OIMpU83Nwr21sruS1cnlo
         103CZZa5KuiF2qSYPTmaeVCLk7Vdsk3A8Iu+ZYleCePFv4aSpYT1pjuoXRTpJOnvkvaU
         KsGoSobc1IO41ZaaPWLmZ+Ufy1UuMlzJCEeJtaIY/rzswCf10eHMcVf5LTsh6P6TyEU1
         QdgX/7h44aeaai5GnmaPwY6+k7O8+B2cUleUqWtvbZXR8Ax8+P2+kfiH7g3L5jSRFFln
         zMXcUBZczl1uXKtGF4rZn37K/rSLtXy+3M23BLxYngkzY9ikN8rIV1NVl0+n3lrl2l43
         2XMA==
X-Gm-Message-State: AOAM5324UVAGpHi6d35sQw/xVD2qRC9FV9M8jpTwQQMKZy3rWSNwrmum
        qMoE2hjwkOAvCDLe9IxYrro=
X-Google-Smtp-Source: ABdhPJySGi7F+fERC98gHqZLstD866hBK2wxBVxBmVDj6SLjsGOKgupRRUayD5xVky4hYDXfEZJ9FA==
X-Received: by 2002:a17:902:b20e:: with SMTP id t14mr11873691plr.58.1598441847811;
        Wed, 26 Aug 2020 04:37:27 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:56a:2197:d2eb:7e49:dfa1:a882])
        by smtp.gmail.com with ESMTPSA id x5sm2591047pfj.1.2020.08.26.04.37.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2020 04:37:27 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Wed, 26 Aug 2020 19:37:18 +0800
Message-Id: <1598441840-15226-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In-Reply-To: 

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 leds: mt6360: Add LED driver for MT6360
 dt-bindings: leds: Add bindings for MT6360 LED

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |   50 +
 drivers/leds/Kconfig                                    |   11 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  680 ++++++++++++++++
 4 files changed, 742 insertions(+)

