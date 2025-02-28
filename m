Return-Path: <linux-leds+bounces-4127-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CADA497C8
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 11:51:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D11173B7918
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2025 10:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAB525F987;
	Fri, 28 Feb 2025 10:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b="pY4wToIH"
X-Original-To: linux-leds@vger.kernel.org
Received: from lx20.hoststar.hosting (lx20.hoststar.hosting [168.119.41.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1A25F981;
	Fri, 28 Feb 2025 10:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.41.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739866; cv=none; b=NB3TykAY6yXzmDtSdwtRY5oaTr4Bxas7WjTGAf/0LoI7UDerimE47t902Fx9pZbeioHb+3x8l87hd/6KWQcmfc4hkjeagBgFeBgSq4aEM3jImb5v50OWlV3z5AROmtTSRLgH22Sl6Cxjpo4ZqFtv6vMQ60FGRpcSxCKhsjs2Olc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739866; c=relaxed/simple;
	bh=7kvgcqUb0q72lHsnUnGXc/n4pp+NNYs5xUg8eB88u2U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ku2b+J54brt+CQK0F8ZMZYGHoj9g7+6p8oKJSrdYO0BJdsP20ZdwCBn1bXzrmV9OVEv/fPw5ZftmriLm2b5YCTwLwvHP3AeBEimrTZnaYByYSUY6HCDy+P5XVCS2wAE8EJ7rdJTkEQRNh6FB6tvwZYTiSX1+ky2p6W3hsmdBBCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at; spf=pass smtp.mailfrom=emfend.at; dkim=pass (1024-bit key) header.d=emfend.at header.i=@emfend.at header.b=pY4wToIH; arc=none smtp.client-ip=168.119.41.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=emfend.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=emfend.at
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=emfend.at;
	 s=mail; h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Gxa5oyKdwl4x0/GtyVPZyS0ssnw6tcIuSW7KhSQsAeI=; b=pY4wToIHOo9e57UcICzk5J/civ
	jXgUR5KCPR/egZ78baEbt6mArrc4AMhomK4G+B/HHNPZFRRu8UM5YWG2C+CwllcAJd2krSIEwcn8A
	I1d2OTZuAZIdxxfMBoc/IhQHgQFxZBzsBzlYIQsH088cV3ZjtkCZaTbVBQfG6cNaV8Yw=;
Received: from 194-208-208-245.tele.net ([194.208.208.245]:63536 helo=[127.0.1.1])
	by lx20.hoststar.hosting with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <matthias.fend@emfend.at>)
	id 1tnxed-00Dtva-2A; Fri, 28 Feb 2025 11:31:39 +0100
From: Matthias Fend <matthias.fend@emfend.at>
Subject: [PATCH 0/2] Support for Texas Instruments TPS6131X flash LED
 driver
Date: Fri, 28 Feb 2025 11:31:22 +0100
Message-Id: <20250228-leds-tps6131x-v1-0-d1071d90f9ea@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHqQwWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyNz3ZzUlGLdkoJiM0NjwwrdRHMTY3MLC+NUEwMDJaCegqLUtMwKsHn
 RsbW1AMaRfRBfAAAA
X-Change-ID: 20250227-leds-tps6131x-a7437883e400
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Matthias Fend <matthias.fend@emfend.at>, 
 bsp-development.geo@leica-geosystems.com
X-Mailer: b4 0.14.2
X-Spam-Score: 
X-Spam-Bar: 
X-Spam-Report: 

The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
stage is capable of supplying a maximum total current of roughly 1500mA.
The TPS6131x provides three constant-current sinks, capable of sinking up
to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
each sink (LED1, LED2, LED3) supports currents up to 175m

Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
---
Matthias Fend (2):
      dt-bindings: leds: add Texas Instruments TPS6131x flash LED driver
      leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver

 .../devicetree/bindings/leds/ti,tps6131x.yaml      | 123 ++++
 MAINTAINERS                                        |   7 +
 drivers/leds/flash/Kconfig                         |  11 +
 drivers/leds/flash/Makefile                        |   1 +
 drivers/leds/flash/leds-tps6131x.c                 | 798 +++++++++++++++++++++
 5 files changed, 940 insertions(+)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250227-leds-tps6131x-a7437883e400

Best regards,
-- 
Matthias Fend <matthias.fend@emfend.at>


