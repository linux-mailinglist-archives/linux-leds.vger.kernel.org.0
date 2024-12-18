Return-Path: <linux-leds+bounces-3671-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1D09F6F5F
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 22:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4CC621641ED
	for <lists+linux-leds@lfdr.de>; Wed, 18 Dec 2024 21:18:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCD5B1FA8CE;
	Wed, 18 Dec 2024 21:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="nd4T+smf"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8BC1FAC29
	for <linux-leds@vger.kernel.org>; Wed, 18 Dec 2024 21:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734556727; cv=none; b=ANbvAB72hXkH/Q0CpsCvgOl+jOv3vDiARrXoSguRnuQ42xyHuX6+FXHCjY2QtdlhsuJ5Lz9m9bAgomTH0wGhF1+yuUFnox/6JsR+JHqFIevpmnENSEFDtkKsLr6wbk1D/tbgYWPrjWQ0RhwezOCH3YWsHeqvyaRldQI+uxsJni0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734556727; c=relaxed/simple;
	bh=mpkF+KliBxkXe4shpr+AtFSOJ/VGLkhExDly5Dww5cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o5bxqzHfBiFgfYl/AthVLQzaLRelbAtffumCYh961n3PjLx54+BmlQQYIm/nbKSpRc6vdFF2WzC4kbT+9zWQTRjnpMQVcWe3zjkwzsBIiXuGd/irxD0SBha+26C3LNS72FUpBAL1wqVSjFwiPyzAjL/9K6/eYsQfSL84zTCte0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=nd4T+smf; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 2024121821083231a935d03a9767a9e4
        for <linux-leds@vger.kernel.org>;
        Wed, 18 Dec 2024 22:08:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xps1rrCB3ezPJ4SU0woL1vnK1r7e4vQ0fCMaUaYxnw8=;
 b=nd4T+smfD0sdQa3oBs5N9xd4x7JVFIPhtIW8YVecNkzNJCP9ocrJ1scFeFSBf9veDUrqtG
 GrGX/+lPplSOpZSyuNn/mHJy1kyIF09mnf6PiymaYOjURmmnkFx45VMCckW/sADvr0Cp3XUx
 wvHRo/YucSOoTtI8a28YmEdY5uTsLfjQZIsVsoIHajXU0bcuRVeSlvBNnASRNU+/ZPK/6FFI
 V6VFi5qArIYL+cbnw0eeufukL0JD/4oEKnvP/OCWMFUJmcFs9uXlia+wltCeqIieMidgAk3X
 3r8NljmCwtu/07CR1CZBSGlHZAqXYd6Ck9xyqTY2PCl0p/hKxe6LLbrA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org,
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
Subject: [PATCH v5 0/2] leds: TI LP8864/LP8866 support
Date: Wed, 18 Dec 2024 22:08:25 +0100
Message-ID: <20241218210829.73191-1-alexander.sverdlin@siemens.com>
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

The series adds support for a family of Texas Instruments' automotive
high-efficiency LED drivers with boost controller. The four or six
high-precision current sinks support phase shifting that is automatically
adjusted based on the number of channels in use. LED brightness can be
controlled globally through the I2C interface or PWM input.

Add new DT bindings for ti,lp8864 to support all four software-compatible
devices:
- LP8864
- LP8864S
- LP8866
- LP8866S

Add leds class driver for these devices.

Alexander Sverdlin (2):
  dt-bindings: backlight: add TI LP8864/LP8866 LED-backlight drivers
  leds: lp8864: New driver

 .../bindings/leds/backlight/ti,lp8864.yaml    |  80 +++++
 MAINTAINERS                                   |   7 +
 drivers/leds/Kconfig                          |  12 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-lp8864.c                    | 296 ++++++++++++++++++
 5 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1


