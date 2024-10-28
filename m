Return-Path: <linux-leds+bounces-3180-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B8E9B2EDA
	for <lists+linux-leds@lfdr.de>; Mon, 28 Oct 2024 12:25:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79245B257AB
	for <lists+linux-leds@lfdr.de>; Mon, 28 Oct 2024 11:25:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E381DA0F5;
	Mon, 28 Oct 2024 11:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b="E5YYH84a"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B011D435F
	for <linux-leds@vger.kernel.org>; Mon, 28 Oct 2024 11:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730114662; cv=none; b=f4/P9aEARqg7yncTZ+4HD9xza8GxwU6SI9Rnzlr7mYCzHeKqN5e3X2yX33Mo1EhlO2WvphTyxmzi7+JYmhbx8F8aaYJMv61S6naKPcHFCACRtlcP5Sw+vaCw1HKtKjHsjjcX8j/iUd//mrTO85VZ8l2r+pJb1S34Dc1+1ODcrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730114662; c=relaxed/simple;
	bh=Ky5YBRYQATDBlfe9Lmh+zMWTk5LDfZ3E5jBpxDguYms=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dDWFIlbSTuX6GbP1y8R57N2vS589txEpef8GR/hE/tKLSCedLgWm5dYBgbYo3QGl9BnI3H53TJMJ9xvRFWYcjhK45ZWBgwD+6E3B4u+PYka7/tUgSDVknardB4HQdqDIXBw2OljTnz9oPXynkzwYE7+Ho9eI/zZ3isWydT8H75o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=benedikt.niedermayr@siemens.com header.b=E5YYH84a; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2024102811241187e93832e66e15cd39
        for <linux-leds@vger.kernel.org>;
        Mon, 28 Oct 2024 12:24:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=benedikt.niedermayr@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YpfhoksL9PDDwInw2DZ2EdIAS8Ef5VZRAiLXmKgQ/IU=;
 b=E5YYH84aR8Od7Y/LAhHmacmnYuCIUBAepoH9NDnbAp83Fj1k5B2khb3eQiQvvH8WSjLpFq
 hVLq6cEFLGoNuk410ccEW1aloI2/tz1AYfbPZ+coEU9QRhxTp7gp/KaCcvcut2/QpDgIuLJ9
 aPGL47X2r/LfNic10XGVcFFJW8ni6qhMoWOm8/WS7HcqV8rxdb2BVSeqY7S8qUXIM9EseKTg
 9ZdPDJq6pYdLcvLe599tsEsWLSCNhId4Gm2/Xd3ncYnF3sCIGGIpxxntoVZsq6tyBGUIDq1z
 WMFmVlXgWml7NBF++hZyaPtn7E9HbnFkl17ONnnLXn6vvIWU6IGJOnpA==;
From: Benedikt Niedermayr <benedikt.niedermayr@siemens.com>
To: konstantin@linuxfoundation.org,
	baocheng.su@siemens.com,
	tobias.schaffner@siemens.com,
	pavel@ucw.cz,
	lee@kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	felix.moessbauer@siemens.com,
	christian.storm@siemens.com,
	quirin.gylstorff@siemens.com,
	chao.zeng@siemens.com
Subject: [PATCH 0/1] MAINTAINERS: replace bouncing maintainers
Date: Mon, 28 Oct 2024 12:23:58 +0100
Message-Id: <20241028112359.3333152-1-benedikt.niedermayr@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1323861:519-21489:flowmailer

Since there where complaints [1] about bouncing maintainers we have now a
replacement for maintainers that stepped away from their duties.

I'm going to address all participants from the above discussion, so that everybody
is informed about the change. I also added the related subsystem maintainers.
Please tell me if I should avoid this in the future, and whom I should exactly address
for changes in the MAINTAINERS file.


[1] https://www.spinics.net/lists/platform-driver-x86/msg47105.html

Benedikt Niedermayr (1):
  MAINTAINERS: replace bouncing maintainers

 MAINTAINERS | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

--
2.34.1

