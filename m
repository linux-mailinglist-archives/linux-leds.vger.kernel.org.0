Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50F27274265
	for <lists+linux-leds@lfdr.de>; Tue, 22 Sep 2020 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgIVMvT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 22 Sep 2020 08:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgIVMvT (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 22 Sep 2020 08:51:19 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6046FC061755;
        Tue, 22 Sep 2020 05:51:19 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d6so12342756pfn.9;
        Tue, 22 Sep 2020 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Uq4gszUN314/xrax/zivCjL8TtnAIPQarXrbHoUDZEw=;
        b=E8ABS3R7AQYqZW4xbmmlHZMrrHqhduMblu/D5suTnRNJuIlLN8UYQooUjD56MqtAwq
         w98dg3iOS+/k/EdOQK6N5eHRJB+DiWSBsdq3RWT3NF7f3m5HCpandqi2sXd3RqtUMPUa
         XnnUDQfsHPtlesfzMgkQfzHv84kAMlVN0fyuvX54Qb8EgCsktYzG4bLloKwgcZFOHHTa
         hmWsvh5TcbdwKOBrQJzDkuKXbBMhBd7b32o6yNCZWOVWjleNIeXYuPLgdpittmLE+weX
         M2O35yFEGQzp2UkvU2z6DKaIPBYxzK1H4QxBjBpVpdBQFLNXbhH8Negc+WI5ThoMwyaW
         Tl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Uq4gszUN314/xrax/zivCjL8TtnAIPQarXrbHoUDZEw=;
        b=cRNjHgmgqye3QRIl+NjhIAi+bYDfWGOQxes7YEyrHSKlaWaKj7bxgzBGWXXjjf0Hgn
         7Ji2OpK5bO9L0ldEGbmGFbRTvnoytUKVhkQeLAoU/RDQW06h/G00bY/LpH7gkjFn7kLq
         4GwvJCrq2LzqUo2J3vUg3GpGYPXJj8+uIhDSpvzwhlRyjyYQZGmM+7pooH5JfrvjoAo+
         u/bhuJn2/aW9fW6OMI++xz6c2bJKCzQf81f1xTtGgtQ44uB0RUqb3EqdO7AFcBDNSUy4
         AVr0zHP3wyK6Qd5LrUnSyXA+I2cz/+DhXPoEUTltgJ4u4V9fIu3qSAuyjcBTtGKxc7Bn
         MKmg==
X-Gm-Message-State: AOAM530ACEg4ib48+9Mntp6vXedxZsW9Kk7saNNbRc1HqGIISLt2ylbK
        FxIZpzos4c69nVm2yVGa8iU=
X-Google-Smtp-Source: ABdhPJygZmnt7VKPOrJ+r7AEP2gHgW/QMzfNez2co3rHo1QeDJ1D4H6QbHERLnnMttxv3IJ+DhkwxA==
X-Received: by 2002:a62:3401:0:b029:150:e9ad:569 with SMTP id b1-20020a6234010000b0290150e9ad0569mr2670613pfa.75.1600779078923;
        Tue, 22 Sep 2020 05:51:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
        by smtp.gmail.com with ESMTPSA id b18sm14995695pfr.4.2020.09.22.05.51.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2020 05:51:18 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v4 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Wed, 23 Sep 2020 20:50:50 +0800
Message-Id: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  107 ++
 drivers/leds/Kconfig                                    |   11 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  705 ++++++++++++++++
 4 files changed, 824 insertions(+)

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

