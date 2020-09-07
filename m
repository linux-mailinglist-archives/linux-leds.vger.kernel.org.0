Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FF9325F83F
	for <lists+linux-leds@lfdr.de>; Mon,  7 Sep 2020 12:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728797AbgIGK3z (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Sep 2020 06:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728946AbgIGK2P (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Sep 2020 06:28:15 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDE02C061755;
        Mon,  7 Sep 2020 03:28:14 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f18so8406157pfa.10;
        Mon, 07 Sep 2020 03:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=CBAjwcA4hZoU/siThfOYzyCueHpWs1VgxUUUg5ulGQ0=;
        b=kWqWj4O3Jx+m/ssQOZ00iU5lgeVEeWpcUrqXYL85RfPgNlQOAHeVGJUBJrIj7jBCtf
         Y8NUcg6GsAsYi52Ok9Hu8fHOIPS3jlhSN7tWtHiiuJ/AnKemrTnRg75Q7OsNL+/4VQl1
         +MmpZ6VzwgQek0rakGYay0eoe7GsmhNpUrwjCqraEM+10asJoZje0gFbdxgymQ8KR41A
         2zsU8Nu51mzG2zGfG+3XTSZbHBx3tTZ1fy6ALPtverMG+1l5utw4Zpl/XvPhpgjQPYki
         p/fjAXU2ocxRc6vmVzjz4YX0dxXuBLxYQ8sbAtUodxEsZvPtAr5B9/SR6f3NTCp/2K9d
         ht4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=CBAjwcA4hZoU/siThfOYzyCueHpWs1VgxUUUg5ulGQ0=;
        b=DdCEcvNFcoPRGC3I3zScAcqtbLXjzS25cmXcYIz3NdameRiqCOW5Qlcu4kNhra99Oe
         JgJeN0qquICC4lTtCI7KQu+gSIHIsBGUF9Eykp8/63Iuan/Flulqxyy3+OzDepIxrFRm
         uEtHKZfkh0ZvxRwoADuU4EfRG99I2E+4oKHkJxyyYb7PUMiBldHQxImnBjIFi9fssXZs
         wotvFWqc3yNBG/qsGuFL3psreaR01906MbVudWLzOOtZ6csTt/0rJbL+nogIrnXNWwUz
         6BTD54O7H0WAQDzcZIJnpT1Hct61xrAGBGD13RmAqrVokUZvgu8Hmy6h9bCKGlOYoRax
         0J1g==
X-Gm-Message-State: AOAM531ekoYOMx+8iWOqpCP72kQe80GREASTOt/FP+3YO22IVaFoLK5Y
        aVHDQ8/GTq9mWOS+cxoV5fy1S5Et0+w=
X-Google-Smtp-Source: ABdhPJyz0ak7cYr71ekRNjFYcWrCNQYPqc6H+PRwgl7o7v2SVn0qNSINzfq7opvN8pkv0zZXhPtn+Q==
X-Received: by 2002:a05:6a00:1688:: with SMTP id k8mr19948800pfc.33.1599474494511;
        Mon, 07 Sep 2020 03:28:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:568:81bf:545f:f984:753e:4bcc])
        by smtp.gmail.com with ESMTPSA id q193sm15009717pfq.127.2020.09.07.03.28.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:28:14 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v3 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Mon,  7 Sep 2020 18:27:37 +0800
Message-Id: <1599474459-20853-1-git-send-email-gene.chen.richtek@gmail.com>
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

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  105 ++
 drivers/leds/Kconfig                                    |   11 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  681 ++++++++++++++++
 4 files changed, 798 insertions(+)

changelogs between v1 & v2
 - add led driver with mfd

changelogs between v2 & v3
 - independent add led driver
 - add dt-binding document
 - refactor macros definition for easy to debug
 - parse device tree by fwnode
 - use devm*ext to register led class device

