Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0081A247491
	for <lists+linux-leds@lfdr.de>; Mon, 17 Aug 2020 21:12:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731802AbgHQTLy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 Aug 2020 15:11:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730883AbgHQTLk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 17 Aug 2020 15:11:40 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9119FC061389;
        Mon, 17 Aug 2020 12:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:Cc:From:To:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=PkZn/PaagAcCwbgw5BUloqjClJwD2M7BqojCnadMl0I=; b=YQv9v4L5lj3mNuq1mmrEsKMOD2
        GB0RAIgLMVH113uBQVGNMBFKK9Lk8gfl6QfGnLxQr5Ozb7FaJ7daGDVkcMELb7TcU2YXkUHcSoPqm
        MVtDc2uANpWnuuk+4F79HxG6GooQP9WWL7jVlHyBt97Mdqv6ry6cHCmrOICzzH1KKb1rXjczbPbou
        n5eIzEfNohUGJ7+kF4+QM7wqd8LPU2m+fF82pJehSXYCcGCYDkir7K+Rd8wMfKxz8XxED1ls+66e/
        RBtcA4WCl7ncrAoaswaX188m9FEUMZWbifdyi1+fCPti7rUvTD+SxVP0Aal+KxPiDQnJqpcoSQiGO
        6iK9LOpQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k7kXc-0000Wf-A4; Mon, 17 Aug 2020 19:11:33 +0000
To:     LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Milo Kim <milo.kim@ti.com>
Subject: [PATCH] leds: LP55XX_COMMON needs to depend on LEDS_CLASS
Message-ID: <0ad9338b-e2da-e269-db49-b448977bdc83@infradead.org>
Date:   Mon, 17 Aug 2020 12:11:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

With these kernel configs:
CONFIG_LEDS_CLASS=m
# CONFIG_LEDS_CLASS_MULTICOLOR is not set
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5562=m

leds-lp55xx-common.c has a build error because it is builtin and
calls an interface that is built as a loadable module (due to
LEDS_CLASS=m). By making LEDS_LP55XX_COMMON depend on LEDS_CLASS,
this config combination cannot happen, thus preventing the build error.

ld: drivers/leds/leds-lp55xx-common.o: in function `lp55xx_register_leds':
leds-lp55xx-common.c:(.text+0xc5f): undefined reference to `devm_led_classdev_register_ext'

Fixes: 33b3a561f417 ("leds: support new LP8501 device - another LP55xx common")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Milo Kim <milo.kim@ti.com>
Cc: linux-leds@vger.kernel.org
---
The Fixes: tag might be incorrect...  I also considered:
92a81562e695 ("leds: lp55xx: Add multicolor framework support to lp55xx")

 drivers/leds/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200817.orig/drivers/leds/Kconfig
+++ linux-next-20200817/drivers/leds/Kconfig
@@ -397,6 +397,7 @@ config LEDS_LP3952
 
 config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
+	depends on LEDS_CLASS
 	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
 	depends on OF
 	depends on I2C

