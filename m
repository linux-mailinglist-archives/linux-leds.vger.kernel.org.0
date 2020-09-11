Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19F4326628B
	for <lists+linux-leds@lfdr.de>; Fri, 11 Sep 2020 17:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726074AbgIKPwW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 11 Sep 2020 11:52:22 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:33233 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgIKPvt (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 11 Sep 2020 11:51:49 -0400
Received: from methusalix.internal.home.lespocky.de ([109.250.103.56]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M8yU2-1kCtYW2lIE-0069sH; Fri, 11 Sep 2020 17:41:02 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kGlAa-000135-BL; Fri, 11 Sep 2020 17:41:01 +0200
Received: (nullmailer pid 28463 invoked by uid 2001);
        Fri, 11 Sep 2020 15:41:00 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Alexander Dahl <ada@thorsis.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v4 1/3] leds: Require valid fwnode pointer for composing name
Date:   Fri, 11 Sep 2020 17:40:02 +0200
Message-Id: <20200911154004.28354-2-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200911154004.28354-1-post@lespocky.de>
References: <20200911154004.28354-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 2c58665afdcdd1fd53023359626f008f
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:LYC8iw1IV1lNMsuBweYlQBm4S8YlGnqKIC8zMdEBw3RCUlYAB2c
 PrN32EnGnTiai7GDG1bbSZQx9SvV8xFXJcNRgVGW233JNEtp8Wc9IMKUGnHe3nASQID774P
 qCGms4EK7yU2auAuGu9y7cw4k48vHJvBRzzrJGLN3N3dgNCy+96pljzsgrHm6N08hwD18Y7
 fr8z07kKHzujpkFkoBebA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Fn4e2LsBO4Q=:ffhApIJPBbFWkNpe02vDYk
 Pq1EUjpIZH5jA7Xl5hT1hKYHt9+Pj9kQO6uLSliHL8QYI/rAB4Krk4Y8ImSSZVvIGLv/ibevl
 0x1cInsiqO1nhuXGJhqIf47Be0YX/laMj270rVANDYj5uylELooCY0h9MqjC6YRRJcj8wQf2P
 d3DhW4eysqvCSSC4DV+WZaHGJxeQ50tLxr0sBuFD/ftCC3TWH6Ht445dk/JOxZa65dKKb021z
 wP3L6pih53GjPGO2EXWSYXdRJiFKlq/L4X14Tk8yA2qcUqnyqicxuabR0wjTrlFlf2izCJvhx
 fDOf/TIbI+DnHm/VeozpvziMLIOlDTnO4Wcm5Qx2EhE9EnVMag1SbGqlzYpDM0atke/VTKLVA
 BdUM0rqLaxjeucs5n9fQm7VIR14zGGWGX2vjUPp5rx8TIeDXl5ABVjwH3cojXcfJ6BvY8MDao
 omTLOKjsoftLU20qTYhUC0d2hV39q1uHu/PjFnBRc100iUDUNNpUMh/4BrwQkfjL1KyUflcsv
 p07ToZTu6oesU41/3hgBQZ6bL+3edKlmuJXhtqSTCF+TtAwSlORHTabDTgrH07RWVIE6DcbJf
 lkn2lShCSoTPXa/J3gqAma/Pjc6K46EUqhI9k/38t2tOBnRWh3llJ8f48ZKSxynvPet6rCsrs
 FRqsIEaO/CDSPMjCkQDzsjVviODplfo3iMVZP8FYFmvkkslKdN+gd3ho9pRWaEH4to1NJ4Vtl
 Um8WLaL8De0YooTV95Ttmu+aQftsspaMXNe0/+SDVR8Kzc6/ErAh88IYbxRAXf6fETA8x37ka
 gkeIN9ATzJ0pYc8WfZy7h3BonW56fTwoQGvxjsZwhNjlZUzhD0y1oKxK8uslknAd39WpAQk
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The function 'led_compose_name()' is called in
'led_classdev_register_ext(()' only and in its implementation it always
parses the fwnode passed with the init_data struct.  If there's no
fwnode, EINVAL is returned and 'led_classdev_register_ext()' returns
early.

If this is detected early the same fallback mechanism can be used , as
if init_data itself is NULL.  This will allow drivers to pass fully
populated 'init_data' or sparse initialized 'init_data' with a NULL
fwnode in a more elegant way with only one function call.

Fixes: bb4e9af0348d ("leds: core: Add support for composing LED class device names")
Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v4:
      * added this patch to series (Suggested-by: Pavel Machek)

 drivers/leds/led-class.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index cc3929f858b6..3da50c7ecfe7 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -346,7 +346,7 @@ int led_classdev_register_ext(struct device *parent,
 	const char *proposed_name = composed_name;
 	int ret;
 
-	if (init_data) {
+	if (init_data && init_data->fwnode) {
 		if (init_data->devname_mandatory && !init_data->devicename) {
 			dev_err(parent, "Mandatory device name is missing");
 			return -EINVAL;
-- 
2.20.1

