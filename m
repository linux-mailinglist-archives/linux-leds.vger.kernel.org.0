Return-Path: <linux-leds+bounces-4514-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA2A954E7
	for <lists+linux-leds@lfdr.de>; Mon, 21 Apr 2025 18:48:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F318188CAE5
	for <lists+linux-leds@lfdr.de>; Mon, 21 Apr 2025 16:48:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081B01DF987;
	Mon, 21 Apr 2025 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b="ecvrlceF"
X-Original-To: linux-leds@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F0F19EEC2;
	Mon, 21 Apr 2025 16:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745254095; cv=none; b=q+FP9S/BxMw9i/wmVbkgqcqF9ms/z5+MMZoH7ZVdgcV4urwCrh46jbZ5kg9lA9SxKZDIeB3ecjXh4jtX66PGVg3J152X0237yjJ6LiYCD59beJTwj69qPes9DfWq6dxMpPZph2zofpIpCb2Wy4L4XpOo8h1vqF7KCd09IwAB5E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745254095; c=relaxed/simple;
	bh=/tK3sIZlvTVXL1AqkahXEqxCunTN+wspkqhfEsQBYck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H9EDe5/6LerC/Z0qbm6HRH53BQzInrhy+qAq8iaZQ+MeoV/ZUi/jM57D8Cp41IBpGR/zTNAeKPPqf12zOtbm+WSVZnoyN4jmGQYk3envrXWirn1BH5Dgy2w+pcI0Ck1TzpZq+GBSHBeKEPhl9OCZCqz7+pSc4qtl/J+SDHYzStM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org; spf=none smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=ecvrlceF; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yoseli.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=yoseli.org
Received: by mail.gandi.net (Postfix) with ESMTPSA id 59ADB1FCE7;
	Mon, 21 Apr 2025 16:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1745254091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8Wydmx6J8Tuk/Z9v2iT98KTnfLpfhuZCfqQDwitKfLk=;
	b=ecvrlceFdRFSRL1CLRljZqlIwGXPseetDqR8AabhnJfdWsEl+EVwGDbU66Z7p/enbU7+Qu
	vgcK/2qOioYLCy9q7QwoHhrwZqH5SdRssAzAKFo6pMNKt6ONdqRyUAqkhZ1Z7bSoDWp3Tg
	+DQ07Kf5QWQL3/P9Yi3Z9vp40HakP74dLrE81J6lxPoycDZbbwBsJrfRtMmHGkXB+Xx7ue
	pqcXOcwFP2JQVaWvLuRlpttWMu/23+fcaq94BbGxNpnAMvpSPBuZ5OF/OsFMGbtLUus/2C
	A86+kna6cueZXSpUuAdtevVCivAcy2R862/1HnAbFyplR1PNxdv7IIY7wuH9Ww==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Date: Mon, 21 Apr 2025 18:48:10 +0200
Subject: [PATCH] Documentation: leds: improve readibility of multicolor doc
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-leds-doc-v1-1-9a32df7fc6f4@yoseli.org>
X-B4-Tracking: v=1; b=H4sIAMl2BmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyND3ZzUlGLdlPxk3ZQUC9OUJEPjtJREEyWg8oKi1LTMCrBR0bG1tQA
 vVk/eWgAAAA==
X-Change-ID: 20250421-leds-doc-dd85db13fda4
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-leds@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745254090; l=5312;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=/tK3sIZlvTVXL1AqkahXEqxCunTN+wspkqhfEsQBYck=;
 b=SZhH/NJGUSmviK+JACejFEzh+V1snC8nHOqYG7DEtUPZ84MntSVYN28U9xfwKc7SNPeUpMwfZ
 ixWbEMU6cK+Akc57wCvIj7kmQOZpZXufsWArGDUBh9i+covpGqqQg2m
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgedufeejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkvfevofesthejredtredtjeenucfhrhhomheplfgvrghnqdfoihgthhgvlhcujfgruhhtsghoihhsuceojhgvrghnmhhitghhvghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgqeenucggtffrrghtthgvrhhnpefggfetteeuteegueetgeetvdetjeevueeguedvudfgfeegffektdevvdefvdffheenucfkphepvdgrtddumegvtdgrmeduieelmeejudegtdemlegsrgeimeehlegsugemtggvvdefmehffeejgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemudeileemjedugedtmeelsggrieemheelsggumegtvgdvfeemfhefjeegpdhhvghlohephihoshgvlhhiqdihohgtthhordihohhsvghlihdrohhrghdpmhgrihhlfhhrohhmpehjvggrnhhmihgthhgvlhdrhhgruhhtsghoihhsseihohhsvghlihdrohhrghdpnhgspghrtghpthhtohepjedprhgtphhtthhopehprghvvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepjhgvrghnmhhitghhv
 ghlrdhhrghuthgsohhisheshihoshgvlhhirdhorhhgpdhrtghpthhtoheptghorhgsvghtsehlfihnrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqlhgvughssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: jeanmichel.hautbois@yoseli.org

