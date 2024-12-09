Return-Path: <linux-leds+bounces-3527-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEFC59E8DC0
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 09:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90E4528129F
	for <lists+linux-leds@lfdr.de>; Mon,  9 Dec 2024 08:47:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D4922156ED;
	Mon,  9 Dec 2024 08:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="ZvIvdBTk"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F711EB3D
	for <linux-leds@vger.kernel.org>; Mon,  9 Dec 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.65.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733734065; cv=none; b=fbt/pWdiaU2oJyqMNj/RXoFjCHPDWzIoUuPvdFN431RgkcvIqTumfV2aidhwo1MuDCSyx63YSja4XztaamzMvnoHC0N9wXiu2vkiV3XmXiOl18oDyPazM1I8Dz57hranVFDUeQfIWG6+AbhCCOT9yTglRCRWbANSVqZBTavHORQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733734065; c=relaxed/simple;
	bh=yFeXdguKgezhZbeXdHwIiUAIjL7X5X2LJxGISo88gHw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4lyJjMHszqZi2Can7AXdVNgw35wW87EirUf6tiXYxvjjtngVeiz4Fmq11TOHDnz7nn3d92BaKMQy0rs0xGJNyG3gSasMoweXOKCU71y9f8UEDUwSjDNbVgg26fn+ZlEbnP2r/Rs+ufNIvbK+F1tJb6i4XDxCa2R/uJBF44MuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=ZvIvdBTk; arc=none smtp.client-ip=185.136.65.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241209084734fddf48d759cb3aa8af
        for <linux-leds@vger.kernel.org>;
        Mon, 09 Dec 2024 09:47:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RcFkfLf5JHyNV6VrGv7B7FQVpfdFZ2qiET5cMOD+/WQ=;
 b=ZvIvdBTk3CLXAAm+2TSeOBpveKVrq4b9o6RH7efhV600PbOVFrau9iSrTe4ETTx2XI/4Nj
 rShmzzeBpyPI2WEGb2o7Ayxhv6DoBM7WdMrVauZZ+m+M3nQ0mSYm2n1kwAj/vHQLr7K73n8j
 mSdR5Eg1akQ67+0X7LrnP3ERD/mwjHYo+tuflUQN23pEy0LxzilGG3URpkUd/aACRzEdj2U4
 jkaKNOzoOTlIy1AHsXsXrIJ8pNyiqOU4KSSjv4PXwjgfKucyReHt6iSUDQMzj+ty5teFofjE
 4vAVLhCYh91MJjfnH8PJ0qzffFB2t1YFaYbZ0JwfIALt0w2Cetna+9BA==;
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
Subject: [PATCH v3 0/2] leds: TI LP8864/LP8866 support
Date: Mon,  9 Dec 2024 09:45:52 +0100
Message-ID: <20241209084602.1199936-1-alexander.sverdlin@siemens.com>
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
 drivers/leds/leds-lp8864.c                    | 308 ++++++++++++++++++
 5 files changed, 408 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/ti,lp8864.yaml
 create mode 100644 drivers/leds/leds-lp8864.c

-- 
2.47.1


