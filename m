Return-Path: <linux-leds+bounces-3497-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 434DD9E76E1
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 18:18:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D95C167D5C
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 17:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FCB31F3D22;
	Fri,  6 Dec 2024 17:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="P09x5WrM"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24046206296
	for <linux-leds@vger.kernel.org>; Fri,  6 Dec 2024 17:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733505533; cv=none; b=oRrKFKWu2prChOkRfTkQORXRbnkvZCG+txS745EB+jJKY4FJFrKldoagoMGYSWJE9MeD8rnd+1mGwX6tLnBcyNYImC5KIsQXTVyrKiU2mTKZW2snlbSsFwjBB6suiYQPkkL9diU5LAhjEwsi5kXUMi8PKm7arQ2B/FePoZM7FUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733505533; c=relaxed/simple;
	bh=G1zaeOpLnYHPGCo2Fc34GGU4kV+KKJjS+YmbxU0bd1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rutI6iUdDXcurPCvc+Y5v3Gb7hiuz6I7WY7j5LxrZTTqmc8ug0Ya1a5LwNiPY4nf2RgbkBV7RstEi8YMPV9U/6g9cvK19AMslOFocYWxZ9Ek+QUsV4RlXHRl/QEwyCDez2K31bWC7ld+ic4WssFC2TPdhBuTLgfDBrpYvCgUuic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=P09x5WrM; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202412061708394d30c104b115f19732
        for <linux-leds@vger.kernel.org>;
        Fri, 06 Dec 2024 18:08:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=B5HjcpprEx98dJUDojMaPd2m0E7QHD4EvFWFVtuTv6s=;
 b=P09x5WrMj2xriIbXq8qjVn5I7aEDhPz6lksS1y0lav9QU4U/rlBJA/02KXGO9EJECKExzq
 oW3y5baS913wZqAtfRSPAU1Y/Cx+88flJsngrOH1fqLea6POT6oPnt1hvy45BRqeipIVd6pF
 BMiE6l/dBq62RKOWz8hi9YAPNrbxT8F5D5+rtDvHAfbSsINGULym49x3T6tprPgRtnPEx/fE
 LVgI83aqhkX1Qu7ig+nBk81V3D+hBi+oAZ9avqsXW9Oh0FDHQEvuk26adK16c4BKlqC9MW1F
 0Tf9qHzc8lamhYYR3UVdOHA5ib45TOpeZUO+m3JrxfipBdBj3d4zCFJQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: Dan Murphy <dmurphy@ti.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	dri-devel@lists.freedesktop.org,
	Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@ucw.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH 0/2] leds: TI LP8864/LP8866 support
Date: Fri,  6 Dec 2024 18:07:11 +0100
Message-ID: <20241206170717.1090206-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add new DT compatible ti,lp8864 to support all four software-compatible
devices:
- LP8864
- LP8864S
- LP8866
- LP8866S
This is a new family with a functionality similar to LP8860 -- hence the
same (re-used) DT bindings. They had to be converted to YAML along the way.

Add the new driver for the above four chips. Despite similar functionality,
the I2C interface is completely different to LP8860 -- hence the separate
driver.

Alexander Sverdlin (2):
  dt-bindings: backlight: Convert LP8860 into YAML format adding LP886x
  leds: lp8864: New driver

 .../bindings/leds/backlight/ti,lp8860.yaml    |  86 +++++
 .../devicetree/bindings/leds/leds-lp8860.txt  |  50 ---
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp8864.c                    | 320 ++++++++++++++++++
 6 files changed, 426 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8860.yaml
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-lp8860.txt
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1


