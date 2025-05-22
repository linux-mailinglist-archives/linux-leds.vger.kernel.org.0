Return-Path: <linux-leds+bounces-4697-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE7BAC06FC
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 10:24:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39C474E3776
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 08:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB0F3268C43;
	Thu, 22 May 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nz7WXTFy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37252686BD;
	Thu, 22 May 2025 08:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902272; cv=none; b=hKeJflPsJJeo6my5UfMihvFZtJnUi0P2kfX8tRKCWG/OHDQeRAUMvmuwuCesT8ZtmKsLc8wQJ84zCsHLlSoWwE8D+03smVIuueSMZnsOYEzeTKiW99ZUzh6eQKV0FxX2DgOsm8uglI7BaCL6p23ohZmd2kXaaR62/nXHtZNapW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902272; c=relaxed/simple;
	bh=e4Ftcx+wfDRLstIURfiVk2131DOpS0+efwKMLqQw9NQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oIsEeYit2Yc+lCE+ZjzI53TiYUBRMM3++WPb0GmePSrGVfL2pg4DWW2JYrMnR96V+DBBu/qc5IKakWdxxSuUZ4drFtA1nQdbqrmuF8vXpicmhq8PFZXfFPE945/sQy+r5jU2FH742BtgYSLdJHSUxCHWPlHYNd5PS+0e6bGm4Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nz7WXTFy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11206C4CEED;
	Thu, 22 May 2025 08:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747902272;
	bh=e4Ftcx+wfDRLstIURfiVk2131DOpS0+efwKMLqQw9NQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Nz7WXTFy4uTxNsGh2Zrtfbd0oCzxl4tS9k+3SFDHp3L1WVIWINOc65vxQ+MhGl576
	 ndMZeca6Qn3OjXf03ZAgb8dF3kPl0KRqG8Y7VhjKhnySNGQc33Q1SydL2DE/4gIoBq
	 m4TtutdPXQspmRK7GVluIyPBkNuPxO2OHaKQgs5B1z9p5ivPDDvigYh8ohVHtK3nmj
	 Ha3KPbVfC3Dkk7Gp/600WA4L5Q/iXcVAhYzQSlGqFq+bJvneVpgFvHRHSYxpjwdcEm
	 q2jtu7Nid2vG7SQGKK9S7WiQ0HGrU0ZCHF4PufKp+r1iN/OysZ4KCHoqw+t4ez+Rl3
	 ag2oGNHtp64KA==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250514-leds-tps6131x-v5-0-a4fb9e7f2c47@emfend.at>
References: <20250514-leds-tps6131x-v5-0-a4fb9e7f2c47@emfend.at>
Subject: Re: [PATCH v5 0/2] Support for Texas Instruments TPS6131X flash
 LED driver
Message-Id: <174790226982.1225719.17976320930006783917.b4-ty@kernel.org>
Date: Thu, 22 May 2025 09:24:29 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Wed, 14 May 2025 12:10:06 +0200, Matthias Fend wrote:
> The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
> stage is capable of supplying a maximum total current of roughly 1500mA.
> The TPS6131x provides three constant-current sinks, capable of sinking up
> to 2 x 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
> each sink (LED1, LED2, LED3) supports currents up to 175m
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: leds: add Texas Instruments TPS6131x flash LED driver
      commit: 7790a4d11969fdcc0acf1ad2c59f1f9289b3dbbe
[2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
      commit: 5a2c42a172f92a84ee15efbd630211c4a2817494

--
Lee Jones [李琼斯]


