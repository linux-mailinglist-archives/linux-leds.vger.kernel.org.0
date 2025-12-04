Return-Path: <linux-leds+bounces-6375-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4A5CA2023
	for <lists+linux-leds@lfdr.de>; Thu, 04 Dec 2025 01:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50457300ACE3
	for <lists+linux-leds@lfdr.de>; Thu,  4 Dec 2025 00:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27DE62F39B4;
	Thu,  4 Dec 2025 00:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VSsZIlEl"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A1257423;
	Thu,  4 Dec 2025 00:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764806431; cv=none; b=czFhGogZG4p+0s4YvSm/bWZXtAcqQLRqeS/GDD0fAphCpe97OU4GMNrphcIUu911oQgGFzllqWdIMS8keF+u6vU5hb7WjY3JtR5k5e5dGPfvfSoQ3xVHBG24oDGCpfjJOgLXOCN7d9vpPES7Hj/CBqcDS5vV3vU99EoE+GOpoL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764806431; c=relaxed/simple;
	bh=RmzqbENcigN+/N9ttogRVF3nlDiwJKyUSgVC/gXr80c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JaNICc7QumU5dXVhFXFTZ6/yCO/pMDvocnFDYReTsUSY5Ao67DDt/CDQaBPVL0/DvrI4M/7h8nFgxy2Z00JHyJyBL0MlYKte2SaZYxdj9dy9iqDqxIFBQIdbo7jRXqfEym2+LoD4tmxyJeMUpuNLbzjGiRezaYFtwVd0gARaqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VSsZIlEl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56699C4CEF5;
	Thu,  4 Dec 2025 00:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764806431;
	bh=RmzqbENcigN+/N9ttogRVF3nlDiwJKyUSgVC/gXr80c=;
	h=Date:From:To:Cc:Subject:From;
	b=VSsZIlElMOBGSBxuC5nfA+wjbZoyzgQHzvZ1W4UK6z2fM2CmSbo4hgdzmyrB3XwvS
	 zrQdtPGMqTkT3VTWbNDDvljh5H/7vAaeIue9U6cnfOjimDccWOpIVGW4JRUbCGRi7x
	 s6dgQnzU0/fwD6MmJmI2zsVPwaWsO2BHSSCDi5q+dsTIPew9/ocebV8W/iamnKcT4Y
	 BSf4SzTd9/17houGpc//Ajf8LN5nGvCmjutDxxK8OX3MyAitbtAQUUH3wC7GD7I2K3
	 +Jks/pGoaOYyLAECSF/JPpDNp/y6DfEuDq1aDiME5osnCBDDtjeT3bBwEnF4e1T/cj
	 8ZbKGARwq9uag==
Date: Wed, 3 Dec 2025 17:00:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-leds@vger.kernel.org,
	Stefan Kalscheuer <stefan@stklcode.de>
Subject: Apply ccc35ff2fd2911986b716a87fe65e03fac2312c9 to 5.15, 6.1, and 6.6
Message-ID: <20251204000025.GA468348@ax162>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Hz+hp81qPmbwKaze"
Content-Disposition: inline


--Hz+hp81qPmbwKaze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi stable folks,

