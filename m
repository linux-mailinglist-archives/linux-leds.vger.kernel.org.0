Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F209521A6
	for <lists+linux-leds@lfdr.de>; Tue, 25 Jun 2019 06:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728203AbfFYEFw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 25 Jun 2019 00:05:52 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:33112 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfFYEFv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 25 Jun 2019 00:05:51 -0400
Received: by mail-qt1-f194.google.com with SMTP id w40so6399056qtk.0;
        Mon, 24 Jun 2019 21:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=F/H9mhykvcAZ9M5E21oIuq11gruwI8sC3aDFsjVhfLA=;
        b=ImTlavZZ/bV3BqPdDgzZzSx81N6BtUPPYK8L+VKevY8ztou4g0HCa7bVSVaT1WhH3g
         pjuHfv0YEeoMuNRlImknK7dLVzZwuVe0qMvf708fGnJd7PjB+S0Hb7+2nX+4IMqZDGZU
         h3QiLXfTN8E2Ze7ljMKdGDZRrp7mmrnnjTQXefX+WLTH+Mp/3GsBirQ3qKzfu+3PZ8f1
         59HfeXMP2Ro3lVd/A6gQrIAeLVjGjTMgNS/TGOMKuryQtgFK3RSMdYYRA6GWHu5mYm0S
         um/fAu5u4cZmK4lDDK43B16CCiGGqA0rS6+YL7xCclhquGOPrIeeVwwNmNmXpWZ2DYtL
         8U1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=F/H9mhykvcAZ9M5E21oIuq11gruwI8sC3aDFsjVhfLA=;
        b=s2xMr066erFQ7eFD5iDCm3P0LcVQJexsgWzF7o84lbHccsj/DPrVk23WKM3bk6Y07x
         ATx66F0THsKGIWWx76vnYNgp5PzFRw06UpZzl5j9VQqgbiRlXYGI2rQddLf0NXJXAaV+
         Eo6jYAO+HkixJbvE8BllzF7PnNGhBfm59e5pvU9IWKLuKu+58m1DWQODVNeDKDXp+H5m
         rCzaLuJ0EP3I7JuvqDDTRMd27YuapqoEf6JkGJmCXzKAnUfzkdUUlP9UvBEmVIiaF086
         WBLyrexiwfPaMN7jRsGm24qSMW6GIEahV6NeKUECSGRJOsSjx4BRb3lgN6WvQyTSNwti
         MS2g==
X-Gm-Message-State: APjAAAWsm1JwDyFtuQLSVl/jwAlAUdTqEtsw3fQ70zXYjuTvdZ2n8X98
        RtV4CjNUpMAO/oaztDo7E5TrJdj6rbM=
X-Google-Smtp-Source: APXvYqxXe8tsbgRJmd17Zj3c4OOToNNWkyBm0yZgfuVdU9s3UQK/icgRIdyQeLqTBUNFHuJE2FmkfQ==
X-Received: by 2002:ac8:4413:: with SMTP id j19mr38266381qtn.281.1561435549920;
        Mon, 24 Jun 2019 21:05:49 -0700 (PDT)
Received: from bdodge-linux-ub.fios-router.home (pool-100-0-123-202.bstnma.fios.verizon.net. [100.0.123.202])
        by smtp.gmail.com with ESMTPSA id e8sm6741029qkn.95.2019.06.24.21.05.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 24 Jun 2019 21:05:49 -0700 (PDT)
From:   Brian Dodge <bdodge09@gmail.com>
To:     pavel@ucw.cz
Cc:     daniel.thompson@linaro.org, lee.jones@linaro.org,
        jingoohan1@gmail.com, jacek.anaszewski@gmail.com,
        robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        pbacon@psemi.com, Brian Dodge <bdodge09@gmail.com>
Subject: [PATCH 1/2]    dt-bindings: backlight: fix vendor prefix for ArcticSand arcxcnn driver bindings
Date:   Tue, 25 Jun 2019 00:05:28 -0400
Message-Id: <1561435529-7835-2-git-send-email-bdodge09@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
References: <1561435529-7835-1-git-send-email-bdodge09@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

    The vendor-prefixes.txt file properly refers to ArcticSand
    as arctic but the driver bindings improperly abbreviated the
    prefix to arc. This was a mistake in the original patch

Signed-off-by: Brian Dodge <bdodge09@gmail.com>
---
 .../bindings/leds/backlight/arcxcnn_bl.txt         | 24 +++++++++++++---------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
index 230abde..9cf4c44 100644
--- a/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
+++ b/Documentation/devicetree/bindings/leds/backlight/arcxcnn_bl.txt
@@ -1,8 +1,12 @@
-Binding for ArcticSand arc2c0608 LED driver
+Binding for ArcticSand arc family LED drivers
 
 Required properties:
-- compatible:		should be "arc,arc2c0608"
-- reg:			slave address
+- compatible: one of
+	"arctic,arc1c0608"
+	"arctic,arc2c0608"
+	"arctic,arc3c0845"
+
+- reg:		slave address
 
 Optional properties:
 - default-brightness:	brightness value on boot, value from: 0-4095
@@ -11,19 +15,19 @@ Optional properties:
 - led-sources:		List of enabled channels from 0 to 5.
 			See Documentation/devicetree/bindings/leds/common.txt
 
-- arc,led-config-0:	setting for register ILED_CONFIG_0
-- arc,led-config-1:	setting for register ILED_CONFIG_1
-- arc,dim-freq:		PWM mode frequence setting (bits [3:0] used)
-- arc,comp-config:	setting for register CONFIG_COMP
-- arc,filter-config:	setting for register FILTER_CONFIG
-- arc,trim-config:	setting for register IMAXTUNE
+- arctic,led-config-0:	setting for register ILED_CONFIG_0
+- arctic,led-config-1:	setting for register ILED_CONFIG_1
+- arctic,dim-freq:		PWM mode frequence setting (bits [3:0] used)
+- arctic,comp-config:	setting for register CONFIG_COMP
+- arctic,filter-config:	setting for register FILTER_CONFIG
+- arctic,trim-config:	setting for register IMAXTUNE
 
 Note: Optional properties not specified will default to values in IC EPROM
 
 Example:
 
 arc2c0608@30 {
-	compatible = "arc,arc2c0608";
+	compatible = "arctic,arc2c0608";
 	reg = <0x30>;
 	default-brightness = <500>;
 	label = "lcd-backlight";
-- 
2.7.4

