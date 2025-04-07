Return-Path: <linux-leds+bounces-4432-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49025A7DE1B
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 14:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C14C179ED8
	for <lists+linux-leds@lfdr.de>; Mon,  7 Apr 2025 12:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC3D82512DB;
	Mon,  7 Apr 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UbxisBFp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B06B0250C1E;
	Mon,  7 Apr 2025 12:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744030077; cv=none; b=iYROg6uEW5SP8WWdhd4EOzzQYPp7rrRlC10LoX0K7lNiATq0FM6HhqxFUylVYvTf0vu6iluNjHIkpShnoPgrFMDbM5dc1bBnZHRpWO811/6BEMZNMdOacVAVVkDdHeQ7xKTgOZdXAIPGWMJfrbyP0YxCzBHxtkv8v5BW606ej2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744030077; c=relaxed/simple;
	bh=8pg0IaAVYZFUC95tFMo4ZQZdSqJpqLsdAE8soxBwgso=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=UXD2GQzUoG8tqxtmtnjGEu/Ocy+udXlZ673d2TSjz0b6rfrFoPODz4eGu2iyyml0Nl0SSCCkzpJOEFQQBTjeys9PLnaI/HD8nepd14dEgHOcNQPVFkDWOhGvtHdazagbRGBzHVdMVc77NMqCA+OxxUOE9kjEpPivTcFsaqhbeBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UbxisBFp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F03C4CEE9;
	Mon,  7 Apr 2025 12:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744030077;
	bh=8pg0IaAVYZFUC95tFMo4ZQZdSqJpqLsdAE8soxBwgso=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UbxisBFpNniJeAn7s9ciXKDlEKSn/dko3/G/IS+qreBSlrZFvLpLIoWyOo/ODkv3L
	 9WMEdeDouKvLldhEuhRmz1JWi+bXlpR4+93pLOuikjUeIF2ZADnUw4cuYkudNOqA76
	 3RZBptpjE/B1jV4TatHbuEhXQN2OPaXUYgG/AoiaMPQ3Qp+fKF/HLM5GJk8TjArEwF
	 +BNmcpSqQtSmVktigkF/+RFaU483DWFH+6fuB8goi95RgFcwUSKSUbdDmiNyGNdvCr
	 +6pIvlzB6AiwxmDkyC+ENxNt9x0HgPZ5lcCB5WeZMbLQOlm/gf/8/HNZXtQ1b2vD+2
	 0qa24HwMDP3rA==
Date: Mon, 07 Apr 2025 07:47:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: pavel@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, 
 corbet@lwn.net, linux-kernel@vger.kernel.org, lee@kernel.org, 
 linux-leds@vger.kernel.org, krzk+dt@kernel.org
To: Nam Tran <trannamatk@gmail.com>
In-Reply-To: <20250405183246.198568-1-trannamatk@gmail.com>
References: <20250405183246.198568-1-trannamatk@gmail.com>
Message-Id: <174402971830.1782904.14648060042339616468.robh@kernel.org>
Subject: Re: [PATCH v4 0/5] leds: add new LED driver for TI LP5812


On Sun, 06 Apr 2025 01:32:41 +0700, Nam Tran wrote:
> This patch series adds support for the Texas Instruments LP5812 LED driver.
> Patch 1 adds the Device Tree (DT) bindings documentation.
> Patch 2 introduces the core driver implementation.
> Patch 3 adds documentation of sysfs ABI interfaces.
> Patch 4 adds Driver documentation in reStructuredText format.
> Patch 5 adds the LP5812 device tree node for Raspberry Pi 4B.
> 
> Changes in v4:
> - Merge leds-lp5812-common.c into leds-lp5812.c
> - Implemented the core of aeu_pwm[1-4]_{store, show}()
> - Used kstrdup() instead of kmalloc() for allocating characters array
> - Add sysfs ABI documentation
> - Updated device tree binding documentation
> 
> Best regards,
> Nam
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.14-1107-g406fad7698f5 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/broadcom/' for 20250405183246.198568-1-trannamatk@gmail.com:

arch/arm/boot/dts/broadcom/bcm2836-rpi-2-b.dtb: /soc/i2s@7e203000: failed to match any schema with compatible: ['brcm,bcm2835-i2s']