Please apply commit ccc35ff2fd29 ("leds: spi-byte: Use
devm_led_classdev_register_ext()") to 5.15, 6.1, and 6.6. It
inadvertently addresses an instance of -Wuninitialized visible with
clang-21 and newer:

  drivers/leds/leds-spi-byte.c:99:26: error: variable 'child' is uninitialized when used here [-Werror,-Wuninitialized]
     99 |         of_property_read_string(child, "label", &name);
        |                                 ^~~~~
  drivers/leds/leds-spi-byte.c:83:27: note: initialize the variable 'child' to silence this warning
     83 |         struct device_node *child;
        |                                  ^
        |                                   = NULL

It applies cleanly to 6.6. I have attached a backport for 6.1 and 5.15,
which can be generated locally with:

  $ git format-patch -1 --stdout ccc35ff2fd2911986b716a87fe65e03fac2312c9 | sed 's;strscpy;strlcpy;' | patch -p1

This change seems safe to me but if I am missing a massive dependency
chain, an alternative would be moving child's initialization up in these
stable branches.

Cheers,
Nathan

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 82696e0607a5..7dd876df8b36 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -96,6 +96,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	if (!led)
 		return -ENOMEM;
 
+	child = of_get_next_available_child(dev_of_node(dev), NULL);
 	of_property_read_string(child, "label", &name);
 	strlcpy(led->name, name, sizeof(led->name));
 	led->spi = spi;
@@ -106,7 +107,6 @@ static int spi_byte_probe(struct spi_device *spi)
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
 
-	child = of_get_next_available_child(dev_of_node(dev), NULL);
 	state = of_get_property(child, "default-state", NULL);
 	if (state) {
 		if (!strcmp(state, "on")) {

--Hz+hp81qPmbwKaze
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=ccc35ff2fd2911986b716a87fe65e03fac2312c9-5.15-6.1.patch

From 45fa848142bf47813b7b08679f28f2ddc6b3ad82 Mon Sep 17 00:00:00 2001
From: Stefan Kalscheuer <stefan@stklcode.de>
Date: Sun, 4 Feb 2024 16:07:26 +0100
Subject: [PATCH 5.15 and 6.1] leds: spi-byte: Use
 devm_led_classdev_register_ext()

commit ccc35ff2fd2911986b716a87fe65e03fac2312c9 upstream.

Use extended classdev registration to generate generic device names from
color and function enums instead of reading only the label from the
device tree.

Signed-off-by: Stefan Kalscheuer <stefan@stklcode.de>
Link: https://lore.kernel.org/r/20240204150726.29783-1-stefan@stklcode.de
Signed-off-by: Lee Jones <lee@kernel.org>
[nathan: Fix conflict due to lack of bf4a35e9201d]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 drivers/leds/leds-spi-byte.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-spi-byte.c b/drivers/leds/leds-spi-byte.c
index 6883d3ba382f..eb6481df5997 100644
--- a/drivers/leds/leds-spi-byte.c
+++ b/drivers/leds/leds-spi-byte.c
@@ -83,7 +83,7 @@ static int spi_byte_probe(struct spi_device *spi)
 	struct device_node *child;
 	struct device *dev = &spi->dev;
 	struct spi_byte_led *led;
-	const char *name = "leds-spi-byte::";
+	struct led_init_data init_data = {};
 	const char *state;
 	int ret;
 
@@ -96,12 +96,9 @@ static int spi_byte_probe(struct spi_device *spi)
 	if (!led)
 		return -ENOMEM;
 
-	of_property_read_string(child, "label", &name);
-	strlcpy(led->name, name, sizeof(led->name));
 	led->spi = spi;
 	mutex_init(&led->mutex);
 	led->cdef = device_get_match_data(dev);
-	led->ldev.name = led->name;
 	led->ldev.brightness = LED_OFF;
 	led->ldev.max_brightness = led->cdef->max_value - led->cdef->off_value;
 	led->ldev.brightness_set_blocking = spi_byte_brightness_set_blocking;
@@ -121,7 +118,11 @@ static int spi_byte_probe(struct spi_device *spi)
 	spi_byte_brightness_set_blocking(&led->ldev,
 					 led->ldev.brightness);
 
-	ret = devm_led_classdev_register(&spi->dev, &led->ldev);
+	init_data.fwnode = of_fwnode_handle(child);
+	init_data.devicename = "leds-spi-byte";
+	init_data.default_label = ":";
+
+	ret = devm_led_classdev_register_ext(&spi->dev, &led->ldev, &init_data);
 	if (ret) {
 		of_node_put(child);
 		mutex_destroy(&led->mutex);

base-commit: f6e38ae624cf7eb96fb444a8ca2d07caa8d9c8fe
-- 
2.52.0


--Hz+hp81qPmbwKaze--

