Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E135E3C8710
	for <lists+linux-leds@lfdr.de>; Wed, 14 Jul 2021 17:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239927AbhGNPPH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 14 Jul 2021 11:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239864AbhGNPOx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 14 Jul 2021 11:14:53 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7389C0610D0
        for <linux-leds@vger.kernel.org>; Wed, 14 Jul 2021 08:11:44 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:bcf3:b2b1:dff6:480b])
        by albert.telenet-ops.be with bizsmtp
        id V3Bf250074sai0K063BfVK; Wed, 14 Jul 2021 17:11:41 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXy-001ARR-LR; Wed, 14 Jul 2021 17:11:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1m3gXx-00AcgO-JO; Wed, 14 Jul 2021 17:11:37 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Rob Herring <robh+dt@kernel.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Paul Burton <paulburton@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>
Cc:     devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3 12/19] auxdisplay: ht16k33: Convert to simple i2c probe function
Date:   Wed, 14 Jul 2021 17:11:23 +0200
Message-Id: <20210714151130.2531831-13-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210714151130.2531831-1-geert@linux-m68k.org>
References: <20210714151130.2531831-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

ht16k33_probe() does not use the passed i2c_device_id, so the driver can
be converted trivially to the new-style of i2c probing.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Robin van der Gracht <robin@protonic.nl>
---
v3:
  - No changes,

v2:
  - Add Acked-by.
---
 drivers/auxdisplay/ht16k33.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/auxdisplay/ht16k33.c b/drivers/auxdisplay/ht16k33.c
index 8c9acc4800bc94e0..8c1689b77db95676 100644
--- a/drivers/auxdisplay/ht16k33.c
+++ b/drivers/auxdisplay/ht16k33.c
@@ -381,8 +381,7 @@ static int ht16k33_keypad_probe(struct i2c_client *client,
 	return input_register_device(keypad->dev);
 }
 
-static int ht16k33_probe(struct i2c_client *client,
-				  const struct i2c_device_id *id)
+static int ht16k33_probe(struct i2c_client *client)
 {
 	int err;
 	uint32_t dft_brightness;
@@ -523,7 +522,7 @@ static const struct of_device_id ht16k33_of_match[] = {
 MODULE_DEVICE_TABLE(of, ht16k33_of_match);
 
 static struct i2c_driver ht16k33_driver = {
-	.probe		= ht16k33_probe,
+	.probe_new	= ht16k33_probe,
 	.remove		= ht16k33_remove,
 	.driver		= {
 		.name		= DRIVER_NAME,
-- 
2.25.1

