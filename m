Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6DEC5FEF1
	for <lists+linux-leds@lfdr.de>; Fri,  5 Jul 2019 02:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727464AbfGEAGs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 4 Jul 2019 20:06:48 -0400
Received: from smtprelay0187.hostedemail.com ([216.40.44.187]:37672 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727313AbfGEAGs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 4 Jul 2019 20:06:48 -0400
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 796F4180002F8
        for <linux-leds@vger.kernel.org>; Thu,  4 Jul 2019 23:57:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 2C144181D33FB;
        Thu,  4 Jul 2019 23:57:56 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,0,0,,d41d8cd98f00b204,joe@perches.com,:::::::::::,RULES_HIT:41:355:379:541:800:960:973:988:989:1260:1345:1359:1437:1534:1539:1567:1711:1714:1730:1747:1777:1792:2393:2559:2562:3138:3139:3140:3141:3142:3865:5007:6261:8603:10004:10848:11658:11914:12048:12297:12555:12895:13069:13138:13231:13311:13357:14096:14181:14384:14394:14721:21080:21627:30029:30054,0,RBL:23.242.196.136:@perches.com:.lbl8.mailshell.net-62.8.0.180 64.201.201.201,CacheIP:none,Bayesian:0.5,0.5,0.5,Netcheck:none,DomainCache:0,MSF:not bulk,SPF:fn,MSBL:0,DNSBL:neutral,Custom_rules:0:0:0,LFtime:26,LUA_SUMMARY:none
X-HE-Tag: dress39_62395d273d11f
X-Filterd-Recvd-Size: 1588
Received: from joe-laptop.perches.com (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf14.hostedemail.com (Postfix) with ESMTPA;
        Thu,  4 Jul 2019 23:57:54 +0000 (UTC)
From:   Joe Perches <joe@perches.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/8] leds: as3645a: Fix misuse of strlcpy
Date:   Thu,  4 Jul 2019 16:57:42 -0700
Message-Id: <79fe35321ff794dccf1d08b415cee40636fa5fce.1562283944.git.joe@perches.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1562283944.git.joe@perches.com>
References: <cover.1562283944.git.joe@perches.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Probable cut&paste typo - use the correct field size.

Signed-off-by: Joe Perches <joe@perches.com>
---
 drivers/leds/leds-as3645a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index 14ab6b0e4de9..050088dff8dd 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -668,7 +668,7 @@ static int as3645a_v4l2_setup(struct as3645a *flash)
 	};
 
 	strlcpy(cfg.dev_name, led->name, sizeof(cfg.dev_name));
-	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfg.dev_name));
+	strlcpy(cfgind.dev_name, flash->iled_cdev.name, sizeof(cfgind.dev_name));
 
 	flash->vf = v4l2_flash_init(
 		&flash->client->dev, flash->flash_node, &flash->fled, NULL,
-- 
2.15.0

