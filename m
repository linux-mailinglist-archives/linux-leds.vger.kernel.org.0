Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64C86370087
	for <lists+linux-leds@lfdr.de>; Fri, 30 Apr 2021 20:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhD3SdZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Apr 2021 14:33:25 -0400
Received: from mx2.suse.de ([195.135.220.15]:59076 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229750AbhD3SdZ (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 30 Apr 2021 14:33:25 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 65157AFD5;
        Fri, 30 Apr 2021 18:32:35 +0000 (UTC)
From:   Enzo Matsumiya <ematsumiya@suse.de>
To:     linux-leds@vger.kernel.org, linux-block@vger.kernel.org
Cc:     u.kleine-koenig@pengutronix.de,
        Enzo Matsumiya <ematsumiya@suse.de>,
        Jens Axboe <axboe@kernel.dk>, Pavel Machek <pavel@ucw.cz>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/2] block: export block_class and disk_type symbols
Date:   Fri, 30 Apr 2021 15:32:10 -0300
Message-Id: <20210430183216.27458-2-ematsumiya@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210430183216.27458-1-ematsumiya@suse.de>
References: <20210430183216.27458-1-ematsumiya@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Export symbols to be used by _for_each_blk() helper in LED block
trigger.

Signed-off-by: Enzo Matsumiya <ematsumiya@suse.de>
---
 block/genhd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/genhd.c b/block/genhd.c
index 8c8f543572e6..516495179230 100644
--- a/block/genhd.c
+++ b/block/genhd.c
@@ -1218,6 +1218,7 @@ static void disk_release(struct device *dev)
 struct class block_class = {
 	.name		= "block",
 };
+EXPORT_SYMBOL(block_class);
 
 static char *block_devnode(struct device *dev, umode_t *mode,
 			   kuid_t *uid, kgid_t *gid)
@@ -1235,6 +1236,7 @@ const struct device_type disk_type = {
 	.release	= disk_release,
 	.devnode	= block_devnode,
 };
+EXPORT_SYMBOL(disk_type);
 
 #ifdef CONFIG_PROC_FS
 /*
-- 
2.31.1

