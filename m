Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D91138F0DE
	for <lists+linux-leds@lfdr.de>; Mon, 24 May 2021 18:07:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235809AbhEXQGl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 24 May 2021 12:06:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237689AbhEXQFe (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 24 May 2021 12:05:34 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CFA6C045A53;
        Mon, 24 May 2021 08:24:49 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id d16so21082965pfn.12;
        Mon, 24 May 2021 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdxJSqfgziagedBw0XrcHxZm8bidCvv9boVgE9SVO4w=;
        b=hRKZ1Gc0eU5QYIkceJ3FdfaYPJ3pvcLbpZYHC5KjSd8N9Tg9XclrQHK3NfXeo79O5G
         N6N7COZ8ES2eMkzfe0JwoskjL5A0FlPA0vx5WaWzKcyDh8y2ys5Y/IUFsBsS0sKWQph1
         MLH0Rzo9nmN+fuADpeYMd+H1f3TUOBi9DChfyfWc36sgsbsBIPLYC0o/6YVM9lq6dV6X
         NjAV/V+rkQi9fYjZw2B/3837zs+UlHvcpHIUd1qi2B7bZA/zYlsVlUIBnou8mGTt/355
         SbwY6v9ePCvsgH+Xjzd8J3k34iBbC5/b1lsbfhMai1f9GgrKWgQKYCchQNoM9xVAESgn
         cmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SdxJSqfgziagedBw0XrcHxZm8bidCvv9boVgE9SVO4w=;
        b=TpJ1DRiRAYEOQfv0Ig5945IpuRKfgLStC5XQIbP8bMIzdw556J3c3IwKsIpyk4i/yZ
         4QBCoUNwrvlD2i6odpo37RFP5Db+o5vimqy2SNrbPzHAgZRR7dwXVefqF0UK5qtg7F7x
         c9c86eYgUFQIDBr7jOcEk6aAeM1DKsgZXLxKS2qXf0B3s/lUidYtmjj8YFthvXhLpHlv
         Yg8QJyDxCP16OcqRs67Ef4daF9/0bFc0D5PNNUb3Xie9DXd9FDCT34hHN+B+SBd5E7Oh
         eRJJEyeRD30p5cbdoJnRC2++5RSa7bZCowlTrG78XNUmEygEFaWdEKt2Ui614jxKTbeB
         FDFA==
X-Gm-Message-State: AOAM531b3vsDKokNNjyYvUVSZuH27tYDeZ9Aqu455luH/35sf4ekWYhV
        21WFH3ot7n+p/o6SQyRuaH4=
X-Google-Smtp-Source: ABdhPJx7/6fAdLIu67aceMeF+xCB7VOiL6cBF8XdU3nRpUQ1xRRLy7NlNTpqHtuhxgEEEc0sdnudBw==
X-Received: by 2002:a62:4ecc:0:b029:2d7:d315:2579 with SMTP id c195-20020a624ecc0000b02902d7d3152579mr25028889pfb.21.1621869888526;
        Mon, 24 May 2021 08:24:48 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:b4c4:1464:a4f2:334c:afaf])
        by smtp.gmail.com with ESMTPSA id a15sm10821597pff.128.2021.05.24.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 08:24:47 -0700 (PDT)
From:   Gene Chen <gene.chen.richtek@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, matthias.bgg@gmail.com
Cc:     dmurphy@ti.com, linux-leds@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        gene_chen@richtek.com, Wilma.Wu@mediatek.com,
        shufan_lee@richtek.com, cy_huang@richtek.com,
        benjamin.chao@mediatek.com
Subject: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
Date:   Mon, 24 May 2021 23:24:25 +0800
Message-Id: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
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


