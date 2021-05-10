Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C703A378005
	for <lists+linux-leds@lfdr.de>; Mon, 10 May 2021 11:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhEJJwS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 10 May 2021 05:52:18 -0400
Received: from fgw21-7.mail.saunalahti.fi ([62.142.5.82]:42414 "EHLO
        fgw21-7.mail.saunalahti.fi" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230492AbhEJJwP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 10 May 2021 05:52:15 -0400
Received: from localhost (88-115-248-186.elisa-laajakaista.fi [88.115.248.186])
        by fgw21.mail.saunalahti.fi (Halon) with ESMTP
        id 3b98e3ef-b175-11eb-9eb8-005056bdd08f;
        Mon, 10 May 2021 12:51:03 +0300 (EEST)
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Amireddy Mallikarjuna reddy 
        <mallikarjunax.reddy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Abanoub Sameh <abanoubsameh8@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: [PATCH v1 06/28] leds: el15203000: Introduce to_el15203000_led() helper
Date:   Mon, 10 May 2021 12:50:23 +0300
Message-Id: <20210510095045.3299382-7-andy.shevchenko@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
References: <20210510095045.3299382-1-andy.shevchenko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Introduce a helper to replace open coded container_of() calls.
At the same time move ldev member to be first in the struct el15203000_led,
that makes container_of() effectivelly a no-op.

Signed-off-by: Andy Shevchenko <andy.shevchenko@gmail.com>
---
 drivers/leds/leds-el15203000.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/leds-el15203000.c b/drivers/leds/leds-el15203000.c
index fcb90d7cd42f..e81a93d57210 100644
--- a/drivers/leds/leds-el15203000.c
+++ b/drivers/leds/leds-el15203000.c
@@ -69,8 +69,8 @@ enum el15203000_command {
 };
 
 struct el15203000_led {
-	struct el15203000	*priv;
 	struct led_classdev	ldev;
+	struct el15203000	*priv;
 	u32			reg;
 };
 
@@ -83,6 +83,8 @@ struct el15203000 {
 	struct el15203000_led	leds[];
 };
 
+#define to_el15203000_led(d)	container_of(d, struct el15203000_led, ldev)
+
 static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
 {
 	int		ret;
@@ -124,9 +126,7 @@ static int el15203000_cmd(struct el15203000_led *led, u8 brightness)
 static int el15203000_set_blocking(struct led_classdev *ldev,
 				   enum led_brightness brightness)
 {
-	struct el15203000_led *led = container_of(ldev,
-						  struct el15203000_led,
-						  ldev);
+	struct el15203000_led *led = to_el15203000_led(ldev);
 
 	return el15203000_cmd(led, brightness == LED_OFF ? EL_OFF : EL_ON);
 }
@@ -135,9 +135,7 @@ static int el15203000_pattern_set_S(struct led_classdev *ldev,
 				    struct led_pattern *pattern,
 				    u32 len, int repeat)
 {
-	struct el15203000_led *led = container_of(ldev,
-						  struct el15203000_led,
-						  ldev);
+	struct el15203000_led *led = to_el15203000_led(ldev);
 
 	if (repeat > 0 || len != 2 ||
 	    pattern[0].delta_t != 4000 || pattern[0].brightness != 0 ||
@@ -188,10 +186,8 @@ static int el15203000_pattern_set_P(struct led_classdev *ldev,
 				    struct led_pattern *pattern,
 				    u32 len, int repeat)
 {
+	struct el15203000_led	*led = to_el15203000_led(ldev);
 	u8			cmd;
-	struct el15203000_led	*led = container_of(ldev,
-						    struct el15203000_led,
-						    ldev);
 
 	if (repeat > 0)
 		return -EINVAL;
@@ -228,9 +224,7 @@ static int el15203000_pattern_set_P(struct led_classdev *ldev,
 
 static int el15203000_pattern_clear(struct led_classdev *ldev)
 {
-	struct el15203000_led	*led = container_of(ldev,
-						    struct el15203000_led,
-						    ldev);
+	struct el15203000_led *led = to_el15203000_led(ldev);
 
 	return el15203000_cmd(led, EL_OFF);
 }
-- 
2.31.1

