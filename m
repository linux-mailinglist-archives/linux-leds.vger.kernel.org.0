Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4EAA040B8DE
	for <lists+linux-leds@lfdr.de>; Tue, 14 Sep 2021 22:17:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbhINUSl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 14 Sep 2021 16:18:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233572AbhINUSl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 14 Sep 2021 16:18:41 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D11CC061762;
        Tue, 14 Sep 2021 13:17:23 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id y3-20020a4ab403000000b00290e2a52c71so73646oon.2;
        Tue, 14 Sep 2021 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aWIrGWSAZnWLUYS/1IqkrKk3N3j/RhEty7rQ3CX36ok=;
        b=p8zdga1hqRq2hYPE4rHam3VkTD66a2GE9EUushxnlUigjSoOGtL7aX2oF5LSFwWaR3
         PZviwaXUH55+Ydd0CNxKkFukD1TElHDyew8vY+x/hqHleVHub7metlhunclsk8J9TTlr
         UhD5CfoGT1gpvmD4WP0r2XNfp8gC3N6hpxw/xxDI1PN3AONjiIEjB6ablPCRxDA+GF9v
         NqsZKwaml3msSXSLKiXB8pdgdX3h1W6lTuiWOPn9fenP0+AvrqtN2PmzS8GhBwCEpkS9
         N/r+r3VDH27Xd3G8B+MT5C7I9HQS/V3Gu6Exhrv6pwB5LTR7gRovpjevpkx+VIAOdM4w
         n1hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWIrGWSAZnWLUYS/1IqkrKk3N3j/RhEty7rQ3CX36ok=;
        b=vtOCNCcfjucLg5onVG8fy1hVCB2gFrHyrunvsRQCUtck3l2X9iedxByUyY6XyFOp+t
         7btlkQGPOx/RJIBs0frE4qP6tKTVqU5jv3boX6EZK27fnam6dX/Vcxk1ry0+1DvLUsdp
         hBosiJUvDey9VVWeGYcpxDBG9h4G+BMBLKl9sfvDR3BBpzmhMSnLafauBO5D0nsVqY0m
         xZyev0lbKIWoMobJQon93JzltRhiM2b4Lh5hfCe5LA0s31dGWvkVcwgqjnDf+0+8/w0Y
         o3539CccZy9YTXh6WJyrIDK6eVcTMYoOk0f92H1+OVrA+H6F+fFLiYIAAicI919Z7hCd
         zkNg==
X-Gm-Message-State: AOAM533GXyKdu+fYtfT6F/obuMQTSjt4sgraNbhxxj5Dlu2lfbLOZXGA
        7oHqWbhzYG2Gx1kAc+h7jOQ=
X-Google-Smtp-Source: ABdhPJzfZQW/k2Uyfr16K89xBg+L16ARuFiCG+Z8QsLrRel9y3sjX4MtkNYikVF3JR4ZBnGB8F6BUA==
X-Received: by 2002:a4a:de90:: with SMTP id v16mr15596744oou.42.1631650642573;
        Tue, 14 Sep 2021 13:17:22 -0700 (PDT)
Received: from ian.penurio.us ([47.184.51.90])
        by smtp.gmail.com with ESMTPSA id p81sm2629455oia.48.2021.09.14.13.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 13:17:22 -0700 (PDT)
From:   Ian Pilcher <arequipeno@gmail.com>
To:     axboe@kernel.dk, pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        kabel@kernel.org, chaitanyak@nvidia.com
Subject: [PATCH v3 2/3] block: export block_class for use by the blkdev LED trigger
Date:   Tue, 14 Sep 2021 15:17:12 -0500
Message-Id: <20210914201713.14922-3-arequipeno@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210914201713.14922-1-arequipeno@gmail.com>
References: <20210914201713.14922-1-arequipeno@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Export block_class to the LEDTRIG_BLKDEV namespace.

The block device (blkdev) LED trigger periodically checks the activity
counters of block devices and blinks LEDs to reflect that activity.

The specific block device(s) checked can be configured through a
sysfs API.  Once an LED has been associated with the blkdev trigger,
the LED can be "linked" to a block device by writing that device's
name to the LED's link_device attribute.  For example:

  echo sda > /sys/class/leds/<led>/link_device

When a block device name is written to the sysfs attribute, the
trigger uses class_find_device_by_name() to resolve the actual
block_device structure:

  dev = class_find_device_by_name(&block_class, name);

Exporting the block_class symbol makes it possible to build the LED
trigger as a module.

Signed-off-by: Ian Pilcher <arequipeno@gmail.com>
---
 block/genhd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/genhd.c b/block/genhd.c
index 7b6e5e1cf956..ebea496bc283 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1076,6 +1076,7 @@ struct class block_class = {
 	.name		= "block",
 	.dev_uevent	= block_uevent,
 };
+EXPORT_SYMBOL_NS_GPL(block_class, LEDTRIG_BLKDEV);
 
 static char *block_devnode(struct device *dev, umode_t *mode,
 			   kuid_t *uid, kgid_t *gid)
-- 
2.31.1

