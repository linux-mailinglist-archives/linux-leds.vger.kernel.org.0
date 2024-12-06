Return-Path: <linux-leds+bounces-3511-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BCB9E7AEE
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 22:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED431169107
	for <lists+linux-leds@lfdr.de>; Fri,  6 Dec 2024 21:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 205F122C6F1;
	Fri,  6 Dec 2024 21:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="b4d8QRXz"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7B22C6D6
	for <linux-leds@vger.kernel.org>; Fri,  6 Dec 2024 21:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733520353; cv=none; b=UJaPsPtPf6BNhNxa2O99pTHuFXfcTKqLzJILEZYWcMghxh9wc17sFO0iCB2+qiwkXo5KKsE8eGqTFluFSJHotX9kK/4ojfPilzFcM0g2u9WMNCXsi1KuqH66fBxgKoPIC3uaOKnyank4BKjp3ZQU4E89GZ7YCqB7WchPSTOIfmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733520353; c=relaxed/simple;
	bh=zwgyuqSZbpo5lsEIGKVTRRepIOJc/btWhkBXb9A+7gM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=klX3jAE08yYoBuZSlIbe1W/Z/9jIHdPrr13RzYUo0CJJRjL81HJnlWZ28VA+dNvZVh7T6zqkxF6Eho/331i5auYrmNGVsKU9uXuMM2X0srnwMbI/CGmUcATpJz3eSYc4CT67qk17CUecR4IoYJ7jK3a70OB42JIOn+RHMhxGHYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=b4d8QRXz; arc=none smtp.client-ip=185.136.65.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202412062125462d445fa29ebb3e9a0a
        for <linux-leds@vger.kernel.org>;
        Fri, 06 Dec 2024 22:25:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VGAi1Tip6Q2fjBl44Ct3hhDKQbzd+Zjis1nKE/QhpU0=;
 b=b4d8QRXzn9FuuCE3zqlVu44EwUimgwVe7VItQ6C6tI5T3mZKjoWdli/NcHkTyCdoQ2qnRu
 JDaNmcDjKbF3K0meM/DfHWlEJwjrs54K/J47u+AuyXZv5+x5nEgk5eWKpHM/MUttvRX362O1
 koa4HaEHDawYWq/COtBePJ4dMamoD9FN62g8VA78inIG3kwP3ZzakKZQHmnV6aZcOfPp6QSR
 sFX1Evod4YMLmziuE/GZy/v/FxuPVYzF3QoVLSYIcj3vrUtU8BWgWQNs1a+1L+iUAAdPzkxn
 i7CBBFSXC606rlxFi83c2wMWwtfnUNJs7pTIg8UYTx2D1dtz5RKNwrnQ==;
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
Subject: [PATCH v2 0/2] leds: TI LP8864/LP8866 support
Date: Fri,  6 Dec 2024 22:24:17 +0100
Message-ID: <20241206212421.1132578-1-alexander.sverdlin@siemens.com>
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
 drivers/leds/leds-lp8864.c                    | 320 ++++++++++++++++++
 5 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1


