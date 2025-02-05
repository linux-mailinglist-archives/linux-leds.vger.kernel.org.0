Return-Path: <linux-leds+bounces-3879-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE38A2995B
	for <lists+linux-leds@lfdr.de>; Wed,  5 Feb 2025 19:42:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7C67167F91
	for <lists+linux-leds@lfdr.de>; Wed,  5 Feb 2025 18:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54381FCFE1;
	Wed,  5 Feb 2025 18:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b="sCjnhs6c"
X-Original-To: linux-leds@vger.kernel.org
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF50B18A6BA;
	Wed,  5 Feb 2025 18:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.255.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738780933; cv=none; b=M9vhwtrVr41Mmll+wGvv4IGc4mwXRCk296KikuNzJgJYjZpQb8clYqOOqHk/zC5mfyGV1ELsehhhZl7y/Lof96tKvu3+iHY5X3w4hNOgdONRPdCEpgQ55FBhZgWSxaV/s412FdTAhRwkaHMoSzkECM0A/+Wgs9C0r7QMY3fVNNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738780933; c=relaxed/simple;
	bh=dqGUavhijqGEyr/tlFVlIYXWChNpY0JSiLMSWCF+Hkk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=igRnJH5i/nGZzJxg0PT66vNkXPMH7VBtALkKHcAmahJ53C8TGT7ZIv41Swxk8a7jbHUPtFa82AnKojI4oxDewHw4j+LLwe5YLn55ECkIvBehNChJ2MNOrc2oYjYkFqwCxawCxkrD/HJ489fgesTQcP4oaNBXOMLCTA62uzE3Ues=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz; spf=pass smtp.mailfrom=ucw.cz; dkim=pass (1024-bit key) header.d=ucw.cz header.i=@ucw.cz header.b=sCjnhs6c; arc=none smtp.client-ip=46.255.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ucw.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ucw.cz
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 301611C01AF; Wed,  5 Feb 2025 19:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1738780922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=W88bnLJlbAiShrhCX0Fpc30+x5SimAUGug5fBCsEMrA=;
	b=sCjnhs6cMyIUEd4d1MKEuoyvN2usjRZlX86kJJWESWJbQ7Ke7qX6TsY+EXpdSQQe2mkYzy
	asG14mmxCorRzuzw6FEqis+HJLWCKb50nl+gdxMjghtaIsHtoseKxxDfRvj4xbiFqxrOkk
	gjqf8RSTFQiypOjA692sgK4jqXtldU8=
Date: Wed, 5 Feb 2025 19:42:01 +0100
From: Pavel Machek <pavel@ucw.cz>
To: kernel list <linux-kernel@vger.kernel.org>, rafael@kernel.org,
	lee@kernel.org, linux-leds@vger.kernel.org,
	torvalds@linux-foundation.org
Subject: MAINTAINERS: Move Pavel to kernel.org address
Message-ID: <Z6Ow+T/uSv128wdR@duo.ucw.cz>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IUT7SeHH6a4C2OZg"
Content-Disposition: inline


--IUT7SeHH6a4C2OZg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

I need to filter my emails better, switch to pavel@kernel.org address
to help with that.
   =20
Signed-off-by: Pavel Machek <pavel@ucw.cz>
---
I guess this should go through the LED tree?


diff --git a/CREDITS b/CREDITS
index 1f9f0f078b4ae..53d11a46fd698 100644
--- a/CREDITS
+++ b/CREDITS
@@ -2515,11 +2515,9 @@ D: SLS distribution
 D: Initial implementation of VC's, pty's and select()
=20
 N: Pavel Machek
-E: pavel@ucw.cz
+E: pavel@kernel.org
 P: 4096R/92DFCE96 4FA7 9EEF FCD4 C44F C585  B8C7 C060 2241 92DF CE96
-D: Softcursor for vga, hypertech cdrom support, vcsa bugfix, nbd,
-D: sun4/330 port, capabilities for elf, speedup for rm on ext2, USB,
-D: work on suspend-to-ram/disk, killing duplicates from ioctl32,
+D: NBD, Sun4/330 port, USB, work on suspend-to-ram/disk,
 D: Altera SoCFPGA and Nokia N900 support.
 S: Czech Republic
=20
diff --git a/MAINTAINERS b/MAINTAINERS
index e7ebcecf2b7d0..67825dbee7348 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9424,7 +9424,7 @@ F:	fs/freevxfs/
=20
 FREEZER
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
-M:	Pavel Machek <pavel@ucw.cz>
+M:	Pavel Machek <pavel@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 F:	Documentation/power/freezing-of-tasks.rst
@@ -10259,7 +10259,7 @@ F:	drivers/video/fbdev/hgafb.c
=20
 HIBERNATION (aka Software Suspend, aka swsusp)
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
-M:	Pavel Machek <pavel@ucw.cz>
+M:	Pavel Machek <pavel@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 B:	https://bugzilla.kernel.org
@@ -13130,8 +13130,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/gi=
t/kees/linux.git for-next/har
 F:	scripts/leaking_addresses.pl
=20
 LED SUBSYSTEM
-M:	Pavel Machek <pavel@ucw.cz>
 M:	Lee Jones <lee@kernel.org>
+M:	Pavel Machek <pavel@kernel.org>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git
@@ -16787,7 +16787,7 @@ F:	include/linux/tick.h
 F:	kernel/time/tick*.*
=20
 NOKIA N900 CAMERA SUPPORT (ET8EK8 SENSOR, AD5820 FOCUS)
-M:	Pavel Machek <pavel@ucw.cz>
+M:	Pavel Machek <pavel@kernel.org>
 M:	Sakari Ailus <sakari.ailus@iki.fi>
 L:	linux-media@vger.kernel.org
 S:	Maintained
@@ -22812,7 +22812,7 @@ F:	drivers/sh/
 SUSPEND TO RAM
 M:	"Rafael J. Wysocki" <rafael@kernel.org>
 M:	Len Brown <len.brown@intel.com>
-M:	Pavel Machek <pavel@ucw.cz>
+M:	Pavel Machek <pavel@kernel.org>
 L:	linux-pm@vger.kernel.org
 S:	Supported
 B:	https://bugzilla.kernel.org

--=20
People of Russia, stop Putin before his war on Ukraine escalates.

--IUT7SeHH6a4C2OZg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCZ6Ow+QAKCRAw5/Bqldv6
8gA9AKCyf8IRcKiOrVC+p5ecK6J4UH4T1QCfcbheh91JTmeHXzeg/s49tSxySGk=
=neio
-----END PGP SIGNATURE-----

--IUT7SeHH6a4C2OZg--