When reading the documentation of multicolor leds, the HTML output is
not easy to read. Improve it by adding a few markups, splitting the
console in a dedicated block.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
 Documentation/leds/leds-class-multicolor.rst | 82 +++++++++++++++++-----------
 1 file changed, 51 insertions(+), 31 deletions(-)

diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
index c57b98bfd38715b705c555efeb8e5f9076b1b787..c6b47b4093c47360b238b49d3cbfa055a9b484e5 100644
--- a/Documentation/leds/leds-class-multicolor.rst
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -18,24 +18,28 @@ array.  These files are children under the LED parent node created by the
 led_class framework.  The led_class framework is documented in led-class.rst
 within this documentation directory.
 
-Each colored LED will be indexed under the multi_* files. The order of the
-colors will be arbitrary. The multi_index file can be read to determine the
+Each colored LED will be indexed under the ``multi_*`` files. The order of the
+colors will be arbitrary. The ``multi_index`` file can be read to determine the
 color name to indexed value.
 
-The multi_index file is an array that contains the string list of the colors as
-they are defined in each multi_* array file.
+The ``multi_index`` file is an array that contains the string list of the colors as
+they are defined in each ``multi_*`` array file.
 
-The multi_intensity is an array that can be read or written to for the
+The ``multi_intensity`` is an array that can be read or written to for the
 individual color intensities.  All elements within this array must be written in
 order for the color LED intensities to be updated.
 
 Directory Layout Example
 ========================
-root:/sys/class/leds/multicolor:status# ls -lR
--rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
--r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
--r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
--rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
+.. code-block:: console
+
+    root:/sys/class/leds/multicolor:status# ls -lR
+    -rw-r--r--    1 root     root          4096 Oct 19 16:16 brightness
+    -r--r--r--    1 root     root          4096 Oct 19 16:16 max_brightness
+    -r--r--r--    1 root     root          4096 Oct 19 16:16 multi_index
+    -rw-r--r--    1 root     root          4096 Oct 19 16:16 multi_intensity
+
+..
 
 Multicolor Class Brightness Control
 ===================================
@@ -43,27 +47,31 @@ The brightness level for each LED is calculated based on the color LED
 intensity setting divided by the global max_brightness setting multiplied by
 the requested brightness.
 
-led_brightness = brightness * multi_intensity/max_brightness
+``led_brightness = brightness * multi_intensity/max_brightness``
 
 Example:
 A user first writes the multi_intensity file with the brightness levels
 for each LED that are necessary to achieve a certain color output from a
 multicolor LED group.
 
-cat /sys/class/leds/multicolor:status/multi_index
-green blue red
+.. code-block:: console
+
+    # cat /sys/class/leds/multicolor:status/multi_index
+    green blue red
 
-echo 43 226 138 > /sys/class/leds/multicolor:status/multi_intensity
+    # echo 43 226 138 > /sys/class/leds/multicolor:status/multi_intensity
 
-red -
-	intensity = 138
-	max_brightness = 255
-green -
-	intensity = 43
-	max_brightness = 255
-blue -
-	intensity = 226
-	max_brightness = 255
+    red -
+    	intensity = 138
+    	max_brightness = 255
+    green -
+    	intensity = 43
+    	max_brightness = 255
+    blue -
+    	intensity = 226
+    	max_brightness = 255
+
+..
 
 The user can control the brightness of that multicolor LED group by writing the
 global 'brightness' control.  Assuming a max_brightness of 255 the user
@@ -71,16 +79,28 @@ may want to dim the LED color group to half.  The user would write a value of
 128 to the global brightness file then the values written to each LED will be
 adjusted base on this value.
 
-cat /sys/class/leds/multicolor:status/max_brightness
-255
-echo 128 > /sys/class/leds/multicolor:status/brightness
+.. code-block:: console
+
+    # cat /sys/class/leds/multicolor:status/max_brightness
+    255
+    # echo 128 > /sys/class/leds/multicolor:status/brightness
 
-adjusted_red_value = 128 * 138/255 = 69
-adjusted_green_value = 128 * 43/255 = 21
-adjusted_blue_value = 128 * 226/255 = 113
+..
+
+.. code-block:: none
+
+    adjusted_red_value = 128 * 138/255 = 69
+    adjusted_green_value = 128 * 43/255 = 21
+    adjusted_blue_value = 128 * 226/255 = 113
+
+..
 
 Reading the global brightness file will return the current brightness value of
 the color LED group.
 
-cat /sys/class/leds/multicolor:status/brightness
-128
+.. code-block:: console
+
+    # cat /sys/class/leds/multicolor:status/brightness
+    128
+
+..

---
base-commit: 9d7a0577c9db35c4cc52db90bc415ea248446472
change-id: 20250421-leds-doc-dd85db13fda4

Best regards,
-- 
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


