Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE1E2794B4
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 01:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729093AbgIYX0q (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 25 Sep 2020 19:26:46 -0400
Received: from agrajag.zerfleddert.de ([88.198.237.222]:38860 "EHLO
        agrajag.zerfleddert.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726773AbgIYX0q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 25 Sep 2020 19:26:46 -0400
X-Greylist: delayed 501 seconds by postgrey-1.27 at vger.kernel.org; Fri, 25 Sep 2020 19:26:45 EDT
Received: by agrajag.zerfleddert.de (Postfix, from userid 1000)
        id BE53B5B20838; Sat, 26 Sep 2020 01:26:44 +0200 (CEST)
Date:   Sat, 26 Sep 2020 01:26:44 +0200
From:   Tobias Jordan <kernel@cdqe.de>
To:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Nikita Travkin <nikitos.tr@gmail.com>
Subject: [PATCH] leds: aw2013: fix leak of device node iterator
Message-ID: <20200925232644.GA17005@agrajag.zerfleddert.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

In the error path of the for_each_available_child_of_node loop in
aw2013_probe_dt, add missing call to of_node_put to avoid leaking the
iterator.

Fixes: 59ea3c9faf32 ("leds: add aw2013 driver")
Signed-off-by: Tobias Jordan <kernel@cdqe.de>
---
 drivers/leds/leds-aw2013.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw2013.c b/drivers/leds/leds-aw2013.c
index d709cc1f949e..8687ffa57a28 100644
--- a/drivers/leds/leds-aw2013.c
+++ b/drivers/leds/leds-aw2013.c
@@ -305,8 +305,10 @@ static int aw2013_probe_dt(struct aw2013 *chip)
 
 		ret = devm_led_classdev_register_ext(&chip->client->dev,
 						     &led->cdev, &init_data);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 
 		i++;
 	}
-- 
2.20.1

