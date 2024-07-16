Return-Path: <linux-leds+bounces-2282-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AF77B933384
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2024 23:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E05211C2289E
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2024 21:25:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5102676056;
	Tue, 16 Jul 2024 21:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cT4WdwSs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203D53CF4F;
	Tue, 16 Jul 2024 21:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721165102; cv=none; b=T5OuZ2O4i9nLupTsT54falqnIRrluNa/ns/J6oJQmzxxXVQ8QSEncYlDx1ct+E10YWNXSNExWkuAvIbbsunkUXVcIdBTIQrxMfyav9W7eN+anXsByp0GBVCu77v5Od3BInPStnQO1anbq8XHapRiVkvsJCijGTh/lVh5v2MOMmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721165102; c=relaxed/simple;
	bh=0KfPRo37su5mr39AobY7aI+apgV4uSA31yq4ETtf3q4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rUUQg6cuHw6SzBgXDgf1C9OAjc/Ez4v7A1RNiGd6ndUk3nMnxhEFoqpZYizAAfjkBNv7+1rrJsJXA5uiWmFd4AWOEyzGx7f1l+R9prcaXs1wdHNh9NYhf0FyGtIHuQjtkK/A54IRJJNjoLu0oSjK09L3cLbnny/l4tlCmATFfHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cT4WdwSs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A32B6C116B1;
	Tue, 16 Jul 2024 21:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721165101;
	bh=0KfPRo37su5mr39AobY7aI+apgV4uSA31yq4ETtf3q4=;
	h=From:To:Cc:Subject:Date:From;
	b=cT4WdwSs1mqdz/s17edCI/V3iOy0/eezJULLPdCn0ScoQ9gjRm6GG9A0Y3yNMj9FT
	 DqwuBfHS7QWPy1qqalRyFbmHZzX9KFSWendVXJvYiiNdtWAeNysucScSzeb+cpLpNT
	 5IV6dKWaJLC9jnWQlIgEKYkthvF1ofv8uDlBiIrvZAnLxzN32vleA8lDGG5Z2Pi7yr
	 E7ZpTY842xR1AmDE6OQIShidO+gMtwzy899PlyWr5GANts7oQbrR4vudM/M6LJDs+z
	 C3e6vNGf4e5lDpIZX9SSICgIT90LgkIbeVlxa3+GNeBkuslg6eH6/lnO/30cY25bdi
	 3MpMmqwWBemiw==
From: Kees Cook <kees@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] leds: gpio: Set num_leds after allocation
Date: Tue, 16 Jul 2024 14:24:59 -0700
Message-Id: <20240716212455.work.809-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1999; i=kees@kernel.org; h=from:subject:message-id; bh=0KfPRo37su5mr39AobY7aI+apgV4uSA31yq4ETtf3q4=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBmluUrFMNdfqaChiBzifkfXBx9T8v2qRVdtSBv7 e9TqnvSKzaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZpblKwAKCRCJcvTf3G3A Jj/xD/9PX+RUqRgBfnbRviA/Sw9wZTm7Nak1JVZQj36Rg1oiaLvmtlU8QZVM+GBmjBUTqJdPmiB QdexpPQQ5vUkh0h68D7YPsNkN1g1iB35pPmfHSHrqGPVyYKYSMKUpSAARdcHLAbBv71e0NdkNUp UJi/BHiiX1Vm7HP+X2lt+egQGHBH+xJQv5Ojaxa+Sr3HnCyvAW8aH1nAnjMHlEO+u7rCUmNkr3x Mcc3ISmQ2skH+dZ8oJHZtiBx9K4UqCoTmWA+smqq+DfSoRDmIE/0D3KThF3mbXzaP9jIG1C0BuQ +yeReWtNR9pqEka4PwCL2k5d2uwFAE6cFYDw9cZ3QVeZjztFMkIz3vmeBLwvoo/jQ0CFIfX6a6b /ybvqHHyZbIw/kia8aACFbZBJ6V32tA1RGQ8nX2AdWwdZBMbDzkvwoUOF8ibqzy3bJfKI94RVoU M1g/CKeJA6s43zbTH9JsGw1h/ytNy/yyZdbZhdcSta5aku67mh09kPW2iOjhrNuy50ISR4X8K41 1IyRD32ujlWOb8HU9BHwZu1S34dGs/VuD4GitjkM6Cac+WuQlMNbJfKjiatXrQDNqTUHWzgKi9y nsRFKnSt8x4Q2bA5hAx5LRIzl0SEYOE5ltwOhAswS3eTDaBHQh97k7izEj8WRao2Aw8Zmk4toJw hxDcDs5IhqsCU
 SQ==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With the new __counted_by annotation, the "num_leds" variable needs to
valid for accesses to the "leds" array. This requirement is not met in
gpio_leds_create(), since "num_leds" starts at "0", so "leds" index "0"
will not be considered valid (num_leds would need to be "1" to access
index "0").

Fix this by setting the allocation size after allocation, and then update
the final count based on how many were actually added to the array.

Fixes: 52cd75108a42 ("leds: gpio: Annotate struct gpio_leds_priv with __counted_by")
Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/leds-gpio.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index 83fcd7b6afff..4d1612d557c8 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -150,7 +150,7 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 {
 	struct fwnode_handle *child;
 	struct gpio_leds_priv *priv;
-	int count, ret;
+	int count, used, ret;
 
 	count = device_get_child_node_count(dev);
 	if (!count)
@@ -159,9 +159,11 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 	priv = devm_kzalloc(dev, struct_size(priv, leds, count), GFP_KERNEL);
 	if (!priv)
 		return ERR_PTR(-ENOMEM);
+	priv->num_leds = count;
+	used = 0;
 
 	device_for_each_child_node(dev, child) {
-		struct gpio_led_data *led_dat = &priv->leds[priv->num_leds];
+		struct gpio_led_data *led_dat = &priv->leds[used];
 		struct gpio_led led = {};
 
 		/*
@@ -197,8 +199,9 @@ static struct gpio_leds_priv *gpio_leds_create(struct device *dev)
 		/* Set gpiod label to match the corresponding LED name. */
 		gpiod_set_consumer_name(led_dat->gpiod,
 					led_dat->cdev.dev->kobj.name);
-		priv->num_leds++;
+		used++;
 	}
+	priv->num_leds = used;
 
 	return priv;
 }
-- 
2.34.1


