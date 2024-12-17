Return-Path: <linux-leds+bounces-3626-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D299F4CBE
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 14:47:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A43E7A39B0
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2024 13:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4C771E47BA;
	Tue, 17 Dec 2024 13:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="Cm0lGAJK"
X-Original-To: linux-leds@vger.kernel.org
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F3C14A4E0
	for <linux-leds@vger.kernel.org>; Tue, 17 Dec 2024 13:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734443249; cv=none; b=Gw15hNWutQHAloucWcCmM55+D3heUArNcH2lgO5jNqCS0ovIzCCnC6faPJIqn2y3NDrD4DRS2L/9SeEZr+Pqljq0lbCiyAXcZ1ltUZ4puWtrX+DwL6h0ChxEfIdblF2HECoQ/H9hRLhqxir+K6W6nPzmLUwaxrOUyXj6M5R7Pgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734443249; c=relaxed/simple;
	bh=mpkF+KliBxkXe4shpr+AtFSOJ/VGLkhExDly5Dww5cc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XkyYp+ygOwvEc4KrLBj9ybkmwKqKqFlSSVpnATIC8FlxTn7sTm58+8AKRt48PczRN4NoNWaKpnlXhOxiNxqjKaqh2fKeZDdLi4p36OUvyNjKKdQQZ29uqrPlgQ474pjL/WbTuUD4LjYKET9n93yUlqiutqkr01prVIp5EdTnxD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=Cm0lGAJK; arc=none smtp.client-ip=185.136.64.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2024121713371680c57d072fdedafe82
        for <linux-leds@vger.kernel.org>;
        Tue, 17 Dec 2024 14:37:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=xps1rrCB3ezPJ4SU0woL1vnK1r7e4vQ0fCMaUaYxnw8=;
 b=Cm0lGAJKNqKz4a6e4hmKrz8lX8irurHB7Wj0fDx/31/eH61KiNf42YdQ34A80oICyxQfn2
 oBPV1irvQxAVMW/LLovQq30Pw4xCmmyjj6GRmaZwrisJkqfyMa4aexEQ80j62mtkhrsn8aKe
 pR0yQRvyy3k04BTaF5ylKHLhytjc3CVuzx0Z4CT7OnGdhadIEzb+aPM/wWUacsYMUOSvBv+t
 slHxPkGPEziOOxHDXboxuKkc+Xe0rRUav44U42o1LuLmH/SX7E1cwZLsjrFKdV5c06YFXMMh
 sP2H28I5hjl9ZHkBeNhPr9IQ+QqGqr2Al74OgJCpEwGVmYbOMIGHY08Q==;
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
Subject: [PATCH v4 0/2] leds: TI LP8864/LP8866 support
Date: Tue, 17 Dec 2024 14:37:08 +0100
Message-ID: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
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


