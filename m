Return-Path: <linux-leds+bounces-4100-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 435A8A4657E
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 16:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E9EE17E808
	for <lists+linux-leds@lfdr.de>; Wed, 26 Feb 2025 15:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DABDC22256E;
	Wed, 26 Feb 2025 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VYxYxlbU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF31F2222A6;
	Wed, 26 Feb 2025 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740584530; cv=none; b=BfXseT1OrnRlX0wJFAtyW1lF8k3FEkWjxenHKZ0l4TcG0TTehpAEDu8gMMK6ReM2FBHgRMcG0y6SDEOpSHGN6iBMghXGV+qIAOqtVavN+Cnh36OizsCIY6/9Ds1DwS5SUhzw/lZVJUSgydWPsM7KHhiUihO+4vN/JUnn8ekTVdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740584530; c=relaxed/simple;
	bh=huXQpBhuM1kfilitAZHRzwO77flxXbmFTFSXnv1mATE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=KPGNoOyx0KQd8z0z9fMF07U7ohp1/cIi3yFEzOE4IhQwI8ZxBNW2jmKa4KKP/lF7EPsITX/AqfEnWfQcIjQ9hfKzG0EIEpC3KRMlxPfH4ilH90kzjFKZYFfF6DOFARftJaAXaA7bN5Y8uLb14zzlmqXn62Uwjz+uWGa5fY3Hncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VYxYxlbU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09210C4CEE4;
	Wed, 26 Feb 2025 15:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740584530;
	bh=huXQpBhuM1kfilitAZHRzwO77flxXbmFTFSXnv1mATE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=VYxYxlbU0L5HY5wcEVvO7pVIY2iRaFA9QMwOVFz9bUQSg2UWtdlLnR/NjsNKvr/i+
	 BK8hB0HjGeAne2tWsnAXz1Wcdca/Ltz+YJ2RjtoBZk9tSzqDNPu7XIJSrORHs86PVV
	 VKyEjGN9KeP4oSSx/6cR7F/YN7SRjxiFZIRD8/L+JHWMAOrK9K508IgKjxFhb5PsCC
	 p57/7zWtjmFGUzgjwRxAMMiwTiCdk4ktqEBEqB+zvgz2BWss/Fz4RMGXxA3zBQk+lP
	 FtseonvJ3v1f7+UVRlzCRWLmTk3powzu7IECyOgW2nMmsU0E/aj47c8O0B7RVrlN8M
	 /6MggL1uzjfiQ==
Date: Wed, 26 Feb 2025 09:42:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, pavel@kernel.org, conor+dt@kernel.org, 
 lee@kernel.org, krzk+dt@kernel.org
To: Nam Tran <trannamatk@gmail.com>
In-Reply-To: <20250225170601.21334-1-trannamatk@gmail.com>
References: <20250225170601.21334-1-trannamatk@gmail.com>
Message-Id: <174058435900.2478640.10516296167276043499.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] leds: add new LED driver for TI LP5812


On Wed, 26 Feb 2025 00:05:59 +0700, Nam Tran wrote:
> From: Nam Tran <trannamatk@gmail.com>
> To: Pavel Machek <pavel@kernel.org>, Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
> Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
> 
> This patch series adds support for the Texas Instruments LP5812 LED driver.
> Patch 1 adds the Device Tree (DT) bindings documentation.
> Patch 2 introduces the core driver implementation.
> 
> The LP5812 is an I2C-controlled LED driver capable of driving up to 4 LEDs with independent brightness control and pattern programming.
> This driver provides support through the Linux LED framework and includes device tree bindings for proper integration.
> 
> This driver has been tested on Raspberry Pi 4 B using kernel version 6.14.0.
> 
> I kindly request feedback from the community to ensure that this driver adheres to the Linux LED subsystem standards.
> 
> Thank you for your consideration.
> 
> Best regards,
> Nam
> 
> ---
> 
> Changes in v2:
> - Renamed DT bindings file from `leds-lp5812.yaml` to `ti,lp5812.yaml`.
> - Added LP5812 device tree node to `bcm2711-rpi-4b.dts` for Raspberry Pi 4B.
> - Updated core driver implementation to fix build errors in kernel version 6.14.0-rc4. (The v1 patch was only compatible with kernel version 6.1.93)
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250225170601.21334-1-trannamatk@gmail.com:

arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: /soc/i2c@7e804000/lp5812@1b: failed to match any schema with compatible: ['ti,lp5812']
arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: /soc/i2c@7e804000/lp5812@1b: failed to match any schema with compatible: ['ti,lp5812']






