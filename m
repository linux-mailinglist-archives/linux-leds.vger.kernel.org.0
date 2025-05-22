Return-Path: <linux-leds+bounces-4696-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB2AC06FA
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 10:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 476A39E1C0D
	for <lists+linux-leds@lfdr.de>; Thu, 22 May 2025 08:24:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4073C25B66D;
	Thu, 22 May 2025 08:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBoMbNjW"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EAA24EF8C;
	Thu, 22 May 2025 08:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747902270; cv=none; b=pxQDuv9I0AHrRJHYBPpi93o5nhwc66srblEILNvicj3sTJ7u/xktwlLQHDRTOJONkbGz53hEPpgDxg88m+0+LXGlJtSAy/Z3OD278GNhjaoVEaTxrhG2Xq/LiZRoK/db7Hc6YiXdtnaZLuaraWrhsnLaMxyulGbnbeDOaG7Xtis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747902270; c=relaxed/simple;
	bh=DizkJHYZ1CgEO+V0Smq2zv9ucg5Zg07spjgOPbbPeQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TqwC1GLiNmOXJMonnP9WNlLZEDbpFSrNOZRb5PkX6x61AqqsMUjG0yJ1Olil7JzTbTVX1b2gl0an/bhK/+nFncORrnwg9ldSCSOLgh4fIiLlT6cft1lDFcgCTKlrO/EFKRe/nuMnkGGISkLxX7mb6+93cHEJXWrcVbb4LiH+xa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBoMbNjW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990FDC4CEE4;
	Thu, 22 May 2025 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747902269;
	bh=DizkJHYZ1CgEO+V0Smq2zv9ucg5Zg07spjgOPbbPeQI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cBoMbNjW6vGM6uq9rvwzVisbWvVb2zFhxAEKwKWI7Gd5aY3fu+t0ZsvTfDPiwtNTp
	 aNUA5jFqZ308LoTlJYMpgmVg53gImWpuFJgNNUsUcQ8tVa2fQlJ0/lKcb8JHFiwuQT
	 RnEtAW3HlaRO5E8eSd6MV2iggoHYGzurxNY91FCee8+WwMBwSrTCThcOOIz1q48PIT
	 OcFZMhjfl2Jy/b/pYXSBgokLVmA2f6x5+4MWfMEH2QvF+ge3dNcPIMlPInYONGKMeZ
	 UTEZYTu7kErnjXIC7t6HCm3lZyPril3FL/I/zZSDTNtgU01RmtcSYu8/koQiT5sYEU
	 fHB1Xev5VgNGg==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Matthias Fend <matthias.fend@emfend.at>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
In-Reply-To: <20250514-leds-tps6131x-v5-2-a4fb9e7f2c47@emfend.at>
References: <20250514-leds-tps6131x-v5-0-a4fb9e7f2c47@emfend.at>
 <20250514-leds-tps6131x-v5-2-a4fb9e7f2c47@emfend.at>
Subject: Re: (subset) [PATCH v5 2/2] leds: tps6131x: add support for Texas
 Instruments TPS6131X flash LED driver
Message-Id: <174790226736.1225719.12154527587513247088.b4-ty@kernel.org>
Date: Thu, 22 May 2025 09:24:27 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-b75d9

On Wed, 14 May 2025 12:10:08 +0200, Matthias Fend wrote:
> The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
> stage is capable of supplying a maximum total current of roughly 1500mA.
> The TPS6131x provides three constant-current sinks, capable of sinking up
> to 2 x 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
> each sink (LED1, LED2, LED3) supports currents up to 175mA.
> 
> 
> [...]

Applied, thanks!

[2/2] leds: tps6131x: add support for Texas Instruments TPS6131X flash LED driver
      commit: 5a2c42a172f92a84ee15efbd630211c4a2817494

--
Lee Jones [李琼斯]


