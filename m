Return-Path: <linux-leds+bounces-4029-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADFE7A3DE3D
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 16:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E4AC7AA78F
	for <lists+linux-leds@lfdr.de>; Thu, 20 Feb 2025 15:13:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982DC1F4735;
	Thu, 20 Feb 2025 15:14:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RJndwkrS"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB901D54CF;
	Thu, 20 Feb 2025 15:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064486; cv=none; b=akuxeEawN3YJ3QkOu58g53eZnTEl3OWvmPqQK5aSCLE8czbEP9/QSkFKzniEU5FjeWLbMR/qpV5o4iAIXiV51Xc8nS25Iw0JGbyZbCv4h1XdFDFsMsqfYzZ4pgUVjJHagzPQu8sb7+Rz4fb/v93X9ZyN6AK/E70O9XFfoAv+uhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064486; c=relaxed/simple;
	bh=Jr4RZS/lLGSYYUJMf0yeHvt9Tqeg9FKGi1tgzkVvkgg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mkYciYDAwhWtzhLDvv6JJF+L5Q0B2tm+aewrW2x9w4QNCl7mexMxmEtKNelkH+3wdqmO8hCw2XMU6AcEcexgHYI/3ky9DMfAQI3kpIbYRXtFwm5F/FmxHPlzlJIWhpEOm+nmjxcH0sbRzM3/kSuouac/xuFVOA4ek182dtTD1FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJndwkrS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79472C4CED1;
	Thu, 20 Feb 2025 15:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740064485;
	bh=Jr4RZS/lLGSYYUJMf0yeHvt9Tqeg9FKGi1tgzkVvkgg=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=RJndwkrSKfX2mzgsQQfynKTyajKX/j2plUbo3YFVKpm6aUFT7VYdMyzN9qc34fllF
	 7usoiCpSQRkDI2NbiDYsqOd0eh2mNUMaYXUCtamP42vvZ/ry+f90XctS7/3vs3KeNA
	 1kSzKEL8di2BgD4lgYWeTWUvZ0EnXfU3XDtITFQDIGjVPovtntDywBA1ISKrizZWsR
	 Q2kbp3LTNV7fOllQy2ZsHa2M4pXotics8y1Yoe0nOTBTXSBTEE/SqXNQehkXkPnvVk
	 7cexNoowoVyRuleDw/cDnHkffNBKU8p8KVbqGcl/gXCxGx8DVB+ZWi2uJxWiE86JmD
	 PFUoUjgDiOmeQ==
From: Lee Jones <lee@kernel.org>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250214040306.16312-1-towinchenmi@gmail.com>
References: <20250214040306.16312-1-towinchenmi@gmail.com>
Subject: Re: [PATCH v6 0/3] Apple DWI backlight driver
Message-Id: <174006448223.804925.7595809321241346941.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 15:14:42 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Fri, 14 Feb 2025 12:02:11 +0800, Nick Chan wrote:
> Apple SoCs come with a 2-wire interface named DWI. On some iPhones, iPads
> and iPod touches the backlight controller is connected via this interface.
> This series adds a backlight driver for backlight controllers connected
> this way.
> 
> Changes since v5:
> - Remove default y from drivers/video/backlight/Kconfig
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add Apple DWI backlight
      commit: 0508d17506fffb6d38df4c2dc737fb4f343a0840
[2/3] backlight: apple_dwi_bl: Add Apple DWI backlight driver
      commit: ea45d216dd4e5b389af984f8c9effa1312e3cd74
[3/3] MAINTAINERS: Add entries for Apple DWI backlight controller
      commit: d1ebaf003a065d5d337b8fa3d69f9b90d7bb759d

--
Lee Jones [李琼斯]


